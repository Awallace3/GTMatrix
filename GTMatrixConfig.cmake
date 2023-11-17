# GTMatrixConfig.cmake

# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.0)

# Define the project and the dependent C/C++ standards
project(GTMatrix LANGUAGES C)
set(CMAKE_C_STANDARD 99)

# Set the compiler options
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wunused-variable -g -O3")

# Optionally, find the MPI package
find_package(MPI REQUIRED)

# Include the MPI includes
include_directories(${MPI_C_INCLUDE_PATH})

# Add the library target
add_library(GTMatrix STATIC
    GTMatrix_Typedef.c
    GTMatrix_Get.c
    GTMatrix_Update.c
    GTMatrix_Other.c
    GTM_Req_Vector.c
    GTM_Task_Queue.c
    utils.c
)

# Specify where the library headers are located
target_include_directories(GTMatrix PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

# Link against the MPI libraries
target_link_libraries(GTMatrix PUBLIC ${MPI_C_LIBRARIES})

# Installation rules for the library
install(TARGETS GTMatrix
    EXPORT GTMatrixTargets
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)

# Create and install the export file which CMake uses to import the target
install(EXPORT GTMatrixTargets
    FILE GTMatrixTargets.cmake
    DESTINATION lib/cmake/GTMatrix
)

# Include the module to auto-generate a package configuration file
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "GTMatrixConfigVersion.cmake"
    VERSION 1.0
    COMPATIBILITY AnyNewerVersion
)

# Install the version and config files
install(FILES "GTMatrixConfig.cmake" "GTMatrixConfigVersion.cmake"
    DESTINATION lib/cmake/GTMatrix
)

