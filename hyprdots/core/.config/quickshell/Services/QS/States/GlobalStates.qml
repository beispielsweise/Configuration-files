pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Singleton {
    readonly property string appId: "org.quickshell"

    property bool screenshotMenuVisible: false
    property bool monitorSetupMenuVisible: false
    property bool shutdownMenuVisible: false
    property bool rebootMenuVisible: false
    property bool sleepMenuVisible: false
    property bool logoutMenuVisible: false
}
