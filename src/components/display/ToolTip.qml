import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Solar as Solar

T.ToolTip {
    id: root

    property real yPadding: 0
    property bool animation: Solar.Theme.animation

    x: parent ? (parent.width - implicitWidth) / 2 : 0
    y: -implicitHeight - yPadding + 10 * Solar.Theme.zoom
    implicitWidth: Math.min(
                       250 * Solar.Theme.zoom, Math.max(
                           implicitBackgroundWidth + leftInset + rightInset,
                           contentWidth + leftPadding + rightPadding))
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)
    margins: 0
    padding: 10 * Solar.Theme.zoom
    topPadding: 8 * Solar.Theme.zoom
    bottomPadding: 8 * Solar.Theme.zoom
    visible: text.length > 0 && parent.hovered && parent.enabled
             && !parent.pressed
    delay: 1000
    timeout: 4000
    font: Solar.Theme.font.body
    closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent
                 | T.Popup.CloseOnReleaseOutsideParent

    QtObject {
        id: d

        property real toolTipX: root.parent ? (root.parent.width - root.implicitWidth) / 2 : 0
        property real indicatorWidth: 14 * Solar.Theme.zoom
        property real indicatorHeight: 8 * Solar.Theme.zoom
        property real indicatorX: {
            if (toolTipX < root.x - 0.01) {
                return root.parent ? (root.parent.width - indicatorWidth) / 2 : 0
            }
            if (toolTipX > root.x + 0.01) {
                return root.implicitWidth - (root.parent ? (root.parent.width
                                                            + indicatorWidth) / 2 : 0)
            }
            return (root.implicitWidth - indicatorWidth) / 2
        }
        property bool indicatorTop: root.y > 0
    }

    enter: Transition {
        enabled: root.animation
        ParallelAnimation {
            alwaysRunToEnd: true
            NumberAnimation {
                property: "y"
                duration: 300
                from: -implicitHeight - yPadding + 10 * Solar.Theme.zoom
                to: -implicitHeight - yPadding
                easing.type: Easing.OutBack
                alwaysRunToEnd: true
            }
            NumberAnimation {
                property: "implicitWidth"
                duration: 200
                from: 0
                to: Math.min(
                        250 * Solar.Theme.zoom, Math.max(
                            implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding))
                easing.type: Easing.InOutCubic
                alwaysRunToEnd: true
            }
        }
    }

    contentItem: Text {
        topPadding: d.indicatorTop ? d.indicatorHeight : 0
        bottomPadding: d.indicatorTop ? 0 : d.indicatorHeight
        text: root.text
        color: Solar.Theme.colors.white
        font: root.font
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
    background: Canvas {
        id: canvas

        property color fillColor: Solar.Theme.colors.overlayBg

        onPaint: {
            var ctx = getContext("2d")
            var ix = d.indicatorX
            var ih = d.indicatorHeight
            var iw = d.indicatorWidth
            var r = Solar.Theme.radius
            var ri = Math.min(r, iw / 4, ih)
            var rx = x
            var ry = d.indicatorTop ? (y + ih) : y
            var rh = height - ih
            var rw = width
            ctx.reset()
            ctx.fillStyle = canvas.fillColor
            ctx.lineWidth = 1
            ctx.lineCap = "round"
            ctx.beginPath()
            ctx.moveTo(rx + r, ry)
            if (d.indicatorTop) {
                ctx.lineTo(ix, ry)
                if (r > 0)
                    ctx.arcTo(ix + iw / 2, y, ix + iw, ry, ri)
                else
                    ctx.lineTo(ix + iw / 2, y)
                ctx.lineTo(ix + iw, ry)
            }
            ctx.lineTo(rx + rw - r, ry)
            ctx.arcTo(rx + rw, ry, rx + rw, ry + r, r)
            ctx.lineTo(rx + rw, ry + rh - r)
            ctx.arcTo(rx + rw, ry + rh, rx + rw - r, ry + rh, r)
            if (!d.indicatorTop) {
                ctx.lineTo(ix + iw, ry + rh)
                if (r > 0)
                    ctx.arcTo(ix + iw / 2, y + height, ix, ry + rh, ri)
                else
                    ctx.lineTo(ix + iw / 2, y + height)
                ctx.lineTo(ix, ry + rh)
            }
            ctx.lineTo(rx + r, ry + rh)
            ctx.arcTo(rx, ry + rh, rx, ry + rh - r, r)
            ctx.lineTo(rx, ry + r)
            ctx.arcTo(rx, ry, rx + r, ry, r)
            ctx.closePath()
            ctx.fill()
        }
    }
}
