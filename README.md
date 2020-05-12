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

```
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0xb4
cpu MHz		: 800.016
cache size	: 6144 KB

benchmark [      LoadWithUnsafe-b1048576-t001-c0004] lasted for cpu   47.98 ms real 57.72 ms
benchmark [      LoadWithUnsafe-b1048576-t001-c0064] lasted for cpu    6.17 ms real 6.16 ms
benchmark [      LoadWithUnsafe-b1048576-t001-c1024] lasted for cpu    2.44 ms real 2.39 ms
benchmark [      LoadWithUnsafe-b1048576-t002-c0004] lasted for cpu   46.19 ms real 46.00 ms
benchmark [      LoadWithUnsafe-b1048576-t002-c0064] lasted for cpu    8.63 ms real 8.54 ms
benchmark [      LoadWithUnsafe-b1048576-t002-c1024] lasted for cpu    2.23 ms real 2.18 ms
benchmark [      LoadWithUnsafe-b1048576-t004-c0004] lasted for cpu   38.93 ms real 46.26 ms
benchmark [      LoadWithUnsafe-b1048576-t004-c0064] lasted for cpu    6.04 ms real 6.13 ms
benchmark [      LoadWithUnsafe-b1048576-t004-c1024] lasted for cpu    2.59 ms real 2.57 ms
benchmark [      LoadWithUnsafe-b1048576-t008-c0004] lasted for cpu   57.68 ms real 57.51 ms
benchmark [      LoadWithUnsafe-b1048576-t008-c0064] lasted for cpu    6.21 ms real 6.21 ms
benchmark [      LoadWithUnsafe-b1048576-t008-c1024] lasted for cpu    2.59 ms real 2.53 ms
benchmark [      LoadWithUnsafe-b1048576-t016-c0004] lasted for cpu   77.62 ms real 83.54 ms
benchmark [      LoadWithUnsafe-b1048576-t016-c0064] lasted for cpu    6.16 ms real 6.15 ms
benchmark [      LoadWithUnsafe-b1048576-t016-c1024] lasted for cpu    2.60 ms real 2.55 ms
benchmark [      LoadWithUnsafe-b1048576-t032-c0004] lasted for cpu   50.34 ms real 50.25 ms
benchmark [      LoadWithUnsafe-b1048576-t032-c0064] lasted for cpu    7.88 ms real 9.94 ms
benchmark [      LoadWithUnsafe-b1048576-t032-c1024] lasted for cpu    1.77 ms real 1.76 ms
benchmark [     LoadWithUnsafe8-b1048576-t001-c0004] lasted for cpu   31.92 ms real 31.85 ms
benchmark [     LoadWithUnsafe8-b1048576-t001-c0064] lasted for cpu    5.76 ms real 5.73 ms
benchmark [     LoadWithUnsafe8-b1048576-t001-c1024] lasted for cpu    2.24 ms real 2.19 ms
benchmark [     LoadWithUnsafe8-b1048576-t002-c0004] lasted for cpu   44.62 ms real 44.42 ms
benchmark [     LoadWithUnsafe8-b1048576-t002-c0064] lasted for cpu    5.09 ms real 5.03 ms
benchmark [     LoadWithUnsafe8-b1048576-t002-c1024] lasted for cpu    2.48 ms real 2.40 ms
benchmark [     LoadWithUnsafe8-b1048576-t004-c0004] lasted for cpu   91.86 ms real 91.51 ms
benchmark [     LoadWithUnsafe8-b1048576-t004-c0064] lasted for cpu    6.23 ms real 6.12 ms
benchmark [     LoadWithUnsafe8-b1048576-t004-c1024] lasted for cpu    2.71 ms real 2.69 ms
benchmark [     LoadWithUnsafe8-b1048576-t008-c0004] lasted for cpu   48.06 ms real 49.32 ms
benchmark [     LoadWithUnsafe8-b1048576-t008-c0064] lasted for cpu    6.48 ms real 6.44 ms
benchmark [     LoadWithUnsafe8-b1048576-t008-c1024] lasted for cpu    3.57 ms real 10.81 ms
benchmark [     LoadWithUnsafe8-b1048576-t016-c0004] lasted for cpu   20.25 ms real 20.21 ms
benchmark [     LoadWithUnsafe8-b1048576-t016-c0064] lasted for cpu    2.92 ms real 2.90 ms
benchmark [     LoadWithUnsafe8-b1048576-t016-c1024] lasted for cpu    2.78 ms real 2.76 ms
benchmark [     LoadWithUnsafe8-b1048576-t032-c0004] lasted for cpu   48.23 ms real 48.22 ms
benchmark [     LoadWithUnsafe8-b1048576-t032-c0064] lasted for cpu    6.34 ms real 6.26 ms
benchmark [     LoadWithUnsafe8-b1048576-t032-c1024] lasted for cpu    1.86 ms real 1.81 ms
benchmark [ LoadWithByteString8-b1048576-t001-c0004] lasted for cpu   72.02 ms real 71.86 ms
benchmark [ LoadWithByteString8-b1048576-t001-c0064] lasted for cpu    9.43 ms real 9.32 ms
benchmark [ LoadWithByteString8-b1048576-t001-c1024] lasted for cpu    3.91 ms real 3.85 ms
benchmark [ LoadWithByteString8-b1048576-t002-c0004] lasted for cpu   61.84 ms real 61.68 ms
benchmark [ LoadWithByteString8-b1048576-t002-c0064] lasted for cpu    4.38 ms real 4.36 ms
benchmark [ LoadWithByteString8-b1048576-t002-c1024] lasted for cpu    5.41 ms real 10.65 ms
benchmark [ LoadWithByteString8-b1048576-t004-c0004] lasted for cpu   29.40 ms real 29.36 ms
benchmark [ LoadWithByteString8-b1048576-t004-c0064] lasted for cpu    9.71 ms real 9.64 ms
benchmark [ LoadWithByteString8-b1048576-t004-c1024] lasted for cpu    4.31 ms real 4.30 ms
benchmark [ LoadWithByteString8-b1048576-t008-c0004] lasted for cpu   54.74 ms real 54.69 ms
benchmark [ LoadWithByteString8-b1048576-t008-c0064] lasted for cpu    9.34 ms real 9.26 ms
benchmark [ LoadWithByteString8-b1048576-t008-c1024] lasted for cpu    5.82 ms real 6.50 ms
benchmark [ LoadWithByteString8-b1048576-t016-c0004] lasted for cpu   64.22 ms real 64.02 ms
benchmark [ LoadWithByteString8-b1048576-t016-c0064] lasted for cpu   10.64 ms real 10.53 ms
benchmark [ LoadWithByteString8-b1048576-t016-c1024] lasted for cpu    4.26 ms real 4.21 ms
benchmark [ LoadWithByteString8-b1048576-t032-c0004] lasted for cpu   36.64 ms real 38.42 ms
benchmark [ LoadWithByteString8-b1048576-t032-c0064] lasted for cpu   17.92 ms real 17.93 ms
benchmark [ LoadWithByteString8-b1048576-t032-c1024] lasted for cpu    1.50 ms real 1.47 ms
benchmark [        LoadWithText-b1048576-t001-c0004] lasted for cpu   92.21 ms real 91.93 ms
benchmark [        LoadWithText-b1048576-t001-c0064] lasted for cpu    9.29 ms real 9.25 ms
benchmark [        LoadWithText-b1048576-t001-c1024] lasted for cpu    7.03 ms real 6.96 ms
benchmark [        LoadWithText-b1048576-t002-c0004] lasted for cpu   70.64 ms real 70.43 ms
benchmark [        LoadWithText-b1048576-t002-c0064] lasted for cpu   14.24 ms real 14.18 ms
benchmark [        LoadWithText-b1048576-t002-c1024] lasted for cpu    7.11 ms real 7.07 ms
benchmark [        LoadWithText-b1048576-t004-c0004] lasted for cpu   64.13 ms real 63.90 ms
benchmark [        LoadWithText-b1048576-t004-c0064] lasted for cpu   14.24 ms real 14.19 ms
benchmark [        LoadWithText-b1048576-t004-c1024] lasted for cpu    7.18 ms real 7.06 ms
benchmark [        LoadWithText-b1048576-t008-c0004] lasted for cpu   47.59 ms real 47.60 ms
benchmark [        LoadWithText-b1048576-t008-c0064] lasted for cpu    3.59 ms real 3.66 ms
benchmark [        LoadWithText-b1048576-t008-c1024] lasted for cpu    7.41 ms real 7.40 ms
benchmark [        LoadWithText-b1048576-t016-c0004] lasted for cpu   65.53 ms real 65.36 ms
benchmark [        LoadWithText-b1048576-t016-c0064] lasted for cpu   11.40 ms real 11.37 ms
benchmark [        LoadWithText-b1048576-t016-c1024] lasted for cpu    7.78 ms real 7.77 ms
benchmark [        LoadWithText-b1048576-t032-c0004] lasted for cpu   51.40 ms real 52.00 ms
benchmark [        LoadWithText-b1048576-t032-c0064] lasted for cpu    9.12 ms real 9.11 ms
benchmark [        LoadWithText-b1048576-t032-c1024] lasted for cpu    8.46 ms real 8.49 ms
benchmark [      LoadWithString-b1048576-t001-c0004] lasted for cpu   89.28 ms real 89.18 ms
benchmark [      LoadWithString-b1048576-t001-c0064] lasted for cpu   36.05 ms real 35.99 ms
benchmark [      LoadWithString-b1048576-t001-c1024] lasted for cpu   20.42 ms real 20.41 ms
benchmark [      LoadWithString-b1048576-t002-c0004] lasted for cpu   79.46 ms real 79.38 ms
benchmark [      LoadWithString-b1048576-t002-c0064] lasted for cpu   38.79 ms real 38.85 ms
benchmark [      LoadWithString-b1048576-t002-c1024] lasted for cpu   36.36 ms real 36.36 ms
benchmark [      LoadWithString-b1048576-t004-c0004] lasted for cpu  105.28 ms real 105.13 ms
benchmark [      LoadWithString-b1048576-t004-c0064] lasted for cpu   37.35 ms real 37.39 ms
benchmark [      LoadWithString-b1048576-t004-c1024] lasted for cpu   43.30 ms real 43.27 ms
benchmark [      LoadWithString-b1048576-t008-c0004] lasted for cpu   91.50 ms real 92.25 ms
benchmark [      LoadWithString-b1048576-t008-c0064] lasted for cpu   31.06 ms real 39.86 ms
benchmark [      LoadWithString-b1048576-t008-c1024] lasted for cpu   12.74 ms real 12.73 ms
benchmark [      LoadWithString-b1048576-t016-c0004] lasted for cpu   80.36 ms real 80.33 ms
benchmark [      LoadWithString-b1048576-t016-c0064] lasted for cpu   40.58 ms real 40.45 ms
benchmark [      LoadWithString-b1048576-t016-c1024] lasted for cpu   43.37 ms real 43.36 ms
benchmark [      LoadWithString-b1048576-t032-c0004] lasted for cpu   70.90 ms real 70.83 ms
benchmark [      LoadWithString-b1048576-t032-c0064] lasted for cpu   26.44 ms real 26.54 ms
benchmark [      LoadWithString-b1048576-t032-c1024] lasted for cpu   40.81 ms real 40.69 ms
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithByteString8-b1048576-t16-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithByteString8-b1048576-t16-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithByteString8-b1048576-t16-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithByteString8-b1048576-t1-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithByteString8-b1048576-t1-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithByteString8-b1048576-t1-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithByteString8-b1048576-t2-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithByteString8-b1048576-t2-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithByteString8-b1048576-t2-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithByteString8-b1048576-t32-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithByteString8-b1048576-t32-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithByteString8-b1048576-t32-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithByteString8-b1048576-t4-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithByteString8-b1048576-t4-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithByteString8-b1048576-t4-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithByteString8-b1048576-t8-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithByteString8-b1048576-t8-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithByteString8-b1048576-t8-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithString-b1048576-t16-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithString-b1048576-t16-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithString-b1048576-t16-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithString-b1048576-t1-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithString-b1048576-t1-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithString-b1048576-t1-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithString-b1048576-t2-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithString-b1048576-t2-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithString-b1048576-t2-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithString-b1048576-t32-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithString-b1048576-t32-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithString-b1048576-t32-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithString-b1048576-t4-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithString-b1048576-t4-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithString-b1048576-t4-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithString-b1048576-t8-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithString-b1048576-t8-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithString-b1048576-t8-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithText-b1048576-t16-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithText-b1048576-t16-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithText-b1048576-t16-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithText-b1048576-t1-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithText-b1048576-t1-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithText-b1048576-t1-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithText-b1048576-t2-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithText-b1048576-t2-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithText-b1048576-t2-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithText-b1048576-t32-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithText-b1048576-t32-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithText-b1048576-t32-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithText-b1048576-t4-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithText-b1048576-t4-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithText-b1048576-t4-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithText-b1048576-t8-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithText-b1048576-t8-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithText-b1048576-t8-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe8-b1048576-t16-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe8-b1048576-t16-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe8-b1048576-t16-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe8-b1048576-t1-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe8-b1048576-t1-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe8-b1048576-t1-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe8-b1048576-t2-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe8-b1048576-t2-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe8-b1048576-t2-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe8-b1048576-t32-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe8-b1048576-t32-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe8-b1048576-t32-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe8-b1048576-t4-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe8-b1048576-t4-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe8-b1048576-t4-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe8-b1048576-t8-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe8-b1048576-t8-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe8-b1048576-t8-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe-b1048576-t16-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe-b1048576-t16-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe-b1048576-t16-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe-b1048576-t1-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe-b1048576-t1-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe-b1048576-t1-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe-b1048576-t2-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe-b1048576-t2-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe-b1048576-t2-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe-b1048576-t32-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe-b1048576-t32-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe-b1048576-t32-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe-b1048576-t4-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe-b1048576-t4-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe-b1048576-t4-c64.eventlog
-rw-rw-r-- 1 dan dan 1.1M May 12 14:34 LoadWithUnsafe-b1048576-t8-c1024.eventlog
-rw-rw-r-- 1 dan dan 4.1M May 12 14:34 LoadWithUnsafe-b1048576-t8-c4.eventlog
-rw-rw-r-- 1 dan dan 1.2M May 12 14:34 LoadWithUnsafe-b1048576-t8-c64.eventlog
```
