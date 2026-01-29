import Quickshell
import QtQuick

PanelWindow {
    Rectangle {
        id: frame
        anchors.fill: parent
        antialiasing: true

        Item {
            id: contentRoot
            anchors.fill: parent
            anchors.margins: 0
        }
    }
}
