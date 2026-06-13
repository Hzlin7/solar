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
            font: Solar.Theme.font.title
            color: Solar.Theme.colors.text1
        }

        Solar.Card {
            Layout.fillWidth: true
            height: 80 * Solar.Theme.zoom
            radius: Solar.Theme.radius
            border.width: 0

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10 * Solar.Theme.zoom
                Row {
                    spacing: 20 * Solar.Theme.zoom
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

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
                }

                Solar.Separator {
                    orientation: Qt.Vertical
                    padding: 10 * Solar.Theme.zoom
                    Layout.leftMargin: 10 * Solar.Theme.zoom
                    Layout.rightMargin: 10 * Solar.Theme.zoom
                }

                Row {
                    Layout.alignment: Qt.AlignRight
                    spacing: 10 * Solar.Theme.zoom

                    Text {
                        text: qsTr("Disable")
                        anchors.verticalCenter: parent.verticalCenter
                        font: Solar.Theme.font.body
                        color: Solar.Theme.colors.text2
                    }

                    Solar.ToggleSwitch {
                        id: disabledSwitch1
                        showText: false
                        checked: false
                    }
                }
            }
        }

        Solar.Card {
            Layout.fillWidth: true
            height: 80 * Solar.Theme.zoom
            radius: Solar.Theme.radius
            border.width: 0

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10 * Solar.Theme.zoom
                Row {
                    spacing: 20 * Solar.Theme.zoom
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

                    Solar.ToggleSwitch {
                        checked: true
                        enabled: !disabledSwitch2.checked
                    }
                    Solar.ToggleSwitch {
                        checked: false
                        enabled: !disabledSwitch2.checked
                    }
                }

                Solar.Separator {
                    orientation: Qt.Vertical
                    padding: 10 * Solar.Theme.zoom
                    Layout.leftMargin: 10 * Solar.Theme.zoom
                    Layout.rightMargin: 10 * Solar.Theme.zoom
                }

                Row {
                    Layout.alignment: Qt.AlignRight
                    spacing: 10 * Solar.Theme.zoom

                    Text {
                        text: qsTr("Disable")
                        anchors.verticalCenter: parent.verticalCenter
                        font: Solar.Theme.font.body
                        color: Solar.Theme.colors.text2
                    }

                    Solar.ToggleSwitch {
                        id: disabledSwitch2
                        showText: false
                        checked: false
                    }
                }
            }
        }

        Solar.Card {
            Layout.fillWidth: true
            height: 80 * Solar.Theme.zoom
            radius: Solar.Theme.radius
            border.width: 0

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10 * Solar.Theme.zoom
                Row {
                    spacing: 20 * Solar.Theme.zoom
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

                    Solar.ToggleSwitch {
                        checked: true
                        enabled: !disabledSwitch3.checked
                        onText: qsTr("Switch Enabled")
                        offText: qsTr("Switch Disabled")
                    }
                    Solar.ToggleSwitch {
                        checked: false
                        enabled: !disabledSwitch3.checked
                        onText: qsTr("Switch Enabled")
                        offText: qsTr("Switch Disabled")
                    }
                }

                Solar.Separator {
                    orientation: Qt.Vertical
                    padding: 10 * Solar.Theme.zoom
                    Layout.leftMargin: 10 * Solar.Theme.zoom
                    Layout.rightMargin: 10 * Solar.Theme.zoom
                }

                Row {
                    Layout.alignment: Qt.AlignRight
                    spacing: 10 * Solar.Theme.zoom

                    Text {
                        text: qsTr("Disable")
                        anchors.verticalCenter: parent.verticalCenter
                        font: Solar.Theme.font.body
                        color: Solar.Theme.colors.text2
                    }

                    Solar.ToggleSwitch {
                        id: disabledSwitch3
                        showText: false
                        checked: false
                    }
                }
            }
        }
    }
}
