import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Solar as Solar

Flickable {
    clip: true
    boundsBehavior: Flickable.StopAtBounds

    Solar.Segmented {
        Solar.SegmentedItem {
            label: qsTr("Option 1")
        }
        Solar.SegmentedItem {
            label: qsTr("Option 2")
        }
    }

}
