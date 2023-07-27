# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the additional compiler flag for Visual Studio
if (MSVC)
    target_compile_options(uwuw PRIVATE /std:c++11)
endif()

message("")

file(GLOB SRC_FILES "*.cpp")
file(GLOB PUB_HEADERS "*.hpp")

set(LINK_LIBS dagmc pyne_dagmc)
set(LINK_LIBS_EXTERN_NAMES)

include_directories(${CMAKE_SOURCE_DIR}/src/dagmc)
include_directories(${CMAKE_BINARY_DIR}/src/dagmc)
include_directories(${CMAKE_SOURCE_DIR}/src/pyne)

dagmc_install_library(uwuw)

add_subdirectory(app)
if (BUILD_TESTS)
  add_subdirectory(tests)
endif ()
