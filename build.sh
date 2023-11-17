rm -r build
mkdir -p build && cd build
cmake -G Ninja .. -DCMAKE_INSTALL_PREFIX=.. -DCMAKE_C_COMPILER=icx
ninja install
cd ..
