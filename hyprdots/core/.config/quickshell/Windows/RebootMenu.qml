import QtQuick
import QtQuick.Layouts

import qs.Modules.Windows
import qs.Modules.Common
import qs.Services.QS.States
import qs.Services.System

MenuWindow {
    id: root

    windowTitle: "Reboot menu"
    headerText: "Reboot"

    implicitWidth: buttonLayout.implicitWidth + horizontalPadding
    implicitHeight: labelHeight + buttonLayout.implicitHeight * 2

    RowLayout {
        id: buttonLayout

        spacing: root.buttonSpacing

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

    onVisibleChanged: {
        if (visible) {
            yesBtn.forceActiveFocus();
        }
    }

    onRequestClose: GlobalStates.rebootMenuVisible = false
}
