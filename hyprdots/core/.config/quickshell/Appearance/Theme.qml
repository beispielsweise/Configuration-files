pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick

/*!
 *  QtObject Theme
 *
 *  Holds active theme-defined values
 */
QtObject {
    property QtObject font: QtObject {
        property string fontFamily: "Google Sans Flex"
        property int defaultWeight: Font.Medium
        property int extraWeight: Font.DemiBold
    }

    property QtObject colors: QtObject {
        property color bgMain: "#080808"
        property color bgActive: "#212121"
        property color bgDown: "#1b1b1b"
        property color bgHovered: "#424242"
        property color text: "#f1f1f1"
        property color textMuted: "#494949"
        property color border: "#f9fcf7"
    }


    property QtObject appLauncher: QtObject {
        property bool closeOnFocusLoss: false
        property int windowWidth: 500
        property int windowMargins: 10
        property int pointSizeBig: 13
        property int pointSizeMedium: 11
        property int pointSizeSmall: 10
        property int paddingH: 20                       // content padding from left/right, like: | <padding> active
        property int paddingV: 12                       // content padding from top/bottom
        property int radius: 19                         // universal
        property int borderWidth: 1
        property int iconSize: 25
        property int iconRadius: 5
        property int mainGap: 15                        // gap between inputField and List items
        property int rowHeight: 44                      // single list item height
        property int maxVisibleRows: 8
        property int appRowSpacing: 20                  // gap between each list item
        property int highlightMoveDuration: 90
    }

    property QtObject customButton: QtObject {
        property int height: 30
        property int pointSize: 11
        property int paddingH: 25
        property int paddingV: 0
        property int radius: 6
        property int borderWidth: 1
        property int animationSpeed: 200
        property int animationType: Easing.OutCubic
    }

    property QtObject defaultLabel: QtObject {
        property int pointSize: 14
    }

    // Metrics (Hyprland)
    property QtObject hyprland: QtObject {
        property int radius: 7
        property int gapIn: 0
        property int gapOut: 0
    }

    // Function placeholder to apply a parsed theme
    function apply(themeObj) {
    }
}
