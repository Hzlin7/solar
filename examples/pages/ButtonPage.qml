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
            text: qsTr("Button")
            font: Solar.Theme.font.title
            color: Solar.Theme.colors.text1
        }

        Solar.Card {
            Layout.fillWidth: true
            height: 80 * Solar.Theme.zoom
            radius: Solar.Theme.radius
            color: Solar.Theme.colors.bg1
            border.width: 0

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20 * Solar.Theme.zoom
                Row {
                    spacing: 20 * Solar.Theme.zoom
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

                    Solar.Button {
                        text: qsTr("Normal")
                        enabled: !disabledSwitch1.checked
                    }
                    Solar.Button {
                        text: qsTr("Solid")
                        style: Solar.Button.Style.Solid
                        enabled: !disabledSwitch1.checked
                    }
                    Solar.Button {
                        text: qsTr("Transparent")
                        style: Solar.Button.Style.Transparent
                        enabled: !disabledSwitch1.checked
                    }
                    Solar.Button {
                        text: qsTr("Outline")
                        style: Solar.Button.Style.Outline
                        enabled: !disabledSwitch1.checked
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
            color: Solar.Theme.colors.bg1
            border.width: 0

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20 * Solar.Theme.zoom
                Row {
                    spacing: 20 * Solar.Theme.zoom
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

                    Solar.Button {
                        text: qsTr("Normal")
                        icon.source: Qt.resolvedUrl("../resources/image/sun.svg")
                        enabled: !disabledSwitch2.checked
                    }
                    Solar.Button {
                        text: qsTr("Solid")
                        icon.source: Qt.resolvedUrl("../resources/image/sun.svg")
                        style: Solar.Button.Style.Solid
                        enabled: !disabledSwitch2.checked
                    }
                    Solar.Button {
                        text: qsTr("Transparent")
                        icon.source: Qt.resolvedUrl("../resources/image/sun.svg")
                        style: Solar.Button.Style.Transparent
                        enabled: !disabledSwitch2.checked
                    }
                    Solar.Button {
                        text: qsTr("Outline")
                        icon.source: Qt.resolvedUrl("../resources/image/sun.svg")
                        style: Solar.Button.Style.Outline
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
            color: Solar.Theme.colors.bg1
            border.width: 0

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20 * Solar.Theme.zoom
                Row {
                    spacing: 20 * Solar.Theme.zoom
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

                    Solar.FloatingButton {
                        radius: height / 2
                        leftPadding: padding
                        rightPadding: padding
                        minWidth: height
                        display: AbstractButton.IconOnly
                        icon.source: Qt.resolvedUrl("../resources/image/sun.svg")
                        enabled: !disabledSwitch3.checked
                    }

                    Solar.FloatingButton {
                        radius: height / 2
                        leftPadding: padding
                        rightPadding: padding
                        minWidth: height
                        display: AbstractButton.IconOnly
                        icon.source: Qt.resolvedUrl("../resources/image/sun.svg")
                        style: Solar.Button.Style.Solid
                        enabled: !disabledSwitch3.checked
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

        Solar.Card {
            Layout.fillWidth: true
            height: 80 * Solar.Theme.zoom
            radius: Solar.Theme.radius
            color: Solar.Theme.colors.bg1
            border.width: 0

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20 * Solar.Theme.zoom
                Row {
                    spacing: 20 * Solar.Theme.zoom
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

                    Solar.IconButton {
                        icon.source: Qt.resolvedUrl("../resources/image/sun.svg")
                        enabled: !disabledSwitch4.checked
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
                        id: disabledSwitch4
                        showText: false
                        checked: false
                    }
                }
            }
        }
    }
}
