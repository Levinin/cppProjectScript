cmake_minimum_required(VERSION 3.10)

project(default_project)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin/)
set(LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib/)

add_executable(a.out
                src/main.cpp
                # List other cpp files here
                )

option(ENABLE_PRODUCTION_BUILD "Enable production compiler flags" OFF)   
if(ENABLE_PRODUCTION_BUILD)
  target_compile_options(a.out PRIVATE "$<$<CONFIG:Release>:-O3>")
else()
  target_compile_options(a.out PRIVATE -ggdb -Wall)	
endif()

target_include_directories(a.out PRIVATE include/)

#######################################################################
# For GoogleTest

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
  DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/extern
)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

#######################################################################

enable_testing()

add_executable(
        hello_test
        test/hello_test.cpp
)
target_link_libraries(hello_test PRIVATE GTest::gtest_main)
target_compile_options(hello_test PRIVATE -ggdb -Wall)	

#######################################################################
include(GoogleTest)
gtest_discover_tests(hello_test)
#######################################################################
