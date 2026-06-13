import QtQuick
import QtQuick.Controls
import Solar as Solar

Rectangle {
    id: control

    color: Qt.rgba(0, 0, 0, 0)
    border.color: Solar.Theme.colors.focusBorder
    border.width: Solar.Theme.border
    radius: parent.radius
    anchors.fill: parent
}
