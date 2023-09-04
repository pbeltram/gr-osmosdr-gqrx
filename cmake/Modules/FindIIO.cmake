########################################################################
# Find the IIO userspace library
########################################################################

INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_IIO iio)

FIND_PATH(
    IIO_INCLUDE_DIRS
    NAMES iio.h
    HINTS $ENV{IIO_DIR}/include
        ${PC_IIO_INCLUDEDIR}
    PATHS /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    IIO_LIBRARIES
    NAMES iio
    HINTS $ENV{IIO_DIR}/lib
        ${PC_IIO_LIBDIR}
    PATHS /usr/local/lib
          /usr/local/lib/x86_64-linux-gnu
          /usr/lib
          /usr/lib/x86_64-linux-gnu
)

if(IIO_INCLUDE_DIRS AND IIO_LIBRARIES)
  set(IIO_FOUND TRUE CACHE INTERNAL "iio found")
  message(STATUS "Found iio: ${IIO_INCLUDE_DIRS}, ${IIO_LIBRARIES}")
else(IIO_INCLUDE_DIRS AND IIO_LIBRARIES)
  set(IIO_FOUND FALSE CACHE INTERNAL "iio found")
  message(STATUS "iio not found.")
endif(IIO_INCLUDE_DIRS AND IIO_LIBRARIES)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(IIO DEFAULT_MSG IIO_LIBRARIES IIO_INCLUDE_DIRS)
MARK_AS_ADVANCED(IIO_LIBRARIES IIO_INCLUDE_DIRS)
