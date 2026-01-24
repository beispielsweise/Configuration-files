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
}
