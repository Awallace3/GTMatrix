cmake_minimum_required(VERSION 3.5)
project(GTMatrix LANGUAGES C)

# Set the C standard as C99
set(CMAKE_C_STANDARD 99)

# Compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wunused-variable -g -O3")

# Find MPI package
find_package(MPI REQUIRED)
include_directories(${MPI_C_INCLUDE_PATH})

# Define the sources
set(SOURCES
    GTMatrix_Typedef.c
    GTMatrix_Get.c
    GTMatrix_Update.c
    GTMatrix_Other.c
    GTM_Req_Vector.c
    GTM_Task_Queue.c
    utils.c
)

# Define the headers
set(HEADERS
    GTMatrix_Typedef.h
    GTMatrix_Get.h
    GTMatrix_Update.h
    GTMatrix_Other.h
    GTM_Req_Vector.h
    GTM_Task_Queue.h
    utils.h
)

# Add library target
add_library(GTMatrix STATIC ${SOURCES} ${HEADERS})

# Link the library with MPI
target_link_libraries(GTMatrix PUBLIC MPI::MPI_C)

# Specify where the library headers are located
target_include_directories(GTMatrix PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Add install target for the headers
install(FILES ${HEADERS} DESTINATION include)

# Add install target for the library
install(TARGETS GTMatrix
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)

