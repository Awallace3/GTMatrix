cmake_minimum_required(VERSION 3.5)
project(GTMatrix LANGUAGES C)

# Set the C standard as C99
set(CMAKE_C_STANDARD 99)

# Include the CIntCmake.cmake script
# include(share/cmake/GTMatrix/GTMatrixConfig.cmake)
# Optionally, find the MPI package
find_package(MPI REQUIRED)

# Source files
set(GTMatrix_SRC
    ${CMAKE_CURRENT_LIST_DIR}/GTMatrix_Typedef.c
    ${CMAKE_CURRENT_LIST_DIR}/GTMatrix_Get.c
    ${CMAKE_CURRENT_LIST_DIR}/GTMatrix_Update.c
    ${CMAKE_CURRENT_LIST_DIR}/GTMatrix_Other.c
    ${CMAKE_CURRENT_LIST_DIR}/GTM_Req_Vector.c
    ${CMAKE_CURRENT_LIST_DIR}/GTM_Task_Queue.c
    ${CMAKE_CURRENT_LIST_DIR}/utils.c
)

# Include the MPI includes
include_directories(${MPI_C_INCLUDE_PATH}
    ${CMAKE_CURRENT_LIST_DIR}
    )

# Set the compiler options
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wunused-variable -g -O3")

add_library(GTMatrix STATIC ${GTMatrix_SRC})
#target_compile_features(GTMatrix PRIVATE c_std_11)

# Specify the public headers for the libGTMatrix library
file(GLOB PUBLIC_HEADERS "*h")

# Define where to install the headers
install(FILES ${PUBLIC_HEADERS} DESTINATION include)

# Define where to install the libGTMatrix library
install(TARGETS GTMatrix
        EXPORT GTMatrixTargets
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)

install(EXPORT GTMatrixTargets
        FILE GTMatrixTargets.cmake
        DESTINATION share/cmake/GTMatrix)
