# eventslog-benchmark

Observation how eventslog file size footprint and execution time changes
with variation of threads and chunk size with fixed data written
into eventslog.


```
# all cases
./run-benchmarks.sh

# specific
threads=1 chunks="128 1024" ./run-benchmarks.sh
```
