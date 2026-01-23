import Quickshell
import QtQuick

Text {
    id: root

    property int customPointSize: 16
    property string customTextColor: "#f9fcf7"

    font.pointSize: customPointSize
    color: customTextColor
}
