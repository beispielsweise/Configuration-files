import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.Appearance
import qs.Modules.Common
import qs.Services.QS.States
import qs.Services.System

FloatingWindow {
    id: root

    title: qsTr("Screenshot menu")
    implicitWidth: Math.max(400, buttonLayout.implicitWidth + 50)
    implicitHeight: 100
    color: Theme.colors.bgMain

    visible: GlobalStates.screenshotMenuVisible

    DefaultLabel {
        id: windowTitle

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
        }

        anchors {
            topMargin: 10
        }

        text: qsTr("Take screenshot")
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

        spacing: 18

        CustomButton {
            id: areaBtn
            text: qsTr("󱂬  Area select")
            onClicked: {
                GlobalStatesController.toggleScreenshotMenu();
                CaptureScreenshot.capture("area");
            }
        }
        CustomButton {
            id: windowBtn
            text: qsTr("  Active Window")
            onClicked: {
                GlobalStatesController.toggleScreenshotMenu();
                CaptureScreenshot.capture("window");
            }
        }
        CustomButton {
            id: screenBtn
            text: qsTr("󰍹  Fullscreen")
            onClicked: {
                GlobalStatesController.toggleScreenshotMenu();
                CaptureScreenshot.capture("fullscreen");
            }
        }
    }

    // Controller Functions
    onClosed: {
        GlobalStates.screenshotMenuVisible = false;
    }
}
