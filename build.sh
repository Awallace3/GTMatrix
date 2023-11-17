rm -r build
mkdir -p build && cd build
cmake -G Ninja .. -DCMAKE_INSTALL_PREFIX=../../deps -DCMAKE_C_COMPILER=icx
ninja install
cd ..
