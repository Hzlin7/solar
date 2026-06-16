# Solar

A QML component library for Qt 6.5+ with built-in light/dark theme support, 1000+ icons, and a growing set of UI components.

## Requirements

- **Qt 6.5+** (Quick, QuickControls2, Shapes, Effects, Qt5Compat.GraphicalEffects)
- **CMake 3.21+**
- **C++17**

## Quick Start

```cmake
# CMakeLists.txt
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)
add_subdirectory(path/to/solar/src)
target_link_libraries(your-app PRIVATE Solar)
```

```cpp
// main.cpp
QQmlApplicationEngine engine;
engine.addImportPath(SOLAR_BUILD_DIR);  // point to build directory
```

```qml
// your QML
import Solar as Solar

ApplicationWindow {
    // Theme (singleton)
    Solar.Theme.zoom = 1.0
    Solar.Theme.isDark = true

    // Icons (singleton, 1000+ glyphs)
    Solar.IconButton {
        icon.name: "close"
        onClicked: Qt.quit()
    }
}
```

## License

MIT
