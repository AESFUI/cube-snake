# app — точка входа, окно, ввод и игровой цикл. Использует все модули.
add_executable(app WIN32
    main.cpp
)
set_target_properties(app PROPERTIES OUTPUT_NAME cube_snake)
target_link_libraries(app PRIVATE
    render
    project_options
)
