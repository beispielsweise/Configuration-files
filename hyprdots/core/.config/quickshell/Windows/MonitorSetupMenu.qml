import QtQuick
import QtQuick.Layouts

import qs.Modules.Windows
import qs.Modules.Common
import qs.Services.QS.States
import qs.Services.System

MenuWindow {
    id: root

    windowTitle: "Change monitor menu"
    headerText: "Change monitor"

    implicitWidth: buttonLayout.implicitWidth + horizontalPadding

    RowLayout {
        id: buttonLayout

        spacing: root.buttonSpacing

        CustomButton {
            id: internalBtn
            text: qsTr("󰍹 󰶐   Internal Only")
            maxWidth: 180
            KeyNavigation.right: externalBtn
            onClicked: {
                GlobalStates.monitorSetupMenuVisible = false;
                ChangeMonitorSetup.changeMode("internal");
            }
        }
        CustomButton {
            id: externalBtn
            text: qsTr("󰶐 󰍹   External Only")
            maxWidth: 180
            KeyNavigation.left: internalBtn
            KeyNavigation.right: mirrorBtn
            onClicked: {
                GlobalStates.monitorSetupMenuVisible = false;
                ChangeMonitorSetup.changeMode("external");
            }
        }
        CustomButton {
            id: mirrorBtn
            text: qsTr("󰍺 󰍺   Mirror")
            maxWidth: 180
            KeyNavigation.left: externalBtn
            KeyNavigation.right: extendBtn
            onClicked: {
                GlobalStates.monitorSetupMenuVisible = false;
                ChangeMonitorSetup.changeMode("mirror");
            }
        }
        CustomButton {
            id: extendBtn
            text: qsTr("󰷜 󱄄   Extend")
            maxWidth: 180
            KeyNavigation.left: mirrorBtn
            onClicked: {
                GlobalStates.monitorSetupMenuVisible = false;
                ChangeMonitorSetup.changeMode("extend");
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            internalBtn.forceActiveFocus();
        }
    }

    onRequestClose: GlobalStates.monitorSetupMenuVisible = false
}
