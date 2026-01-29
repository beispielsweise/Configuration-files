pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

/*!
 * Singleton GlobalStates
 *
 * Holds current window visibility states
 */
Singleton {
    property bool barVisible: false // should be set to true by default
    property bool appLauncherVisible: false
    property bool screenshotMenuVisible: false
    property bool monitorSetupMenuVisible: false
    property bool shutdownMenuVisible: false
    property bool rebootMenuVisible: false
    property bool sleepMenuVisible: false
    property bool logoutMenuVisible: false
}
