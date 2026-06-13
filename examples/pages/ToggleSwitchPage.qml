import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Solar as Solar

Flickable {
    contentHeight: content.implicitHeight
    boundsBehavior: Flickable.StopAtBounds

    ColumnLayout {
        id: content
        spacing: 20 * Solar.Theme.zoom
        anchors.fill: parent
        anchors.margins: 20 * Solar.Theme.zoom

        Text {
            text: qsTr("Toggle Switch")
            font: Solar.Theme.title
            color: Solar.Theme.colors.text1
        }

        Solar.Card {
            Layout.fillWidth: true
            height: 100 * Solar.Theme.zoom
            radius: Solar.Theme.radius
            border.width: 0

            Row {
                spacing: 20 * Solar.Theme.zoom
                padding: 20 * Solar.Theme.zoom
                anchors.verticalCenter: parent.verticalCenter

                Solar.ToggleSwitch {
                    checked: true
                    enabled: !disabledSwitch1.checked
                    showText: false
                }
                Solar.ToggleSwitch {
                    checked: false
                    enabled: !disabledSwitch1.checked
                    showText: false
                }
                Solar.ToggleSwitch {
                    id: disabledSwitch1
                    checked: false
                }
            }
        }
    }
}
