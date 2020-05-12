{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE GADTs #-}

import Control.Concurrent
import Control.Exception
import Control.Monad
import qualified Data.ByteString.Char8 as BS8
import qualified Data.ByteString as BS
import qualified Data.Text as T
import qualified Data.Text.Lazy.IO as T
import qualified Debug.Trace as TD
import qualified Debug.Trace.ByteString as TBS
import qualified Debug.Trace.Text as TT
import qualified Formatting as F
import qualified Formatting.Clock as F
import System.Clock
import System.Environment
import System.Exit

varIs :: String -> String -> IO a
varIs name suffix = do
  putStrLn $ "Env var [" ++ name ++ "] is " ++ suffix
  exitFailure

intEnvVar :: String -> IO Int
intEnvVar name = envVar name

strategyVar :: IO LoadWith
strategyVar = envVar "strategy"

envVar :: Read a => String -> IO a
envVar name = do
    varO <- lookupEnv name
    case varO of
      Just varValS ->
          catch (return $ read varValS)
                    (\(_ :: SomeException) -> varIs name $ "not number but [" ++ varValS ++ "]")
      Nothing -> varIs name "not set"

data LoadWith = LoadWithString
              | LoadWithByteString
              | LoadWithByteString8
              | LoadWithUnsafe8
              | LoadWithUnsafe
              | LoadWithText deriving (Show, Read)

data Chunk where
    TextChunk :: !T.Text -> Chunk
    ByteString8Chunk  :: !BS8.ByteString -> Chunk
    ByteStringChunk  :: !BS.ByteString -> Chunk
    StringChunk  :: !String -> Chunk

runAction :: LoadWith -> Chunk -> IO ()

runAction LoadWithString chunk =
    case chunk of
      StringChunk c -> TD.traceEventIO c
      _ -> error "oops"

runAction LoadWithByteString8 chunk =
    case chunk of
      ByteString8Chunk c -> TBS.traceEventIO c
      _ -> error "oops"

runAction LoadWithUnsafe8 chunk =
    case chunk of
      ByteString8Chunk c -> TBS.unsafeTraceEventIO c
      _ -> error "oops"

runAction LoadWithUnsafe chunk =
    case chunk of
      ByteStringChunk c -> TBS.unsafeTraceEventIO c
      _ -> error "oops"

runAction LoadWithByteString chunk =
    case chunk of
      ByteStringChunk c -> TBS.traceEventIO c
      _ -> error "oops"

runAction LoadWithText chunk =
    case chunk of
      TextChunk c -> TT.traceEventIO c
      _ -> error "oops"


createChunk :: LoadWith -> Int -> Chunk
createChunk LoadWithString chunkSize =
    StringChunk $ take chunkSize $ cycle "a"

createChunk LoadWithByteString8 chunkSize =
    ByteString8Chunk $ BS8.replicate chunkSize 'a'

createChunk LoadWithUnsafe8 chunkSize =
    ByteString8Chunk $ BS8.replicate chunkSize 'a'

createChunk LoadWithUnsafe chunkSize =
    ByteStringChunk $ BS.replicate chunkSize 65

createChunk LoadWithByteString chunkSize =
    ByteStringChunk $ BS.replicate chunkSize 65

createChunk LoadWithText chunkSize =
    TextChunk $ T.replicate chunkSize "a"

benchmark :: String -> Int -> LoadWith -> Int -> Int -> IO (TimeSpec, TimeSpec)
benchmark name bytes strategy threads chunkSize = do
  chunk <- return $ createChunk strategy chunkSize
  action <- return (runAction strategy chunk)
  putStrLn $ "Chunks per thread " ++ show chunksPerThread ++ " for " ++ name
  nTimeParRun threads (forM_ [1..chunksPerThread] $ \_ -> action)
  where
    chunksPerThread' = bytes `div` (chunkSize * threads)
    chunksPerThread = if bytes `mod` (chunkSize * threads) == 0
                      then chunksPerThread'
                      else error "Bytes is not divisible by chunkSize and threads"

nTimeParRun :: Int -> IO () -> IO (TimeSpec, TimeSpec)
nTimeParRun n action = do
  startSem <- newQSem 0
  finishSem <- newQSem 0
  forM_ [1..n] $ \_ -> do
    forkIO $ do
      bracket_ (waitQSem startSem) (signalQSem finishSem) action
  threadDelay 1000_000
  startedAt <- getTime ProcessCPUTime
  forM_ [1..n] $ \_ -> signalQSem startSem
  forM_ [1..n] $ \_ -> waitQSem finishSem
  endedAt <- getTime ProcessCPUTime
  return (endedAt, startedAt)

main :: IO ()
main = do
  strategy <- strategyVar
  bytes <- intEnvVar "bytes"
  threads <- intEnvVar "threads"
  chunkSize <- intEnvVar "chunk"
  let name = show strategy ++ "-b" ++ show bytes ++ "-t"
             ++ show threads ++ "-c" ++ show chunkSize
  (endedAt, startedAt) <- benchmark name bytes strategy threads chunkSize
  let tpl = ("benchmark [" F.% F.string F.% "] lasted for " F.% F.timeSpecs)
  let out = F.format tpl name startedAt endedAt
  T.putStrLn out
