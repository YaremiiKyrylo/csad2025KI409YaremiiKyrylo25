cmake_minimum_required(VERSION 3.10)

project(HelloWorld VERSION 1.0 LANGUAGES CXX)

# Use a modern, portable C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Build math_operations as a reusable library
add_library(math_operations STATIC
    math_operations.cpp
)

target_include_directories(math_operations
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
)

# Compile the main executable and link the math_operations library
add_executable(hello
    main.cpp
)

target_link_libraries(hello
    PRIVATE math_operations
)

# --- GoogleTest setup (FetchContent) ---
include(FetchContent)

FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.14.0
)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

# Make googletest available in this CMake build
FetchContent_MakeAvailable(googletest)

# Enable CTest and add tests conditionally if test sources exist
enable_testing()

# Register tests from tests/unit_tests.cpp if that file exists
set(MATH_TEST_SRC "${CMAKE_CURRENT_SOURCE_DIR}/tests/unit_tests.cpp")
if(EXISTS ${MATH_TEST_SRC})
    add_executable(math_operations_test
        ${MATH_TEST_SRC}
    )

    target_link_libraries(math_operations_test
        PRIVATE
            math_operations
            gtest_main
    )

    add_test(NAME math_operations_test COMMAND math_operations_test)
endif()