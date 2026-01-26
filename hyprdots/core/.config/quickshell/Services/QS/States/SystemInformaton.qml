pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

/*!
 * Singleton SystemInformation
 *
 * Exposes SystemInformation variables to quickshell internals
 */
Singleton {
    readonly property string quickshellAppId: "org.quickshell"
}
