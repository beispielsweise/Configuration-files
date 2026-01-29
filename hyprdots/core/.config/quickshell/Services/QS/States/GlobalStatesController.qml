pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

/*!
 * Singleton GlobalStatesController
 *
 * Exposes GlobalStates toggles to quickshell internals
 */
Singleton {
    function toggleBar() {
        GlobalStates.barVisible = !GlobalStates.barVisible;
    }

    function toggleAppLauncher() {
        GlobalStates.appLauncherVisible = !GlobalStates.appLauncherVisible;
    }

    function toggleScreenshotMenu() {
        GlobalStates.screenshotMenuVisible = !GlobalStates.screenshotMenuVisible;
    }

    function toggleMonitorSetupMenu() {
        GlobalStates.monitorSetupMenuVisible = !GlobalStates.monitorSetupMenuVisible;
    }

    function toggleShutdownMenu() {
        GlobalStates.shutdownMenuVisible = !GlobalStates.shutdownMenuVisible;
    }

    function toggleRebootMenu() {
        GlobalStates.rebootMenuVisible = !GlobalStates.rebootMenuVisible;
    }

    function toggleSleepMenu() {
        GlobalStates.sleepMenuVisible = !GlobalStates.sleepMenuVisible;
    }

    function toggleLogoutMenu() {
        GlobalStates.logoutMenuVisible = !GlobalStates.logoutMenuVisible;
    }
}
