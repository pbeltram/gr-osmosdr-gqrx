if(NOT LIBBLADERF_FOUND)
  pkg_check_modules (LIBBLADERF_PKG libbladeRF)
  find_path(LIBBLADERF_INCLUDE_DIRS NAMES libbladeRF.h
    PATHS
    ${LIBBLADERF_PKG_INCLUDE_DIRS}
    /usr/include
    /usr/local/include
  )

  find_library(LIBBLADERF_LIBRARIES NAMES bladeRF
    PATHS
    ${LIBBLADERF_PKG_LIBRARY_DIRS}
    /usr/local/lib
    /usr/local/lib/x86_64-linux-gnu
    /usr/lib
    /usr/lib/x86_64-linux-gnu
  )

if(LIBBLADERF_INCLUDE_DIRS AND LIBBLADERF_LIBRARIES)
  set(LIBBLADERF_FOUND TRUE CACHE INTERNAL "libbladeRF found")
  message(STATUS "Found libbladeRF: ${LIBBLADERF_INCLUDE_DIRS}, ${LIBBLADERF_LIBRARIES}")
else(LIBBLADERF_INCLUDE_DIRS AND LIBBLADERF_LIBRARIES)
  set(LIBBLADERF_FOUND FALSE CACHE INTERNAL "libbladeRF found")
  message(STATUS "libbladeRF not found.")
endif(LIBBLADERF_INCLUDE_DIRS AND LIBBLADERF_LIBRARIES)

mark_as_advanced(LIBBLADERF_LIBRARIES LIBBLADERF_INCLUDE_DIRS)

endif(NOT LIBBLADERF_FOUND)
