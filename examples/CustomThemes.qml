import QtQuick
import Solar as Solar
import "themes"

Item {
    id: customThemes

    Conifer { id: coniferPal }

    Component.onCompleted: {
        Solar.Theme.zoom = 1.2
        Solar.Theme.registerTheme("conifer", coniferPal.light, coniferPal.dark)
        console.log("Custom themes registered:", Solar.Theme.themeNames)
    }
}
