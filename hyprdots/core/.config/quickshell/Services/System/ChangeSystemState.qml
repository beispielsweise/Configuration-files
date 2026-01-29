pragma Singleton
import QtQuick
import Quickshell

/*!
 * QtObject ChangeSystemState
 *
 * A service that changes global system state
 */

QtObject {
    function shutdown() {
        Quickshell.execDetached(["sh", "-c", "shutdown -h now"]);
    }

    function reboot() {
        Quickshell.execDetached(["sh", "-c", "reboot"]);
    }

    function sleep() {
        Quickshell.execDetached(["sh", "-c", "systemctl hibernate"]);
    }

    function logout() {
        Quickshell.execDetached(["sh", "-c", "hyprctl dispatch exit"]);
    }
}
