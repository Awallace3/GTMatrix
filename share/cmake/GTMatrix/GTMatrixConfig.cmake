# GTMatrixConfig.cmake

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.5)

# Define the project and the dependent C/C++ standards
project(GTMatrix LANGUAGES C)
set(CMAKE_C_STANDARD 99)

# Optionally, find the MPI package
find_package(MPI REQUIRED)

# Source files
set(GTMatrix_SRC
    ${CMAKE_CURRENT_LIST_DIR}/../../../GTMatrix_Typedef.c
    ${CMAKE_CURRENT_LIST_DIR}/../../../GTMatrix_Get.c
    ${CMAKE_CURRENT_LIST_DIR}/../../../GTMatrix_Update.c
    ${CMAKE_CURRENT_LIST_DIR}/../../../GTMatrix_Other.c
    ${CMAKE_CURRENT_LIST_DIR}/../../../GTM_Req_Vector.c
    ${CMAKE_CURRENT_LIST_DIR}/../../../GTM_Task_Queue.c
    ${CMAKE_CURRENT_LIST_DIR}/../../../utils.c
)

# Include the MPI includes
include_directories(${MPI_C_INCLUDE_PATH}
    ${CMAKE_CURRENT_LIST_DIR}/../../../
    )

# Set the compiler options
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wunused-variable -g -O3")

add_library(GTMatrix STATIC ${GTMatrix_SRC})
#target_compile_features(GTMatrix PRIVATE c_std_11)
