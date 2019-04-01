cmake_minimum_required(VERSION 3.3)

include(cmake/cable/bootstrap.cmake)

include(CableBuildInfo)
include(CableBuildType)
include(CableToolchains)
include(HunterGate)

include(defaults/HunterCacheServers)

cable_configure_toolchain(DEFAULT cxx11)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(HUNTER_CONFIGURATION_TYPES Release CACHE STRING "Build type of Hunter packages")
set(HUNTER_JOBS_NUMBER 6 CACHE STRING "Number of parallel builds used by Hunter")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.20.73.tar.gz"
    SHA1 "5cd594b2bb12b2d66983a40b230f760187abbe5a"
    LOCAL
)

project(ethminer)
set(PROJECT_VERSION 0.15.0.dev10)

cable_set_build_type(DEFAULT Release CONFIGURATION_TYPES Release RelWithDebInfo Debug)

# link_directories interprets relative paths with respect to CMAKE_CURRENT_SOURCE_DIR
cmake_policy(SET CMP0015 NEW)

# let cmake autolink dependencies on windows
# it's specified globally, cause qt libraries requires that on windows and they are also found globally
cmake_policy(SET CMP0020 NEW)

# 3.1 and above
cmake_policy(SET CMP0054 NEW)

######################################################################################################

option(ETHASHCL "Build with OpenCL mining" ON)
option(ETHASHOCL "Build with OpenCL FPGA mining" ON)
option(ETHASHCUDA "Build with CUDA mining" ON)
option(ETHDBUS "Build with D-Bus support" OFF)
option(APICORE "Build with API Server support" ON)

# propagates CMake configuration options to the compiler
function(configureProject)
    if (ETHASHCL)
        add_definitions(-DETH_ETHASHCL)
      endif()
    if (ETHASHOCL)
        add_definitions(-DETH_ETHASHOCL)
    endif()
    if (ETHASHCUDA)
        add_definitions(-DETH_ETHASHCUDA)
    endif()
    if (ETHDBUS)
        add_definitions(-DETH_DBUS)
    endif()
    if (APICORE)
        add_definitions(-DAPI_CORE)
    endif()
endfunction()

hunter_add_package(Boost COMPONENTS system)
find_package(Boost CONFIG REQUIRED COMPONENTS system)

hunter_add_package(jsoncpp)
find_package(jsoncpp CONFIG REQUIRED)

hunter_add_package(libjson-rpc-cpp)
find_package(libjson-rpc-cpp CONFIG REQUIRED)

hunter_add_package(CppNetlibUri)
find_package(CppNetlibUri CONFIG REQUIRED)

hunter_add_package(ethash)
find_package(ethash CONFIG REQUIRED)

configureProject()

message("------------------------------------------------------------------------")
message("-- CMake ${CMAKE_VERSION}")
message("-- Build ${CMAKE_BUILD_TYPE} / ${CMAKE_SYSTEM_NAME}")
message("------------------------------------------------------------- components")
message("-- ETHASHCL         Build OpenCL components                  ${ETHASHCL}")
message("-- ETHASHOCL        Build OpenCL FPGA components             ${ETHASHOCL}")
message("-- ETHASHCUDA       Build CUDA components                    ${ETHASHCUDA}")
message("-- ETHDBUS          Build D-Bus components                   ${ETHDBUS}")
message("-- APICORE          Build API Server components              ${APICORE}")
message("------------------------------------------------------------------------")
message("")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(EthCompilerSettings)

cable_add_buildinfo_library(PREFIX ethminer)

execute_process(COMMAND ${AOCL_SDK_ROOT}/bin/aocl compile-config
  OUTPUT_VARIABLE AOCL_COMPILE_CONFIG)
execute_process(COMMAND ${AOCL_SDK_ROOT}/bin/aocl link-config
  OUTPUT_VARIABLE AOCL_LINK_CONFIG)
string(REGEX REPLACE "\n$" "" AOCL_COMPILE_CONFIG "${AOCL_COMPILE_CONFIG}")
string(REGEX REPLACE "\n$" "" AOCL_LINK_CONFIG "${AOCL_LINK_CONFIG}")

string(REGEX MATCHALL "-l([^ ]*)" AOCL_LIBRARIES "${AOCL_LINK_CONFIG}")
string(REGEX MATCHALL "-L([^ ]*)" AOCL_LINK_SEARCH "${AOCL_LINK_CONFIG}")
string(REGEX REPLACE "-l([^;]*)" "\\1" AOCL_LIBRARIES "${AOCL_LIBRARIES}")
string(REGEX REPLACE "-L([^;]*)" "\\1" AOCL_LINK_SEARCH "${AOCL_LINK_SEARCH}")

separate_arguments(AOCL_COMPILER_OPTS UNIX_COMMAND
      "${AOCL_LINK_CONFIG} ${AOCL_COMPILE_CONFIG}")

# Generic, no need to modify
add_subdirectory(libdevcore)

# Done, only one variable needed to be added on Miner.h
add_subdirectory(libethcore)

# No relevant changes
add_subdirectory(libhwmon)

# No relevant changes
add_subdirectory(libpoolprotocols)

if (ETHASHCL)
    add_subdirectory(libethash-cl)
endif ()
if (ETHASHOCL)
    add_subdirectory(libethash-ocl)
endif ()
if (ETHASHCUDA)
    add_subdirectory(libethash-cuda)
endif ()
if (APICORE)
    add_subdirectory(libapicore)
endif()

add_subdirectory(ethminer)


if(WIN32)
    set(CPACK_GENERATOR ZIP)
else()
    set(CPACK_GENERATOR TGZ)
endif()
set(CPACK_PACKAGE_FILE_NAME ${PROJECT_NAME}-${PROJECT_VERSION}-${CMAKE_SYSTEM_NAME})
set(CPACK_PACKAGE_CHECKSUM SHA256)
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
include(CPack)


# Export some variables for CIs
if(PROJECT_VERSION MATCHES "^([0-9]+)\\.([0-9]+)\\.([0-9]+)$")
    set(PROJECT_VERSION_IS_PRERELEASE false)
else()
    set(PROJECT_VERSION_IS_PRERELEASE true)
endif()
configure_file(cmake/variables.sh.in variables.sh)
configure_file(cmake/variables.ps1.in variables.ps1)
