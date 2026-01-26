import QtQuick
import QtQuick.Layouts

import qs.Modules.Windows
import qs.Modules.Common
import qs.Services.QS.States
import qs.Services.System

MenuWindow {
    id: root

    windowTitle: "Logout menu"
    headerText: "Logout"

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
                GlobalStates.logoutMenuVisible = false;
                ChangeSystemState.logout();
            }
        }
        CustomButton {
            id: noBtn
            text: qsTr("  No")
            KeyNavigation.left: yesBtn
            onClicked: {
                GlobalStates.logoutMenuVisible = false;
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            yesBtn.forceActiveFocus();
        }
    }

    onRequestClose: GlobalStates.logoutMenuVisible = false
}
