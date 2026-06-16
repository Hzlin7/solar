import QtQuick
import QtQuick.Controls
import Solar as Solar

Button {
    id: control

    property alias tip: toolTip.text
    property color hoveredColor: Solar.Theme.colors.fill0
    property color pressedColor: Solar.Theme.colors.fill1

    focusPolicy: Qt.TabFocus
    display: Button.IconOnly
    implicitWidth: 30 * Solar.Theme.zoom
    implicitHeight: 30 * Solar.Theme.zoom
    icon.color: enabled ? Solar.Theme.colors.text1 : Solar.Theme.colors.disabledText

    background: Rectangle {
        anchors.fill: parent
        radius: Solar.Theme.radius
        color: {
            if (control.enabled) {
                if (control.down) {
                    return control.pressedColor;
                } else if (control.hovered) {
                    return control.hoveredColor;
                }
            }
            return "transparent";
        }
    }

    contentItem: Item {
        Solar.ColoredSvg {
            id: iconImage
            anchors.centerIn: parent
            source: control.icon.source
            height: 18 * Solar.Theme.zoom
            width: 18 * Solar.Theme.zoom
            color: control.icon.color
        }
    }

    //@todo: replace with Solar.ToolTip when it's implemented
    ToolTip {
        id: toolTip
    }
}
