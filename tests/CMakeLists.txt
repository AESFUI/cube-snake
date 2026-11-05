include(FetchContent)

# Catch2 — единственная внешняя зависимость тестов (PRD, «Стек»). Версия зафиксирована.
FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG        v3.7.1
    GIT_SHALLOW    TRUE
)
FetchContent_MakeAvailable(Catch2)

add_executable(tests
    core_module_info_test.cpp
)
target_link_libraries(tests PRIVATE
    core
    Catch2::Catch2WithMain
    project_options
)

list(APPEND CMAKE_MODULE_PATH "${catch2_SOURCE_DIR}/extras")
include(Catch)
catch_discover_tests(tests)
