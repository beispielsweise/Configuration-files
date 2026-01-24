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

    IpcHandler {
        target: "shutdownMenu"

        function toggle() {
            GlobalStatesController.toggleShutdownMenu();
        }
    }

    IpcHandler {
        target: "rebootMenu"

        function toggle() {
            GlobalStatesController.toggleRebootMenu();
        }
    }

    IpcHandler {
        target: "sleepMenu"

        function toggle() {
            GlobalStatesController.toggleSleepMenu();
        }
    }

    IpcHandler {
        target: "logoutMenu"

        function toggle() {
            GlobalStatesController.toggleLogoutMenu();
        }
    }
}
