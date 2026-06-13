import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Solar as Solar

Button {
    id: control

    property bool animation: Solar.Theme.animation
    property bool showText: true
    property string onText: qsTr("On")
    property string offText: qsTr("Off")

    padding: 0
    spacing: 10 * Solar.Theme.zoom
    background: null
    focusPolicy: Qt.TabFocus

    onClicked: {
        checked = !checked;
        if (animation) {
            bgWidthAnimation.from = checked ? 0 : backgroundId.width;
            bgWidthAnimation.to = checked ? backgroundId.width : 0;
            dotXAnimation.from = checked ? backgroundId.border.width : backgroundId.width - dot.width - backgroundId.border.width;
            dotXAnimation.to = checked ? backgroundId.width - dot.width - backgroundId.border.width : backgroundId.border.width;
            bgWidthAnimation.start();
            dotXAnimation.start();
        }
    }

    contentItem: RowLayout {
        spacing: control.spacing
        Solar.Clip {
            id: backgroundId
            implicitWidth: 40 * Solar.Theme.zoom
            implicitHeight: 22 * Solar.Theme.zoom
            radius: height / 2
            clip: true
            color: {
                if (!enabled) {
                    if (checked) {
                        return Solar.Theme.colors.primaryDisabled;
                    }
                    return Solar.Theme.colors.disabledBg;
                }
                if (pressed) {
                    return Solar.Theme.colors.fill2;
                }
                if (hovered) {
                    return Solar.Theme.colors.fill1;
                }
                return Solar.Theme.colors.fill0;
            }
            border.width: 1
            border.color: {
                if (!enabled) {
                    return Solar.Theme.colors.border;
                }
                return "transparent";
            }
            Solar.FocusRectangle {
                visible: control.activeFocus
            }
            Rectangle {
                id: bgPrimary
                width: checked ? parent.width : 0
                height: parent.height
                radius: height / 2.0
                color: {
                    if (!enabled) {
                        return Solar.Theme.colors.primaryDisabled;
                    }
                    if (pressed) {
                        return Solar.Theme.colors.primaryActive;
                    }
                    if (hovered) {
                        return Solar.Theme.colors.primaryHover;
                    }
                    return Solar.Theme.colors.primary;
                }
            }
            Rectangle {
                id: dot
                width: {
                    let w = parent.height - 2 * parent.border.width;
                    return pressed && enabled && control.animation ? w + 4 * Solar.Theme.zoom : w;
                }
                height: parent.height - 2 * parent.border.width
                radius: height / 2.0
                y: parent.border.width
                x: checked ? parent.width - width - parent.border.width : parent.border.width
                border.width: 0
                scale: {
                    return hovered && enabled ? 8 / 10 : 7 / 10;
                }
                color: {
                    if (!enabled) {
                        return Solar.Theme.colors.disabledFill;
                    }
                    return Solar.Theme.colors.white;
                }
                Behavior on scale {
                    enabled: control.animation
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutCubic
                    }
                }
            }
            NumberAnimation {
                id: bgWidthAnimation
                target: bgPrimary
                property: "width"
                duration: 150
                easing.type: Easing.InQuad
                onStopped: {
                    bgPrimary.width = Qt.binding(() => control.checked ? backgroundId.width : 0);
                }
            }
            NumberAnimation {
                id: dotXAnimation
                target: dot
                property: "x"
                duration: 150
                easing.type: Easing.OutCubic
                onStopped: {
                    dot.x = Qt.binding(() => control.checked ? backgroundId.width - dot.width - backgroundId.border.width : backgroundId.border.width);
                }
            }
            Solar.HoverHandler {}
        }
        Text {
            text: control.checked ? control.onText : control.offText
            color: control.enabled ? Solar.Theme.colors.text1 : Solar.Theme.colors.disabledText
            font: Solar.Theme.font.body
            Layout.alignment: Qt.AlignVCenter
            visible: control.showText && text !== ""
        }
    }
}
