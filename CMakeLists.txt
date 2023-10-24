cmake_minimum_required(VERSION 3.10)

project(default_project)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin/)
set(LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib/)

add_executable(a.out
                src/main.cpp
                )

target_include_directories(a.out PRIVATE include/)


#######################################################################
# For GoogleTest
enable_testing()
add_subdirectory(extern/gtest)

####  BASIC TEST CREATION CHECK
add_executable(
        hello_test
        test/hello_test.cpp
)
target_link_libraries(hello_test PRIVATE gtest gtestmain)
target_include_directories(hello_test PRIVATE extern/gtest/include)


#######################################################################
include(GoogleTest)
gtest_discover_tests(hello_test)
#######################################################################
