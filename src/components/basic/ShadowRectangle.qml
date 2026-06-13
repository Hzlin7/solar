import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import Solar as Solar

Rectangle {
    id: control

    property bool shadow: true
    property int blur: 12
    property int offsetY: 0
    property int offsetX: 0
    property color shadowColor: Solar.Theme.colors.shadow

    color: Solar.Theme.colors.white
    border.width: shadow ? 0.5 : 1
    border.color: Solar.Theme.colors.border

    layer.enabled: control.shadow
    layer.effect: MultiEffect {
        shadowEnabled: true
        shadowBlur: 1
        blurMax: control.blur
        shadowColor: control.shadowColor
        shadowVerticalOffset: control.offsetY
        shadowHorizontalOffset: control.offsetX
        autoPaddingEnabled: true
    }
}
