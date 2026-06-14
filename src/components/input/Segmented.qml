import QtQuick
import QtQuick.Controls
import Solar as Solar

Item {
    id: control

    enum Style { Square, Rounded }

    default property alias options: d.children
    property alias currentIndex: listView.currentIndex
    property alias spacing: listView.spacing
    property alias orientation: listView.orientation
    property alias margins: listView.anchors.margins
    property bool animation: true
    property int style: Segmented.Style.Square

    readonly property real delegateHeight: 30 * Solar.Theme.zoom
    implicitHeight: delegateHeight + 2 * margins
    implicitWidth: listView.contentWidth + 2 * margins

    QtObject {
        id: d
        default property list<QtObject> children
    }

    Rectangle {
        id: background
        anchors.fill: parent
        radius: control.style === Segmented.Style.Square ? Solar.Theme.radius * 1.5 : height / 2
        color: {
            if (!control.enabled)
                return Solar.Theme.colors.disabledBg;
            return Solar.Theme.colors.fill0
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        anchors.margins: 2 * Solar.Theme.zoom
        orientation: ListView.Horizontal
        interactive: false
        spacing: 1 * Solar.Theme.zoom
        currentIndex: 0
        highlightMoveDuration: control.animation ? 250 : 0
        highlightResizeDuration: control.animation ? 250 : 0
        highlightFollowsCurrentItem: true

        highlight: Rectangle {
            radius: control.style === Segmented.Style.Square ? Solar.Theme.radius : height / 2
            color: {
                return Solar.Theme.colors.primary;
            }
        }

        model: control.options
        delegate: segmentDelegate
    }

    Component {
        id: segmentDelegate

        Item {
            id: segmentItem

            property bool _selected: ListView.isCurrentItem

            implicitHeight: listView.height
            implicitWidth: Math.max(listView.height, contentRow.width)

            HoverHandler {
                id: hoverHandler
                enabled: modelData.enabled && !_selected
            }

            // Hover background (unselected items only)
            Rectangle {
                anchors.fill: parent
                radius: control.style === Segmented.Style.Square ? Solar.Theme.radius : height / 2
                color: hoverHandler.hovered ? Solar.Theme.colors.fill1 : "transparent"
                opacity: hoverHandler.hovered ? 1 : 0
                visible: !_selected || !modelData.enabled

                Behavior on opacity {
                    enabled: control.animation
                    NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
                }
            }

            Row {
                id: contentRow
                anchors.centerIn: parent
                spacing: 4 * Solar.Theme.zoom

                Solar.ColoredSvg {
                    id: iconImage
                    visible: modelData.icon !== undefined && modelData.icon !== ""
                    source: modelData.icon
                    height: segmentItem.implicitHeight * 0.5
                    width: height
                    anchors.verticalCenter: parent.verticalCenter
                    color: _selected ? Solar.Theme.colors.white : Solar.Theme.colors.text1
                }
                Text {
                    id: labelText
                    text: modelData.label
                    visible: text !== ""
                    topPadding: 4 * Solar.Theme.zoom
                    bottomPadding: 4 * Solar.Theme.zoom
                    leftPadding: 8 * Solar.Theme.zoom
                    rightPadding: 8 * Solar.Theme.zoom
                    font: Solar.Theme.font.body
                    color: {
                        if (!modelData.enabled) return Solar.Theme.colors.disabledText
                        if (_selected) return Solar.Theme.colors.white
                        return Solar.Theme.colors.text1
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            MouseArea {
                anchors.fill: parent
                enabled: modelData.enabled && !_selected
                cursorShape: modelData.enabled ? Qt.PointingHandCursor : Qt.ForbiddenCursor
                onClicked: listView.currentIndex = index
            }
        }
    }
}
