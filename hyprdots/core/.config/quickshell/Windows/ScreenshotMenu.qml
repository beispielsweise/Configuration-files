import QtQuick
import QtQuick.Layouts

import qs.Modules.Windows
import qs.Modules.Common
import qs.Services.QS.States
import qs.Services.System

MenuWindow {
    id: root

    windowTitle: "Screenshot menu"
    headerText: "Screenshot"

    implicitWidth: buttonLayout.implicitWidth + horizontalPadding
    implicitHeight: labelHeight + buttonLayout.implicitHeight * 2

    RowLayout {
        id: buttonLayout

        spacing: root.buttonSpacing

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

    onVisibleChanged: {
        if (visible) {
            areaBtn.forceActiveFocus();
        }
    }

    onRequestClose: GlobalStates.screenshotMenuVisible = false
}
