pragma Singleton
import QtQuick

QtObject {
    id: theme

    // ── Theme selection ──
    property string theme: "default"
    property bool isDark: false

    function toggleDark() { isDark = !isDark }

    // ── Theme registry ──
    property var _registry: ({})
    property int _themeVersion: 0

    readonly property var themeNames: {
        var _v = _themeVersion
        return Object.keys(_registry)
    }

    // ── Default palettes (inline reference data for fallback) ──
    readonly property var _defaultLight: ({
        "primary": "#1a5cff",
        "primaryActive": "#004fb3",
        "primaryDisabled": "#98cdfd",
        "primaryHover": "#0062d6",
        "secondary": "#0095ee",
        "secondaryActive": "#0063a7",
        "secondaryDisabled": "#95d8f8",
        "secondaryHover": "#007bca",
        "tertiary": "#6b7075",
        "tertiaryActive": "#41464c",
        "tertiaryHover": "#555b61",
        "success": "#3bb346",
        "successActive": "#25772f",
        "successDisabled": "#a4e0a7",
        "successHover": "#30953b",
        "info": "#1a5cff",
        "infoActive": "#004fb3",
        "infoDisabled": "#98cdfd",
        "infoHover": "#0062d6",
        "warning": "#fc8800",
        "warningActive": "#a84a00",
        "warningHover": "#d26700",
        "danger": "#f93920",
        "dangerActive": "#b2140c",
        "dangerHover": "#d52515",
        "text0": "#1c1f23",
        "text1": "#494c4f",
        "text2": "#77797b",
        "text3": "#b0b1b2",
        "fill0": "#f3f3f4",
        "fill1": "#eaeaeb",
        "fill2": "#e1e1e2",
        "bg0": "#fff",
        "bg1": "#fff",
        "bg2": "#fff",
        "bg3": "#fff",
        "bg4": "#fff",
        "link": "#1a5cff",
        "linkActive": "#004fb3",
        "linkHover": "#0062d6",
        "linkVisited": "#1a5cff",
        "navBg": "#eaeaeb",
        "black": "#000",
        "data0": "#5769ff",
        "data1": "#8ed4e7",
        "data2": "#f58700",
        "data3": "#dcb7fc",
        "data4": "#4a9cf7",
        "data5": "#f3cc35",
        "data6": "#fe8090",
        "data7": "#8bd7d2",
        "data8": "#d458d4",
        "data9": "#bcc6ff",
        "white": "#fff",
        "border": "#1c1f23,8%",
        "shadow": "#000,20%",
        "default_": "#1c1f23",
        "defaultActive": "#c6cacd",
        "defaultHover": "#e6e8ea",
        "focusBorder": "#1a5cff",
        "overlayBg": "#16161a,80%",
        "highlight": "#000",
        "highlightBg": "#fbda32",
        "disabledBg": "#e6e8ea",
        "disabledBorder": "#e6e8ea",
        "disabledFill": "#f7f7f7",
        "disabledText": "#b0b1b2",
        "infoLightActive": "#98cdfd",
        "infoLightDefault": "#eaf5ff",
        "infoLightHover": "#cbe7fe",
        "dangerLightActive": "#fdb7a5",
        "dangerLightDefault": "#fef2ed",
        "dangerLightHover": "#feddd2",
        "primaryLightActive": "#98cdfd",
        "primaryLightDefault": "#eaf5ff",
        "primaryLightHover": "#cbe7fe",
        "successLightActive": "#a4e0a7",
        "successLightDefault": "#ecf7ec",
        "successLightHover": "#d0f0d1",
        "warningLightActive": "#fed998",
        "warningLightDefault": "#fff8ea",
        "warningLightHover": "#feeecc",
        "tertiaryLightActive": "#c6cacd",
        "tertiaryLightDefault": "#f9f9f9",
        "tertiaryLightHover": "#e6e8ea",
        "secondaryLightActive": "#98cdfd",
        "secondaryLightDefault": "#e9f7fd",
        "secondaryLightHover": "#cbe7fe"
    })

    readonly property var _defaultDark: ({
        "primary": "#3295fb",
        "primaryActive": "#98cdfd",
        "primaryDisabled": "#004fb3",
        "primaryHover": "#65b2fc",
        "secondary": "#40b4f3",
        "secondaryActive": "#9ddcf9",
        "secondaryDisabled": "#0366a9",
        "secondaryHover": "#6ec8f6",
        "tertiary": "#888d92",
        "tertiaryActive": "#c6cacd",
        "tertiaryHover": "#a7abb0",
        "success": "#5dc264",
        "successActive": "#a6e1a8",
        "successDisabled": "#277731",
        "successHover": "#7fd184",
        "info": "#54a9ff",
        "infoActive": "#a9d7ff",
        "infoDisabled": "#135cb8",
        "infoHover": "#7fc1ff",
        "warning": "#ffae43",
        "warningActive": "#ffdda1",
        "warningHover": "#ffc772",
        "danger": "#fc725a",
        "dangerActive": "#fdbeac",
        "dangerHover": "#fd9983",
        "text0": "#f9f9f9",
        "text1": "#cbcbcc",
        "text2": "#9e9e9f",
        "text3": "#656568",
        "fill0": "#2e2f34",
        "fill1": "#373948",
        "fill2": "#3f4044",
        "bg0": "#1b1b1e",
        "bg1": "#232429",
        "bg2": "#35363c",
        "bg3": "#43444a",
        "bg4": "#4f5159",
        "link": "#54a9ff",
        "linkActive": "#a9d7ff",
        "linkHover": "#7fc1ff",
        "linkVisited": "#54a9ff",
        "navBg": "#202020",
        "black": "#000",
        "data0": "#5e6dc2",
        "data1": "#086878",
        "data2": "#faad3f",
        "data3": "#4c2b9c",
        "data4": "#107df8",
        "data5": "#f8ca10",
        "data6": "#c31e57",
        "data7": "#057773",
        "data8": "#9acf0d",
        "data9": "#751d8a",
        "white": "#e4e7f5",
        "border": "#fff,8%",
        "shadow": "#000,40%",
        "default_": "#1c1f23",
        "defaultActive": "#41464c",
        "defaultHover": "#2e3238",
        "focusBorder": "#3295fb",
        "overlayBg": "#424242",
        "highlight": "#fff",
        "highlightBg": "#a88e0a",
        "disabledBg": "#2e3238",
        "disabledBorder": "#2e3238",
        "disabledFill": "#e6e8ea,4%",
        "disabledText": "#f9f9f9,35%",
        "infoLightActive": "#2f5176",
        "infoLightDefault": "#233448",
        "infoLightHover": "#28425f",
        "dangerLightActive": "#723b34",
        "dangerLightDefault": "#442927",
        "dangerLightHover": "#5b312d",
        "primaryLightActive": "#214974",
        "primaryLightDefault": "#1c3047",
        "primaryLightHover": "#1e3c5e",
        "successLightActive": "#325b38",
        "successLightDefault": "#253929",
        "successLightHover": "#2b4a30",
        "warningLightActive": "#73532b",
        "warningLightDefault": "#453522",
        "warningLightHover": "#5c4426",
        "tertiaryLightActive": "#43454a",
        "tertiaryLightDefault": "#2d2e32",
        "tertiaryLightHover": "#383a3e",
        "secondaryLightActive": "#275571",
        "secondaryLightDefault": "#1f3646",
        "secondaryLightHover": "#22455b"
    })

    // ── registerTheme(name, lightPalette, darkPalette?) ──
    function registerTheme(name, lightPalette, darkPalette) {
        var keys = Object.keys(_defaultLight)
        var l = {}
        var d = {}
        for (var i = 0; i < keys.length; i++) {
            var k = keys[i]
            l[k] = (lightPalette && lightPalette[k] !== undefined) ? lightPalette[k] : _defaultLight[k]
            d[k] = (darkPalette && darkPalette[k] !== undefined) ? darkPalette[k] : _defaultDark[k]
        }
        _registry[name] = { light: l, dark: d }
        _themeVersion++
        console.log("Theme registered:", name)
    }

    // ── Initialize built-in theme ──
    Component.onCompleted: {
        registerTheme("default", _defaultLight, _defaultDark)
    }

    // ── Utility: convert "#RRGGBB" or "#RGB,XX%" to "#AARRGGBB" ──
    function toColor(val) {
        var idx = val.indexOf(",")
        if (idx === -1)
            return val
        var hex = val.substring(0, idx)
        // Expand 3-char shorthand #RGB → #RRGGBB
        if (hex.length === 4) {
            hex = "#" + hex[1] + hex[1] + hex[2] + hex[2] + hex[3] + hex[3]
        }
        var pct = parseInt(val.substring(idx + 1))
        var alpha = Math.round(pct * 255 / 100)
        var ah = alpha.toString(16).toUpperCase()
        if (ah.length === 1) ah = "0" + ah
        return "#" + ah + hex.substring(1)
    }

    // ── Resolved theme map (normalised to ARGB) ──
    readonly property var currentTheme: {
        var _v = _themeVersion
        var t = theme
        var d = isDark
        var entry = _registry[t]
        if (!entry) entry = _registry["default"]
        var source = d ? entry.dark : entry.light
        var result = {}
        var keys = Object.keys(source)
        for (var i = 0; i < keys.length; i++) {
            result[keys[i]] = toColor(source[keys[i]])
        }
        return result
    }

    property QtObject colors : QtObject {
        id: colors

        readonly property color primary: currentTheme.primary
        readonly property color primaryActive: currentTheme.primaryActive
        readonly property color primaryDisabled: currentTheme.primaryDisabled
        readonly property color primaryHover: currentTheme.primaryHover
        readonly property color secondary: currentTheme.secondary
        readonly property color secondaryActive: currentTheme.secondaryActive
        readonly property color secondaryDisabled: currentTheme.secondaryDisabled
        readonly property color secondaryHover: currentTheme.secondaryHover
        readonly property color tertiary: currentTheme.tertiary
        readonly property color tertiaryActive: currentTheme.tertiaryActive
        readonly property color tertiaryHover: currentTheme.tertiaryHover
        readonly property color success: currentTheme.success
        readonly property color successActive: currentTheme.successActive
        readonly property color successDisabled: currentTheme.successDisabled
        readonly property color successHover: currentTheme.successHover
        readonly property color info: currentTheme.info
        readonly property color infoActive: currentTheme.infoActive
        readonly property color infoDisabled: currentTheme.infoDisabled
        readonly property color infoHover: currentTheme.infoHover
        readonly property color warning: currentTheme.warning
        readonly property color warningActive: currentTheme.warningActive
        readonly property color warningHover: currentTheme.warningHover
        readonly property color danger: currentTheme.danger
        readonly property color dangerActive: currentTheme.dangerActive
        readonly property color dangerHover: currentTheme.dangerHover
        readonly property color text0: currentTheme.text0
        readonly property color text1: currentTheme.text1
        readonly property color text2: currentTheme.text2
        readonly property color text3: currentTheme.text3
        readonly property color fill0: currentTheme.fill0
        readonly property color fill1: currentTheme.fill1
        readonly property color fill2: currentTheme.fill2
        readonly property color bg0: currentTheme.bg0
        readonly property color bg1: currentTheme.bg1
        readonly property color bg2: currentTheme.bg2
        readonly property color bg3: currentTheme.bg3
        readonly property color bg4: currentTheme.bg4
        readonly property color link: currentTheme.link
        readonly property color linkActive: currentTheme.linkActive
        readonly property color linkHover: currentTheme.linkHover
        readonly property color linkVisited: currentTheme.linkVisited
        readonly property color navBg: currentTheme.navBg
        readonly property color black: currentTheme.black
        readonly property color data0: currentTheme.data0
        readonly property color data1: currentTheme.data1
        readonly property color data2: currentTheme.data2
        readonly property color data3: currentTheme.data3
        readonly property color data4: currentTheme.data4
        readonly property color data5: currentTheme.data5
        readonly property color data6: currentTheme.data6
        readonly property color data7: currentTheme.data7
        readonly property color data8: currentTheme.data8
        readonly property color data9: currentTheme.data9
        readonly property color white: currentTheme.white
        readonly property color border: currentTheme.border
        readonly property color shadow: currentTheme.shadow
        readonly property color default_: currentTheme.default_
        readonly property color defaultActive: currentTheme.defaultActive
        readonly property color defaultHover: currentTheme.defaultHover
        readonly property color focusBorder: currentTheme.focusBorder
        readonly property color overlayBg: currentTheme.overlayBg
        readonly property color highlight: currentTheme.highlight
        readonly property color highlightBg: currentTheme.highlightBg
        readonly property color disabledBg: currentTheme.disabledBg
        readonly property color disabledBorder: currentTheme.disabledBorder
        readonly property color disabledFill: currentTheme.disabledFill
        readonly property color disabledText: currentTheme.disabledText
        readonly property color infoLightActive: currentTheme.infoLightActive
        readonly property color infoLightDefault: currentTheme.infoLightDefault
        readonly property color infoLightHover: currentTheme.infoLightHover
        readonly property color dangerLightActive: currentTheme.dangerLightActive
        readonly property color dangerLightDefault: currentTheme.dangerLightDefault
        readonly property color dangerLightHover: currentTheme.dangerLightHover
        readonly property color primaryLightActive: currentTheme.primaryLightActive
        readonly property color primaryLightDefault: currentTheme.primaryLightDefault
        readonly property color primaryLightHover: currentTheme.primaryLightHover
        readonly property color successLightActive: currentTheme.successLightActive
        readonly property color successLightDefault: currentTheme.successLightDefault
        readonly property color successLightHover: currentTheme.successLightHover
        readonly property color warningLightActive: currentTheme.warningLightActive
        readonly property color warningLightDefault: currentTheme.warningLightDefault
        readonly property color warningLightHover: currentTheme.warningLightHover
        readonly property color tertiaryLightActive: currentTheme.tertiaryLightActive
        readonly property color tertiaryLightDefault: currentTheme.tertiaryLightDefault
        readonly property color tertiaryLightHover: currentTheme.tertiaryLightHover
        readonly property color secondaryLightActive: currentTheme.secondaryLightActive
        readonly property color secondaryLightDefault: currentTheme.secondaryLightDefault
        readonly property color secondaryLightHover: currentTheme.secondaryLightHover
    }

    property bool isRounded: true
    property bool animation: true

    // Size
    property real zoom: 1.0
    property real border: 1.0 * zoom
    property real radius: isRounded ? 4 * zoom : 0

    property QtObject font: QtObject {
        readonly property var body: Qt.font({
            family: "Segoe UI, Helvetica Neue, Helvetica, Arial, sans-serif",
            pixelSize: 13 * zoom
        })
        readonly property var title: Qt.font({
            family: "Segoe UI, Helvetica Neue, Helvetica, Arial, sans-serif",
            pixelSize: 15 * zoom,
            weight: Font.SemiBold
        })
        readonly property var caption: Qt.font({
            family: "Segoe UI, Helvetica Neue, Helvetica, Arial, sans-serif",
            pixelSize: 10 * zoom
        })
    }

    onThemeChanged: {
        console.log("Theme changed to", theme)
    }
    onIsDarkChanged: {
        console.log("Dark mode", isDark ? "on" : "off")
    }
}
