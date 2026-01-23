pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Singleton {
    // Screenshot Window Controller
    function toggleScreenshotMenu() {
        GlobalStates.screenshotMenuVisible = !GlobalStates.screenshotMenuVisible;
    }
}
