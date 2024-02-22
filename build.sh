rm -r build
rm -r include
rm -r lib
export CPATH=/usr/include/x86_64-linux-gnu:$CPATH
mkdir -p build && cd build
# cmake -G Ninja .. -DCMAKE_INSTALL_PREFIX=.. -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx -DMPI_C_COMPILER=mpiicx -DMPI_CXX_COMPILER=mpiicpx
cmake -G Ninja .. -DCMAKE_INSTALL_PREFIX=.. -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DMPI_C_COMPILER=mpiicc -DMPI_CXX_COMPILER=mpiicpc
ninja install
cd ..
