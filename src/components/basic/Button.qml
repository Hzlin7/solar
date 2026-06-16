import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Solar as Solar

Button {
    id: control

    enum Style {
        Light,
        Solid,
        Transparent,
        Outline
    }

    property int style: 0 // Button.Style.Light

    property color bgNormal: Solar.Theme.colors.fill0
    property color bgHovered: Solar.Theme.colors.fill1
    property color bgPressed: Solar.Theme.colors.fill2
    property color bgDisabled: Solar.Theme.colors.disabledBg
    property color contentTextColor: Solar.Theme.colors.text0
    property color contentIconColor: Solar.Theme.colors.text1

    property real radius: Solar.Theme.radius
    property real minWidth: 60 * Solar.Theme.zoom

    padding: 8 * Solar.Theme.zoom
    leftPadding: 10 * Solar.Theme.zoom
    rightPadding: 10 * Solar.Theme.zoom
    font: Solar.Theme.font.body
    focusPolicy: Qt.TabFocus

    icon.color: enabled ? contentIconColor : Solar.Theme.colors.disabledText

    state: {
        switch (style) {
        case 1:
            return "Solid";
        case 2:
            return "Transparent";
        case 3:
            return "Outline";
        default:
            return "";
        }
    }

    states: [
        State {
            name: "Solid"
            PropertyChanges {
                target: control
                bgNormal: Solar.Theme.colors.primary
                bgHovered: Solar.Theme.colors.primaryHover
                bgPressed: Solar.Theme.colors.primaryActive
                contentTextColor: Solar.Theme.colors.white
                contentIconColor: Solar.Theme.colors.white
            }
        },
        State {
            name: "Transparent"
            PropertyChanges {
                target: control
                bgNormal: "transparent"
                bgDisabled: "transparent"
            }
        },
        State {
            name: "Outline"
            PropertyChanges {
                target: control
                bgNormal: "transparent"
                bgDisabled: "transparent"
                contentTextColor: Solar.Theme.colors.primary
                contentIconColor: Solar.Theme.colors.primary
            }
        }
    ]

    background: Rectangle {
        id: bg
        implicitHeight: 30 * Solar.Theme.zoom
        implicitWidth: control.minWidth
        radius: control.radius
        color: {
            if (!control.enabled)
                return control.bgDisabled;
            else if (control.pressed)
                return control.bgPressed;
            else if (control.hovered)
                return control.bgHovered;
            return control.bgNormal;
        }
        border.color: control.style === 3 ? (control.enabled ? Solar.Theme.colors.primary : Solar.Theme.colors.disabledText) : "transparent"
        border.width: control.style === 3 ? Solar.Theme.border : 0

        Solar.FocusRectangle {
            visible: control.activeFocus
        }
    }

    contentItem: Item {
        implicitWidth: contentRow.implicitWidth
        implicitHeight: contentRow.implicitHeight
        RowLayout {
            id: contentRow
            anchors.centerIn: parent
            spacing: (iconImage.visible && btnText.visible) ? control.spacing : 0
            Solar.ColoredSvg {
                id: iconImage
                source: control.icon.source
                height: 18 * Solar.Theme.zoom
                width: 18 * Solar.Theme.zoom
                color: control.icon.color
                visible: control.display != AbstractButton.TextOnly && source.toString().length > 0
            }
            Text {
                id: btnText
                font: control.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: {
                    if (!control.enabled)
                        return Solar.Theme.colors.disabledText;
                    return control.contentTextColor;
                }
                text: control.text
                visible: control.display != AbstractButton.IconOnly
            }
        }
    }

    Solar.HoverHandler {
        id: hoverHandler
    }
}
