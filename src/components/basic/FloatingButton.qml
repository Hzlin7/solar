import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.Effects
import Solar as Solar

Button {
    id: control

    property color color: highlighted ? Solar.Theme.colors.primary : Solar.Theme.colors.fill0
    property color hoveredColor: highlighted ? Solar.Theme.colors.primaryHover : Solar.Theme.colors.fill1
    property color pressedColor: highlighted ? Solar.Theme.colors.primaryActive : Solar.Theme.colors.fill2
    property color disabledColor: Solar.Theme.colors.disabledBg
    property color textColor: Solar.Theme.colors.text0
    property color highlightedTextColor: Solar.Theme.colors.white
    property real radius: Solar.Theme.radius
    property real minWidth: 60 * Solar.Theme.zoom
    property alias tip: toolTip.text
    property alias tipDelay: toolTip.delay
    property bool animation: Solar.Theme.animation

    padding: 8 * Solar.Theme.zoom
    leftPadding: 10 * Solar.Theme.zoom
    rightPadding: 10 * Solar.Theme.zoom
    font: Solar.Theme.font.body
    focusPolicy: Qt.TabFocus

    QtObject {
        id: d
        property bool isAnimating: yOffsetAnim.running
    }

    background: Rectangle {
        id: bg
        implicitHeight: 30 * Solar.Theme.zoom
        implicitWidth: control.minWidth
        radius: control.radius
        color: {
            if (!control.enabled)
                return control.disabledColor;
            else if (control.pressed)
                return control.pressedColor;
            else if (hoverHandler.hovered || d.isAnimating)
                return control.hoveredColor;
            return control.color;
        }

        Solar.FocusRectangle {
            visible: control.activeFocus
        }
    }

    Rectangle {
        id: shadowWrap
        y: parent.height - height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.8
        height: 16
        z: -2
        color: bg.color
        opacity: 0.6
        visible: control.enabled

        layer.enabled: true
        layer.effect: MultiEffect {
            blurEnabled: true
            blurMax: 48
            blur: 1.0
        }
    }

    contentItem: RowLayout {
        id: contentRow
        spacing: (iconImage.visible && btnText.visible) ? control.spacing : 0
        Solar.ColoredSvg {
            id: iconImage
            source: control.icon.source
            height: 18 * Solar.Theme.zoom
            width: 18 * Solar.Theme.zoom
            color: control.icon.color
            visible: control.display != AbstractButton.TextOnly && source.length > 0
        }
        Text {
            id: btnText
            font: control.font
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: {
                if (!control.enabled)
                    return Solar.Theme.colors.disabledText;
                if (control.highlighted)
                    return control.highlightedTextColor;
                return control.textColor;
            }
            text: control.text
            visible: control.display != AbstractButton.IconOnly
        }
    }

    // replace with Solar.ToolTip when it's implemented
    ToolTip {
        id: toolTip
    }

    Solar.HoverHandler {
            id: hoverHandler
            enabled: control.enabled
            onHoveredChanged: {
                if (!control.floating)
                    return;
                if (hovered) {
                    contentTranslate.y = -5;
                } else {
                    contentTranslate.y = 0;
                }
            }
        }

    transform: Translate {
        id: contentTranslate
        y: 0
        Behavior on y {
            enabled: control.animation
            PropertyAnimation {
                id: yOffsetAnim
                duration: 160
                easing.type: Easing.InOutQuad
            }
        }
    }
}
