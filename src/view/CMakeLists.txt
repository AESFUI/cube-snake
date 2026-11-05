# view — читает состояние core и считает кадр (камера, позы). Без D3D.
add_library(view STATIC
    module_info.cpp
)
target_include_directories(view PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(view
    PUBLIC core
    PRIVATE project_options
)
