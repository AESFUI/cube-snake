#include <catch2/catch_test_macros.hpp>

#include "core/module_info.hpp"

// Проверяет, что тестовая цель собирается и связывается с core.
// Удаляется вместе с заглушкой, когда появятся настоящие тесты логики (этап 1).
// Имена тестов — латиницей: ctest передаёт фильтр в ANSI, кириллица не находится.
TEST_CASE("core links into the test target", "[core][stage0]") {
    REQUIRE(cube::core::moduleName() == "core");
}
