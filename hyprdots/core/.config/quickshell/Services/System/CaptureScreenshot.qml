pragma Singleton
import QtQuick
import Quickshell

QtObject {
    readonly property string scriptPath: Quickshell.env("HOME") + "/.config/quickshell/scripts/CaptureScreenshot.sh"

    function capture(mode) {
        Quickshell.execDetached(["sh", scriptPath, "--" + mode]);
    }
}
