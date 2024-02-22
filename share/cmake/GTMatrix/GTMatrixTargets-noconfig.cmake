#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "GTMatrix" for configuration ""
set_property(TARGET GTMatrix APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(GTMatrix PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "C"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libGTMatrix.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS GTMatrix )
list(APPEND _IMPORT_CHECK_FILES_FOR_GTMatrix "${_IMPORT_PREFIX}/lib/libGTMatrix.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
