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

    title: qsTr("Screenshot menu")

    implicitWidth: Math.max(400, buttonLayout.implicitWidth + 50)
    implicitHeight: 100

    color: Theme.colors.bgMain

    onVisibleChanged: {
        if (visible) {
            areaBtn.forceActiveFocus();
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

        text: qsTr("Screenshot")
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
            id: areaBtn
            text: qsTr("󱂬  Area select")
            KeyNavigation.right: windowBtn
            onClicked: {
                GlobalStates.screenshotMenuVisible = false;
                CaptureScreenshot.capture("area");
            }
        }
        CustomButton {
            id: windowBtn
            text: qsTr("  Active Window")
            KeyNavigation.right: screenBtn
            KeyNavigation.left: areaBtn
            onClicked: {
                GlobalStates.screenshotMenuVisible = false;
                CaptureScreenshot.capture("window");
            }
        }
        CustomButton {
            id: screenBtn
            text: qsTr("󰍹  Fullscreen")
            KeyNavigation.left: windowBtn
            onClicked: {
                GlobalStates.screenshotMenuVisible = false;
                CaptureScreenshot.capture("fullscreen");
            }
        }
    }

    // Controller Functions
    onClosed: {
        GlobalStates.screenshotMenuVisible = false;
    }

    EscapeShortcut {
        onActivated: {
            GlobalStates.screenshotMenuVisible = false;
        }
    }
}
