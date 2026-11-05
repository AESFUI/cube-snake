# core — правила игры. Ни от кого не зависит, без Windows и DirectX (NFR-5).
add_library(core STATIC
    module_info.cpp
)
target_include_directories(core PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(core PRIVATE project_options)
