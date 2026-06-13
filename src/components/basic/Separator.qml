import QtQuick
import Solar as Solar

Rectangle {
    id: control

    property real padding: 0
    property var orientation: Qt.Horizontal
    readonly property bool horizontal: orientation === Qt.Horizontal
    readonly property bool vertical: orientation === Qt.Vertical

    implicitWidth: orientation === Qt.Vertical ? 1 : parent.width - 2 * padding
    implicitHeight: orientation === Qt.Vertical ? parent.height - 2 * padding : 1

    x: orientation === Qt.Vertical ? 0 : padding
    y: orientation === Qt.Vertical ? padding : 0
    color: Solar.Theme.colors.border
}
