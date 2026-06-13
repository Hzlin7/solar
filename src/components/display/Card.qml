import QtQuick
import QtQuick.Controls
import Solar as Solar

Solar.ShadowRectangle {
    id: control

    // shadows: "always" | "hovered" | "none"
    property string shadows: "always"

    HoverHandler {
        id: hoverHandler
        enabled: control.shadows === "hovered"
    }

    state: shadows

    states: [
        State {
            name: "always"
            PropertyChanges { target: control; shadow: true }
        },
        State {
            name: "hovered"
            PropertyChanges { target: control; shadow: hoverHandler.hovered }
        },
        State {
            name: "none"
            PropertyChanges { target: control; shadow: false }
        }
    ]
}
