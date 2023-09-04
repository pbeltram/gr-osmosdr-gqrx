if(NOT LIBIIO_FOUND)
  pkg_check_modules (LIBIIO_PKG libiio)
  find_path(LIBIIO_INCLUDE_DIRS NAMES iio.h
    PATHS
    ${LIBIIO_PKG_INCLUDE_DIRS}
    /usr/include
    /usr/local/include
  )

  find_library(LIBIIO_LIBRARIES NAMES iio
    PATHS
    ${LIBIIO_PKG_LIBRARY_DIRS}
    /usr/local/lib
    /usr/local/lib/x86_64-linux-gnu
    /usr/lib
    /usr/lib/x86_64-linux-gnu
  )

if(LIBIIO_INCLUDE_DIRS AND LIBIIO_LIBRARIES)
  set(LIBIIO_FOUND TRUE CACHE INTERNAL "libiio found")
  message(STATUS "Found libiio: ${LIBIIO_INCLUDE_DIRS}, ${LIBIIO_LIBRARIES}")
else(LIBIIO_INCLUDE_DIRS AND LIBIIO_LIBRARIES)
  set(LIBIIO_FOUND FALSE CACHE INTERNAL "libiio found")
  message(STATUS "libiio not found.")
endif(LIBIIO_INCLUDE_DIRS AND LIBIIO_LIBRARIES)

mark_as_advanced(LIBIIO_LIBRARIES LIBIIO_INCLUDE_DIRS)

endif(NOT LIBIIO_FOUND)
