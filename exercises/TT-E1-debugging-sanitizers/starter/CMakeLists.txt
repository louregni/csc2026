cmake_minimum_required(VERSION 3.16)
project(tt_e1_debugging_sanitizers LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(ENABLE_SANITIZERS "Enable ASan/UBSan for debugging" OFF)

if(ENABLE_SANITIZERS)
  message(STATUS "Sanitizers: ON (address,undefined)")
  add_compile_options(-fsanitize=address,undefined -fno-omit-frame-pointer -g)
  add_link_options(-fsanitize=address,undefined)
endif()

# -----------------------------------------------------------------------------
# Core library for the exercise
# -----------------------------------------------------------------------------
add_library(tt_e1_core
  src/TrackReconstructor.cpp
)
target_include_directories(tt_e1_core PUBLIC include)

# -----------------------------------------------------------------------------
# "Analyze" executable that triggers the bugs
# -----------------------------------------------------------------------------
add_executable(analyze
  src/analyze.cpp
)
target_link_libraries(analyze PRIVATE tt_e1_core)

# -----------------------------------------------------------------------------
# Tests (Catch2)
# -----------------------------------------------------------------------------
include(CTest)

if(BUILD_TESTING)
  include(FetchContent)
  FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG v3.5.3
  )
  FetchContent_MakeAvailable(Catch2)

  add_executable(test_tt_e1
    tests/test_track_reconstructor.cpp
  )
  target_link_libraries(test_tt_e1 PRIVATE tt_e1_core Catch2::Catch2WithMain)

  add_test(NAME tt_e1_tests COMMAND test_tt_e1)
endif()

