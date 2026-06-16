import QtQuick
import QtQuick.Controls
import Solar as Solar

Solar.IconButton {
    id: control

    contentItem: Solar.FontIcon {
        name: control.icon.name
        size: 18 * Solar.Theme.zoom
        color: control.icon.color
    }
}
