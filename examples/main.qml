import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Solar as Solar

ApplicationWindow {
    id: window

    property int margins: isFullScreen() ? 0 : 8

    width: 1200
    height: 800
    visible: true
    title: "Solar - QML Component Library"
    flags: Qt.FramelessWindowHint
    color: Qt.rgba(0, 0, 0, 0)

    // Register custom themes at startup
    CustomThemes {
        id: customThemes
    }

    Solar.ShadowRectangle {
        id: backgroundId
        anchors.fill: parent
        anchors.margins: window.margins
        border.width: 0
        color: Solar.Theme.colors.bg0
        radius: isFullScreen() ? 0 : 8 * Solar.Theme.zoom
    }

    property int resizeMargin: 5

    MouseArea {
        id: resizeArea
        anchors.fill: parent
        anchors.margins: window.margins / 2
        hoverEnabled: true
        visible: !isFullScreen()

        property int resizeEdge: 0

        cursorShape: {
            if (resizeEdge === Qt.TopEdge || resizeEdge === Qt.BottomEdge)
                return Qt.SizeVerCursor
            if (resizeEdge === Qt.LeftEdge || resizeEdge === Qt.RightEdge)
                return Qt.SizeHorCursor
            if (resizeEdge === (Qt.TopEdge | Qt.LeftEdge) || resizeEdge === (Qt.BottomEdge | Qt.RightEdge))
                return Qt.SizeFDiagCursor
            if (resizeEdge === (Qt.TopEdge | Qt.RightEdge) || resizeEdge === (Qt.BottomEdge | Qt.LeftEdge))
                return Qt.SizeBDiagCursor
            return Qt.ArrowCursor
        }

        onPositionChanged: {
            let m = resizeMargin
            let atLeft = mouseX < m
            let atRight = mouseX > width - m
            let atTop = mouseY < m
            let atBottom = mouseY > height - m

            if (atTop && atLeft) resizeEdge = Qt.TopEdge | Qt.LeftEdge
            else if (atTop && atRight) resizeEdge = Qt.TopEdge | Qt.RightEdge
            else if (atBottom && atLeft) resizeEdge = Qt.BottomEdge | Qt.LeftEdge
            else if (atBottom && atRight) resizeEdge = Qt.BottomEdge | Qt.RightEdge
            else if (atTop) resizeEdge = Qt.TopEdge
            else if (atBottom) resizeEdge = Qt.BottomEdge
            else if (atLeft) resizeEdge = Qt.LeftEdge
            else if (atRight) resizeEdge = Qt.RightEdge
            else resizeEdge = 0
        }

        onPressed: {
            if (resizeEdge !== 0)
                window.startSystemResize(resizeEdge)
        }
    }

    ColumnLayout {
        id: mainContent

        anchors.fill: parent
        anchors.margins: window.margins

        // header
        Solar.ShapeRectangle {
            id: header
            Layout.fillWidth: true
            Layout.preferredHeight: 40 * Solar.Theme.zoom
            radius: {
                let r = isFullScreen() ? 0 : Solar.Theme.radius * 2
                return [r,r,0,0]
            }
            color: Solar.Theme.colors.navBg

            MouseArea {
                anchors.fill: parent
                onPressed: window.startSystemMove()
            }

            Row {
                anchors.right: parent.right
                anchors.rightMargin: 5 * Solar.Theme.zoom
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10 * Solar.Theme.zoom

                Solar.IconButton {
                    icon.name: "minus"
                    tip: "Minimize"
                    onClicked: window.showMinimized()
                }

                Solar.IconButton {
                    id: maximizeButton
                    icon.name: window.visibility === Window.Maximized ? "fullscreen-exit" : "fullscreen"
                    tip: window.visibility === Window.Maximized ? "Restore" : "Maximize"
                    onClicked: {
                        if (window.visibility === Window.Maximized) {
                            window.showNormal();
                        } else {
                            window.showMaximized();
                        }
                    }
                }

                Solar.IconButton {
                    icon.name: "close"
                    tip: "Close"
                    onClicked: Qt.quit()
                    hoveredColor: Solar.Theme.colors.dangerHover
                    pressedColor: Solar.Theme.colors.dangerActive
                    icon.color: {
                        if (!enabled) {
                            return Solar.Theme.colors.disabledText;
                        }
                        else if (hovered || pressed) {
                            return "#fff";
                        }
                        return Solar.Theme.colors.text1;
                    }
                }
            }
        }
        RowLayout {
            id: content
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            ListView {
                id: navList
                boundsBehavior: Flickable.StopAtBounds
                Layout.preferredWidth: 200 * Solar.Theme.zoom
                Layout.fillHeight: true
                Layout.margins: 10 * Solar.Theme.zoom
                Layout.rightMargin: 5 * Solar.Theme.zoom
                spacing: 5 * Solar.Theme.zoom
                model: ListModel {
                    ListElement { name: "Button"; source: "pages/ButtonPage.qml" }
                    ListElement { name: "ToggleSwitch"; source: "pages/ToggleSwitchPage.qml" }
                }

                highlightMoveDuration: 200
                highlight: Rectangle {
                    color: Solar.Theme.colors.fill0
                    radius: Solar.Theme.radius

                    Rectangle {
                        anchors.left: parent.left
                        anchors.leftMargin: 5 * Solar.Theme.zoom
                        anchors.verticalCenter: parent.verticalCenter
                        implicitWidth: Math.round(3 * Solar.Theme.zoom)
                        implicitHeight: Math.round(parent.height / 3)
                        color: Solar.Theme.colors.primary
                        radius: width / 2
                    }
                }

                delegate: Item {
                    id: delegateItem
                    width: parent.width
                    height: 40 * Solar.Theme.zoom

                    Rectangle {
                        anchors.fill: parent
                        radius: Solar.Theme.radius
                        color: {
                            if (delegateItem.ListView.isCurrentItem) {
                                return Qt.rgba(0,0,0,0)
                            } else if (mouseArea.pressed) {
                                return Solar.Theme.colors.fill2
                            } else if (mouseArea.containsMouse) {
                                return Solar.Theme.colors.fill1
                            }
                            return Qt.rgba(0,0,0,0)
                        }

                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            onClicked: navList.currentIndex = index
                        }
                    }

                    Text {
                        text: model.name
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20 * Solar.Theme.zoom
                        color: delegateItem.ListView.isCurrentItem ? Solar.Theme.colors.primary : Solar.Theme.colors.text0
                        font: Solar.Theme.body
                    }

                }
            }

            Solar.Separator {
                orientation: Qt.Vertical
                padding: 10 * Solar.Theme.zoom
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 10 * Solar.Theme.zoom
                Layout.leftMargin: 5 * Solar.Theme.zoom
                color: Solar.Theme.colors.fill0
                radius: Solar.Theme.radius

                Loader {
                    id: pageLoader
                    anchors.fill: parent
                }

                Connections {
                    target: navList

                    function onCurrentIndexChanged() {
                        if (navList.currentIndex >= 0) {
                            let model = navList.model.get(navList.currentIndex)
                            pageLoader.source = model.source
                        }
                    }
                }
            }
        }
    }

    function isFullScreen() {
        return (visibility === Window.Maximized || visibility === Window.FullScreen);
    }
}
