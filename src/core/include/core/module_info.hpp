#pragma once

#include <string_view>

namespace cube::core {

// Заглушка этапа 0: даёт библиотеке символ и тестовой цели — что проверять.
// Удаляется, когда в core появится настоящая логика (этап 1).
std::string_view moduleName();

}  // namespace cube::core
