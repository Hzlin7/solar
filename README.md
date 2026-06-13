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

## Components

### Theme — `Solar.Theme`

Singleton providing a complete design token system with built-in light/dark palettes.

| Property | Type | Description |
|---|---|---|
| `theme` | `string` | Active theme name (default: `"default"`) |
| `isDark` | `bool` | Toggle dark/light mode |
| `zoom` | `real` | Global scale factor (default: `1.0`) |
| `radius` | `real` | Corner radius |
| `animation` | `bool` | Enable component animations |
| `colors.*` | `color` | 80+ semantic color tokens |
| `font.body` | `font` | Body text (13px * zoom) |
| `font.title` | `font` | Title text (15px * zoom, SemiBold) |
| `font.caption` | `font` | Caption text (10px * zoom) |

```qml
Solar.Theme.colors.primary       // Brand color
Solar.Theme.colors.bg0           // Background
Solar.Theme.colors.text0         // Primary text
Solar.Theme.colors.danger        // Error/danger
Solar.Theme.colors.success       // Success
// ... and 75+ more tokens
```

**Custom themes:**

```qml
// Conifer.qml
QtObject {
    readonly property var light: ({ "primary": "#31511e", "bg0": "#f7faf5", ... })
    readonly property var dark:  ({ "primary": "#82c15c", "bg0": "#1a1f15", ... })
}

// main.qml
Solar.Theme.registerTheme("conifer", coniferPal.light, coniferPal.dark)
Solar.Theme.theme = "conifer"
```

### Icons — `Solar.Icons`

Singleton with 1000+ icon glyphs from an embedded icon font.

```qml
Solar.Icons.glyph("close")      // → unicode character
Solar.Icons.has("settings")     // → true/false
Solar.Icons.fontFamily          // → loaded font family name
```

### Basic Components

#### `Solar.Button`

General-purpose button. Extends `Control`.

Currently a minimal shell — extend or compose with other components.

#### `Solar.IconButton`

Icon-only button with hover/press feedback.

| Property | Type | Description |
|---|---|---|
| `icon.name` | `string` | Icon glyph name |
| `hoveredColor` | `color` | Background on hover |
| `pressedColor` | `color` | Background on press |
| `tip` | `string` | Tooltip text |

```qml
Solar.IconButton {
    icon.name: "close"
    tip: "Close window"
    onClicked: Qt.quit()
}
```

#### `Solar.FontIcon`

Renders a single icon glyph as text.

| Property | Type | Description |
|---|---|---|
| `name` | `string` | Icon glyph name |
| `size` | `int` | Pixel size (default: `24`) |
| `color` | `color` | Icon color |

#### `Solar.Separator`

Horizontal or vertical divider line.

| Property | Type | Description |
|---|---|---|
| `orientation` | `enum` | `Qt.Horizontal` or `Qt.Vertical` |
| `padding` | `real` | Inset from edges |

#### `Solar.ShadowRectangle`

Rectangle with a `MultiEffect` drop shadow.

| Property | Type | Description |
|---|---|---|
| `shadow` | `bool` | Enable shadow |
| `blur` | `int` | Shadow blur radius (default: `12`) |
| `offsetX` / `offsetY` | `int` | Shadow offset |
| `shadowColor` | `color` | Shadow color |

#### `Solar.ShapeRectangle`

`Shape`-based rectangle with per-corner radius support. Uses `CurveRenderer` on Qt ≥ 6.6, falls back gracefully on 6.5.

| Property | Type | Description |
|---|---|---|
| `radius` | `var` | Number for uniform, or `[tl, tr, br, bl]` array |
| `color` | `color` | Fill color |
| `borderColor` | `color` | Stroke color |
| `borderWidth` | `int` | Stroke width |

```qml
// Uniform radius
Solar.ShapeRectangle { radius: 8 }

// Per-corner: top-left=8, top-right=8, bottom-right=0, bottom-left=0
Solar.ShapeRectangle { radius: [8, 8, 0, 0] }
```

#### `Solar.Clip`

Rounded clipping container using `OpacityMask`. Place children inside to clip them to rounded bounds.

#### `Solar.FocusRectangle`

Focus ring indicator. Draws a themed border when the parent has active focus.

#### `Solar.HoverHandler`

Convenience `HoverHandler` with `PointingHandCursor`.

### Input Components

#### `Solar.ToggleSwitch`

Animated toggle switch with optional on/off labels.

| Property | Type | Description |
|---|---|---|
| `checked` | `bool` | Toggle state |
| `showText` | `bool` | Show on/off labels |
| `onText` / `offText` | `string` | Label text |
| `animation` | `bool` | Enable transition animation |

```qml
Solar.ToggleSwitch {
    checked: true
    onText: "Enabled"
    offText: "Disabled"
}
```

### Display Components

#### `Solar.Card`

`ShadowRectangle` wrapper with shadow visibility modes.

| Property | Type | Description |
|---|---|---|
| `shadows` | `string` | `"always"`, `"hovered"`, or `"none"` |

```qml
Solar.Card {
    width: 300; height: 200
    radius: 8
    shadows: "hovered"
}
```

## Project Structure

```
solar/
├── CMakeLists.txt
├── src/
│   ├── CMakeLists.txt
│   ├── qmldir
│   ├── fix_qmldir.cmake
│   ├── SolarTheme.qml          # Theme singleton
│   ├── SolarIcons.qml          # Icons singleton
│   ├── assets/iconfont.ttf     # Embedded icon font
│   └── components/
│       ├── basic/
│       │   ├── Button.qml
│       │   ├── Clip.qml
│       │   ├── FocusRectangle.qml
│       │   ├── FontIcon.qml
│       │   ├── HoverHandler.qml
│       │   ├── IconButton.qml
│       │   ├── Separator.qml
│       │   ├── ShadowRectangle.qml
│       │   └── ShapeRectangle.qml
│       ├── display/
│       │   └── Card.qml
│       └── input/
│           └── ToggleSwitch.qml
└── examples/
    ├── main.cpp
    ├── main.qml
    ├── pages/
    │   ├── ButtonPage.qml
    │   └── ToggleSwitchPage.qml
    └── themes/
        └── Conifer.qml         # Custom theme example
```

## License

MIT
