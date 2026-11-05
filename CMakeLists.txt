cmake_minimum_required(VERSION 3.25)
project(CubeSnake LANGUAGES CXX)

if(NOT MSVC)
    message(FATAL_ERROR "Проект собирается только MSVC (Visual Studio 2022), см. docs/PRD.md")
endif()

# NFR-2: статический CRT для всех целей, включая сторонние (Catch2).
# Задаётся до FetchContent, чтобы зависимости собирались с тем же CRT.
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Все исполняемые файлы — в build/<preset>/bin/<Config>/.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

include(cmake/ProjectOptions.cmake)

# Модули. Зависимости только по стрелкам: app → render → view → core.
add_subdirectory(src/core)
add_subdirectory(src/view)
add_subdirectory(src/render)
add_subdirectory(src/app)

enable_testing()
add_subdirectory(tests)
