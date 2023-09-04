INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_LIBAIRSPY libairspy)

FIND_PATH(
    LIBAIRSPY_INCLUDE_DIRS
    NAMES libairspy/airspy.h
    HINTS $ENV{LIBAIRSPY_DIR}/include
        ${PC_LIBAIRSPY_INCLUDEDIR}
    PATHS /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    LIBAIRSPY_LIBRARIES
    NAMES airspy
    HINTS $ENV{LIBAIRSPY_DIR}/lib
        ${PC_LIBAIRSPY_LIBDIR}
    PATHS /usr/local/lib
          /usr/local/lib/x86_64-linux-gnu
          /usr/lib
          /usr/lib/x86_64-linux-gnu
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBAIRSPY DEFAULT_MSG LIBAIRSPY_LIBRARIES LIBAIRSPY_INCLUDE_DIRS)
MARK_AS_ADVANCED(LIBAIRSPY_LIBRARIES LIBAIRSPY_INCLUDE_DIRS)
