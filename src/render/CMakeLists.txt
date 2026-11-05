# render — Direct3D 11, рисует кадр, подготовленный view.
add_library(render STATIC
    module_info.cpp
)
target_include_directories(render PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(render
    PUBLIC view
    PRIVATE project_options
)
