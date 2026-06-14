import QtQuick
import Qt5Compat.GraphicalEffects
import Solar as Solar

Item {
    id: root

    property alias color: colorOverlayId.color
    property alias source: imageId.source
    property alias image: imageId

    implicitHeight: 18 * Solar.Theme.zoom
    implicitWidth: 18 * Solar.Theme.zoom

    Image {
        id: imageId

        width: parent.width
        height: parent.height
        sourceSize: Qt.size(width, height)
        antialiasing: true
        visible: false
    }
    // set svg color
    ColorOverlay {
        id: colorOverlayId

        anchors.fill: imageId
        antialiasing: true
        source: imageId
    }
}
