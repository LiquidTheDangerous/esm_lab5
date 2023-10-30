# esm_lab5
### Requirements
- UNIX like OS x64
- cmake version >= 3.20
- nasm compiler version >= 2.15.05
- gcc compiler version >=  11.4.0
### Build and execution
1. configure cmake
in source dir:
```
cmake -S . -B ./build -DCMAKE_BUILD_TYPE=Debug
```
2. build
```
cmake --build ./build
```
3. run
```
./build/main
```
