import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland

import qs.Appearance
import qs.Modules.Shortcuts
import qs.Services.QS.States

/*!
 * FloatingWindow AppLauncher
 *
 * A window that loads a custom appLauhcer and I have my life even more now
 */
FloatingWindow {
    id: root
    title: "App launcher"

    property bool closeOnFocusLoss: false

    property int windowMargins: 10
    property int rowHeigt: 44
    property int maxVisibleRows: 8

    implicitWidth: 500
    implicitHeight: content.implicitHeight + windowMargins * 2

    color: Theme.colors.bgMain

    // Filler item to set anchors so that compiler doesn't curse
    Item {
        anchors.fill: parent
        anchors.topMargin: root.windowMargins
        anchors.rightMargin: root.windowMargins
        anchors.bottomMargin: root.windowMargins
        anchors.leftMargin: root.windowMargins

        Column {
            id: content
            width: parent.width
            spacing: 15

            // Custom input field. Fully dependant on Theme.qml
            TextField {
                id: inputField

                implicitWidth: parent.width

                placeholderText: "Search"
                placeholderTextColor: Theme.colors.textMuted
                font.pointSize: Theme.appLauncher.pointSize

                leftPadding: Theme.appLauncher.paddingH
                topPadding: Theme.appLauncher.paddingV
                bottomPadding: Theme.appLauncher.paddingV

                color: Theme.colors.text

                background: Rectangle {
                    radius: Theme.appLauncher.radius
                    border.width: Theme.appLauncher.borderWidth
                    border.color: Theme.colors.border
                    color: Theme.colors.bgActive
                }
            }

            ListView {
                id: appList
                implicitWidth: parent.width
                implicitHeight: 3 * (root.rowHeigt)   // ????? 3 hardcode

                model: appsModel
                // clip: true

                delegate: Rectangle {
                    id: appItem
                    width: ListView.view.width
                    height: root.rowHeigt

                    color: Theme.colors.bgActive // This bullshit is hardcoded, needs to be overwritten on appList step up-down, it doesnt have states like.down or .hovered
                    radius: Theme.appLauncher.radius

                    Row {
                        anchors.fill: parent
                        anchors.margins: 12

                        leftPadding: Theme.appLauncher.paddingH + 5

                        spacing: 20         // AGAIN HARDCODED AAAAAAA

                        Rectangle {
                            id: icon

                            // Hardcode my aaaah
                            width: 24
                            height: 24
                            radius: 6
                            color: Theme.colors.bgHovered
                        }

                        Text {
                            id: appName

                            text: name
                            color: Theme.colors.text
                        }

                        Text {
                            id: appComment

                            text: comment
                            color: Theme.colors.textMuted
                            font.pixelSize: 11
                        }
                    }
                }
            }
        }
    }

    // Placeholder model to fill with applications
    ListModel {
        id: appsModel
        ListElement {
            name: "Firefox"
            comment: "Web Browser"
            icon: "firefox"
        }
        ListElement {
            name: "Filewall"
            comment: "Firewall UI"
            icon: "security-high"
        }
        ListElement {
            name: "Discord"
            comment: "Messenger"
            icon: "discord"
        }
    }

    // ----------------------------------------------

    onVisibleChanged: {
        if (visible) {
            inputField.forceActiveFocus();
        }
    }

    function requestClose() {
        GlobalStates.appLauncherVisible = false;
    }

    EscapeShortcut {
        onActivated: root.requestClose()
    }

    onClosed: root.requestClose()

    Connections {
        target: ToplevelManager
        function onActiveToplevelChanged() {
            const activeTopLevel = ToplevelManager.activeToplevel;

            if (activeTopLevel.appId != SystemInformaton.quickshellAppId && root.closeOnFocusLoss) {
                root.requestClose();
            }
        }
    }
}
