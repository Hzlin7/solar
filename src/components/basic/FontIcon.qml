import QtQuick
import QtQuick.Controls
import Solar as Solar

Control {
    id: control

    property string name: ""
    property int size: 24
    property color color: Solar.Theme.colors.text0

    contentItem: Text {
        text: Solar.Icons.glyph(control.name)
        font.family: Solar.Icons.fontFamily
        font.pixelSize: control.size
        color: control.color
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
