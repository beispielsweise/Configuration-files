import QtQuick
import Quickshell.Io

import qs.Services.QS.States

Item {
    IpcHandler {
        target: "screenshotMenu"

        function toggle() {
            GlobalStatesController.toggleScreenshotMenu();
        }
    }
}
