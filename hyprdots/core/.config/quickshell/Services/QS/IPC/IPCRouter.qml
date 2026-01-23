import QtQuick
import Quickshell.Io

import qs.Services.QS.States

Item {
    IpcHandler {
        target: "screenshot"

        function toggle() {
            GlobalStatesController.toggleScreenshotMenu();
        }
    }
}
