cmake_minimum_required(VERSION 3.5)
project(GTMatrix LANGUAGES C)

# Set the C standard as C99
set(CMAKE_C_STANDARD 99)

# Include the CIntCmake.cmake script
include(share/cmake/GTMatrix/GTMatrixConfig.cmake)

# Specify the public headers for the libGTMatrix library
file(GLOB PUBLIC_HEADERS "*h")

# Define where to install the headers
install(FILES ${PUBLIC_HEADERS} DESTINATION include)

# Define where to install the libGTMatrix library
install(TARGETS GTMatrix
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)
