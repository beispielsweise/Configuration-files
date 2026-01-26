pragma Singleton
import QtQuick
import Quickshell

/*!
 * QtObject ChangeMonitorSetup
 *
 * A service that runs logic for changing monitor setup
 */
QtObject {
    readonly property string scriptPath: Quickshell.env("HOME") + "/.config/quickshell/scripts/ChangeMonitorSetup.sh"

    function changeMode(mode) {
        Quickshell.execDetached(["sh", scriptPath, "--" + mode]);
    }
}
