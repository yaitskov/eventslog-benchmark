# eventslog-benchmark

Observation how eventslog file size footprint and execution time changes
with variation of threads and chunk size and message format
(String, Text, ByteString, Unsafe) with fixed data written into eventslog.


```
# all cases
./run-benchmarks.sh

# specific
threads=1 chunks="128 1024" ./run-benchmarks.sh
```
