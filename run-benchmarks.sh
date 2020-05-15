#!/bin/bash

stack install || { echo "build failed" ; exit 1 ; }

run() {
    local name=$strategy-b$bytes-t$threads-c$chunk.eventlog
    eventslog-benchmark +RTS -l -ol$name || { echo "failed on $name" ; exit 1 ; }
}

export bytes=${bytes:-$[1024*1024]}

for strategy in ${strategies:-LoadWithBinary LoadWithUnsafe LoadWithUnsafe8 LoadWithByteString8 LoadWithText LoadWithString} ; do
    export strategy
    for threads in ${lthreads:-1 2 4 8 16 32} ; do
        export threads
        for chunk in ${chunks:-1 2 4 64 128 1024 2048 4096 8192} ; do
            export chunk
            run
        done
    done
done

ls -lh *-b*-t*-c*.eventlog
rm *-b*-t*-c*.eventlog
