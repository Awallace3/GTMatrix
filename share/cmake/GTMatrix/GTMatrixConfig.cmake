# GTMatrixConfig.cmake

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.5)
project(GTMatrix LANGUAGES C)

# include("${CMAKE_CURRENT_LIST_DIR}/GTMatrixTargets.cmake")
# Set the include directory
set(GTMatrix_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../include")

# Set the library path
set(GTMatrix_LIBRARY "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libGTMatrix.a")

# You can set this if you want to make it easy to link to the library
set(GTMatrix_LIBRARIES "${GTMatrix_LIBRARY}")
set(GTMatrix_INCLUDE_DIRS "${GTMatrix_INCLUDE_DIR}")

