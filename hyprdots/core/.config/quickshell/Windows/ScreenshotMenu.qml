import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.Modules.Common
import qs.Services.QS.States

FloatingWindow {
    id: root

    property string customBackgroundColor: "#000000"

    title: qsTr("Screenshot menu")
    implicitWidth: Math.max(400, buttonLayout.implicitWidth + 50)
    implicitHeight: 100
    color: customBackgroundColor

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
        }
        CustomButton {
            id: windowBtn
            text: qsTr("  Active Window")
        }
        CustomButton {
            id: screenBtn
            text: qsTr("󰍹  Fullscreen")
        }
    }

    // Controller Functions
    onClosed: {
        GlobalStates.screenshotMenuVisible = false;
    }
}
