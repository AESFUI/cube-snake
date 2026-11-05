# Общие флаги для целей проекта. Подключается к каждой нашей цели через
#   target_link_libraries(<цель> PRIVATE project_options)
# Сторонний код (Catch2) эти флаги не получает: NFR-4 касается нашего кода.
add_library(project_options INTERFACE)

target_compile_options(project_options INTERFACE
    /W4           # NFR-4: высокий уровень предупреждений
    /WX           # NFR-4: предупреждение = ошибка
    /permissive-  # строгое соответствие стандарту
    /utf-8        # исходники в UTF-8 (русские комментарии и строки)
)

target_compile_definitions(project_options INTERFACE
    UNICODE
    _UNICODE
)
