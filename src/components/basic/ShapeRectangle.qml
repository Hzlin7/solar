import QtQuick
import QtQuick.Shapes
import Solar as Solar

Shape {
    id: control

    // radius: single value for all corners, or array [topLeft, topRight, bottomLeft, bottomRight].
    // Missing array entries default to 0.
    property var radius: 0

    // Fill and border
    property color color: Solar.Theme.colors.white
    property color borderColor: Solar.Theme.colors.border
    property int borderWidth: 0

    // Resolve per-corner radius from `radius` (var: number or array)
    readonly property real _tlr: Array.isArray(radius) ? (radius[0] || 0) : (radius || 0)
    readonly property real _trr: Array.isArray(radius) ? (radius[1] || 0) : (radius || 0)
    readonly property real _blr: Array.isArray(radius) ? (radius[2] || 0) : (radius || 0)
    readonly property real _brr: Array.isArray(radius) ? (radius[3] || 0) : (radius || 0)

    // Clamp to prevent neighbouring arcs from overlapping
    readonly property real _cTL: Math.min(_tlr, width / 2, height / 2)
    readonly property real _cTR: Math.min(_trr, width / 2, height / 2)
    readonly property real _cBL: Math.min(_blr, width / 2, height / 2)
    readonly property real _cBR: Math.min(_brr, width / 2, height / 2)

    antialiasing: true
    preferredRendererType: Shape.CurveRenderer
    containsMode: Shape.BoundingRectContains

    ShapePath {
        id: shapePath

        fillColor: control.color
        strokeColor: control.borderWidth > 0 ? control.borderColor : "transparent"
        strokeWidth: control.borderWidth
        capStyle: ShapePath.RoundCap
        joinStyle: ShapePath.RoundJoin

        startX: control._cTL
        startY: 0

        // Top edge → top-right corner
        PathLine { x: control.width - control._cTR; y: 0 }
        PathArc {
            x: control.width; y: control._cTR
            radiusX: control._cTR; radiusY: control._cTR
            direction: PathArc.Clockwise
        }

        // Right edge → bottom-right corner
        PathLine { x: control.width; y: control.height - control._cBR }
        PathArc {
            x: control.width - control._cBR; y: control.height
            radiusX: control._cBR; radiusY: control._cBR
            direction: PathArc.Clockwise
        }

        // Bottom edge → bottom-left corner
        PathLine { x: control._cBL; y: control.height }
        PathArc {
            x: 0; y: control.height - control._cBL
            radiusX: control._cBL; radiusY: control._cBL
            direction: PathArc.Clockwise
        }

        // Left edge → top-left corner (closes back to startX,startY)
        PathLine { x: 0; y: control._cTL }
        PathArc {
            x: control._cTL; y: 0
            radiusX: control._cTL; radiusY: control._cTL
            direction: PathArc.Clockwise
        }
    }
}
