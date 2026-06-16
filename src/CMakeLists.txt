qt6_add_qml_module(Solar
    URI "Solar"
    VERSION 1.0
    NO_PLUGIN
    OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/Solar"
    QML_FILES
        SolarTheme.qml
        SolarIcons.qml
        components/basic/Clip.qml
        components/basic/Separator.qml
        components/basic/Button.qml
        components/basic/IconButton.qml
        components/basic/FontIconButton.qml
        components/basic/FloatingButton.qml
        components/basic/ShadowRectangle.qml
        components/basic/FontIcon.qml
        components/basic/FocusRectangle.qml
        components/basic/HoverHandler.qml
        components/basic/ShapeRectangle.qml
        components/basic/ColoredSvg.qml
        components/basic/SegmentedItem.qml
        components/input/ToggleSwitch.qml
        components/input/Segmented.qml
        components/display/Card.qml
        components/display/ToolTip.qml
    RESOURCES
        assets/iconfont.ttf
)

# Fix qmldir: add singleton keyword for singleton types
set(QMLDIR "${CMAKE_BINARY_DIR}/Solar/qmldir")
add_custom_command(TARGET Solar POST_BUILD
    COMMAND ${CMAKE_COMMAND}
        -DQMLDIR="${QMLDIR}"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/fix_qmldir.cmake"
    # Copy font to output so FontLoader can find it via Qt.resolvedUrl
    COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_BINARY_DIR}/Solar/assets"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${CMAKE_CURRENT_SOURCE_DIR}/assets/iconfont.ttf"
        "${CMAKE_BINARY_DIR}/Solar/assets/iconfont.ttf"
)
