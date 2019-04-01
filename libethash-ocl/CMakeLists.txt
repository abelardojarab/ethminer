# A custom command and target to turn the OpenCL kernel into a byte array header
# The normal build depends on it properly and if the kernel file is changed, then
# a rebuild of libethash-cl should be triggered

set(SOURCES
  CLMiner.h CLMiner.cpp
  AOCLUtils/opencl.cpp
)

if(APPLE)
    # On macOS use system OpenCL library.
    find_package(OpenCL REQUIRED)
else()
    hunter_add_package(OpenCL)
    find_package(OpenCL CONFIG REQUIRED)
endif()

include_directories(BEFORE ${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(..)

add_library(ethash-ocl ${SOURCES})
target_link_libraries(ethash-ocl PUBLIC ethcore ethash::ethash)
target_link_libraries(ethash-ocl PRIVATE OpenCL::OpenCL)
