pragma Singleton
import QtQuick
import Quickshell

QtObject {
    function shutdown() {
        Quickshell.execDetached(["sh", "-c", "shutdown -h now"]);
    }

    function reboot() {
        Quickshell.execDetached(["sh", "-c", "reboot"]);
    }

    function sleep() {
        Quickshell.execDetached(["sh", "-c", "systemctl suspend"]);
    }

    function logout() {
        Quickshell.execDetached(["sh", "-c", "hyprctl dispatch exit"]);
    }
}
