import QtQuick
import QtQuick.Layouts

import qs.Modules.Windows
import qs.Modules.Common
import qs.Services.QS.States
import qs.Services.System

MenuWindow {
    id: root

    windowTitle: "Shutdown menu"
    headerText: "Shutdown"

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
                GlobalStates.shutdownMenuVisible = false;
                ChangeSystemState.shutdown();
            }
        }
        CustomButton {
            id: noBtn
            text: qsTr("  No")
            KeyNavigation.left: yesBtn
            onClicked: {
                GlobalStates.shutdownMenuVisible = false;
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            yesBtn.forceActiveFocus();
        }
    }

    onRequestClose: GlobalStates.shutdownMenuVisible = false
}
