import Quickshell
import QtQuick

import qs.Appearance
import qs.Modules.Common
import qs.Modules.Shortcuts

FloatingWindow {
    id: root

    required property string windowTitle
    required property string headerText

    property int buttonSpacing: 18
    property int horizontalPadding: 40

    title: windowTitle

    // set implicitWidth in the actual window
    implicitHeight: 85

    color: Theme.colors.bgMain

    DefaultLabel {
        id: header

        anchors.top: parent.top
        anchors.topMargin: 5

        anchors.horizontalCenter: parent.horizontalCenter

        text: root.headerText
    }

    default property alias content: buttonLayout.data
    Item {
        id: buttonLayout

        anchors.top: header.bottom
        anchors.topMargin: 10

        // anchors.horizontalCenter: parent.horizontalCenter remplacement
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.leftMargin: root.horizontalPadding / 2
        anchors.rightMargin: root.horizontalPadding / 2
    }

    // ---------------------------------------------------

    signal requestClose

    EscapeShortcut {
        onActivated: root.requestClose()
    }

    onClosed: root.requestClose()
}
