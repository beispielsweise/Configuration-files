import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.Appearance
import qs.Modules.Common
import qs.Modules.Shortcuts
import qs.Services.QS.States
import qs.Services.System

FloatingWindow {
    id: root

    title: qsTr("Reboot menu")

    implicitWidth: buttonLayout.implicitWidth + 50
    implicitHeight: 100

    color: Theme.colors.bgMain

    onVisibleChanged: {
        if (visible) {
            yesBtn.forceActiveFocus();
        }
    }

    DefaultLabel {
        id: windowTitle

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
        }
        anchors {
            topMargin: 10
        }

        text: qsTr("Reboot")
    }

    RowLayout {
        id: buttonLayout

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: windowTitle.bottom
        }
        anchors {
            topMargin: 10
        }

        spacing: 10

        CustomButton {
            id: yesBtn
            text: qsTr("  Yes")

            KeyNavigation.right: noBtn
            onClicked: {
                GlobalStates.rebootMenuVisible = false;
                ChangeSystemState.reboot();
            }
        }
        CustomButton {
            id: noBtn
            text: qsTr("  No")
            KeyNavigation.left: yesBtn
            onClicked: {
                GlobalStates.rebootMenuVisible = false;
            }
        }
    }

    // Controller Functions
    onClosed: {
        GlobalStates.rebootMenuVisible = false;
    }

    EscapeShortcut {
        onActivated: {
            GlobalStates.rebootMenuVisible = false;
        }
    }
}
