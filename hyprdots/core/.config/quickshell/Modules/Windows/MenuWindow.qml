import Quickshell
import QtQuick
import Quickshell.Wayland

import qs.Appearance
import qs.Modules.Common
import qs.Modules.Shortcuts
import qs.Services.QS.States

FloatingWindow {
    id: root

    required property string windowTitle
    required property string headerText

    property int buttonSpacing: 18
    property int horizontalPadding: 40
    property int labelHeight: header.implicitHeight

    title: windowTitle

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

    Connections {
        target: ToplevelManager
        function onActiveToplevelChanged() {
            const activeTopLevel = ToplevelManager.activeToplevel;

            if (activeTopLevel.appId != GlobalStates.appId) {
                root.requestClose();
            }
        }
    }
}
