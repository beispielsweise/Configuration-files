pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Singleton {
    function toggleScreenshotMenu() {
        GlobalStates.screenshotMenuVisible = !GlobalStates.screenshotMenuVisible;
    }

    function toggleShutdownMenu() {
        GlobalStates.shutdownMenuVisible = !GlobalStates.shutdownMenuVisible;
    }

    function toggleRebootMenu() {
        GlobalStates.rebootMenuVisible = !GlobalStates.rebootMenuVisible;
    }
}
