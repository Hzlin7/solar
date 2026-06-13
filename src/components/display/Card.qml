import QtQuick
import QtQuick.Controls
import Solar as Solar

Solar.ShadowRectangle {
    id: control

    // shadows: "always" | "hovered" | "none"
    property string shadows: "always"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: control.shadows === "hovered"
    }

    state: shadows

    states: [
        State {
            name: "always"
            PropertyChanges { target: control; shadow: true }
        },
        State {
            name: "hovered"
            PropertyChanges { target: control; shadow: mouseArea.containsMouse }
        },
        State {
            name: "none"
            PropertyChanges { target: control; shadow: false }
        }
    ]
}
