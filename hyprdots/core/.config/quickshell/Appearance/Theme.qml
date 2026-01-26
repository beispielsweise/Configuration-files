pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick

QtObject {
    property QtObject font: QtObject {
        property string fontFamily: "Google Sans Flex"
    }

    property QtObject colors: QtObject {
        property color bgMain: "#080808"
        property color bgActive: "#212121"
        property color bgDown: "#1b1b1b"
        property color bgHovered: "#424242"
        property color text: "#f1f1f1"
        property color textMuted: "#dcdcdc"
        property color border: "#f9fcf7"
    }

    // Metrics (Hyprland)
    property QtObject hyprland: QtObject {
        property int radius: 7
        property int gapIn: 0
        property int gapOut: 0
    }

    property QtObject customButton: QtObject {
        property int height: 30
        property int pointSize: 11
        property int paddingH: 25
        property int paddingV: 0
        property int radius: 6
        property int borderWidth: 1
        property color borderColor: "#f9fcf7"
    }

    property QtObject defaultLabel: QtObject {
        property int pointSize: 14
    }

    // Function placeholder to apply a parsed theme
    function apply(themeObj) {
    }
}
