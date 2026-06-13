qt_add_executable(solar-example
    main.cpp
)

target_compile_definitions(solar-example PRIVATE
    SOLAR_BUILD_DIR="${CMAKE_BINARY_DIR}"
    SOLAR_EXAMPLE_DIR="${CMAKE_CURRENT_SOURCE_DIR}"
)

target_link_libraries(solar-example PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    Solar
)
