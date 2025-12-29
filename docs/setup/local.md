# Local setup

## Requirements

- CMake 3.16+
- Ninja (recommended)
- C++17 compiler (GCC/Clang)
- ROOT (optional for the I/O exercise)
- Python 3 (for some scripts and docs)

## Build

```bash
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build build -j$(nproc)
ctest --test-dir build --output-on-failure
```

## Sanitizers

```bash
cmake -B build-asan -G Ninja -DCMAKE_BUILD_TYPE=Debug -DENABLE_SANITIZERS=ON
cmake --build build-asan -j$(nproc)
ctest --test-dir build-asan --output-on-failure
```
