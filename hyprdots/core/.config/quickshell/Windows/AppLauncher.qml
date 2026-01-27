import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland

import qs.Appearance
import qs.Modules.Shortcuts
import qs.Services.QS.States
import qs.Services.System

/*!
 * FloatingWindow AppLauncher
 *
 * A window that loads a custom appLauhcer and I have my life even more now
 */
FloatingWindow {
    id: root
    title: "App launcher"

    implicitWidth: 500
    implicitHeight: content.implicitHeight + Theme.appLauncher.windowMargins * 2

    color: Theme.colors.bgMain

    // Filler item to set anchors so that compiler doesn't curse
    Item {
        anchors.fill: parent
        anchors.topMargin: Theme.appLauncher.windowMargins
        anchors.rightMargin: Theme.appLauncher.windowMargins
        anchors.bottomMargin: Theme.appLauncher.windowMargins
        anchors.leftMargin: Theme.appLauncher.windowMargins

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
                font.pointSize: Theme.appLauncher.pointSizeBig
                font.family: Theme.font.fontFamily
                font.weight: Theme.font.extraWeight

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

                onTextChanged: {
                    AppLauncherService.refilter(text);

                    appList.currentIndex = AppLauncherService.appsModel.count > 0 ? 0 : -1;

                    if (appList.currentIndex >= 0)
                        appList.positionViewAtIndex(0, ListView.Beginning);
                }
            }

            ListView {
                id: appList
                implicitWidth: parent.width
                implicitHeight: Math.min(AppLauncherService.appsModel.count, Theme.appLauncher.maxVisibleRows) * Theme.appLauncher.rowHeight
                clip: true

                Component.onCompleted: {
                    AppLauncherService.loadCacheFile();
                }
                model: AppLauncherService.appsModel
                currentIndex: model.count > 0 ? 0 : -1

                highlight: Rectangle {
                    radius: Theme.appLauncher.radius
                    color: Theme.colors.bgActive
                }
                highlightMoveDuration: 90

                delegate: Rectangle {
                    id: appItem
                    width: ListView.view.width
                    height: Theme.appLauncher.rowHeight

                    color: "transparent"
                    radius: Theme.appLauncher.radius

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                        onEntered: appList.currentIndex = index
                        onClicked: AppLauncherService.activate(index)

                        Row {
                            id: appItemConent
                            anchors.fill: parent
                            anchors.margins: appItemConent.implicitHeight / 2

                            spacing: Theme.appLauncher.appRowSpacing

                            Image {
                                width: Theme.appLauncher.iconSize
                                height: Theme.appLauncher.iconSize
                                source: "image://theme/" + icon
                                fillMode: Image.PreserveAspectFit
                                asynchronous: true
                                smooth: true
                            }

                            Text {
                                id: appName

                                text: name
                                font.pointSize: Theme.appLauncher.pointSizeMedium
                                font.family: Theme.font.fontFamily
                                font.weight: Theme.font.defaultWeight

                                color: Theme.colors.text

                                verticalAlignment: Text.AlignVCenter
                            }

                            Text {
                                id: appComment

                                text: comment
                                font.pointSize: Theme.appLauncher.pointSizeSmall
                                font.family: Theme.font.fontFamily
                                font.weight: Theme.font.defaultWeight

                                // italic
                                color: Theme.colors.textMuted

                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
            }
            Keys.onPressed: e => {
                const count = AppLauncherService.appsModel.count;
                if (count <= 0)
                    return;

                if (e.key === Qt.Key_Tab || e.key === Qt.Key_Down) {
                    appList.currentIndex = (appList.currentIndex + 1) % count;
                    appList.positionViewAtIndex(appList.currentIndex, ListView.Visible);
                    e.accepted = true;
                    return;
                }

                if (e.key === Qt.Key_Up) {
                    appList.currentIndex = (appList.currentIndex - 1 + count) % count;
                    appList.positionViewAtIndex(appList.currentIndex, ListView.Visible);
                    e.accepted = true;
                    return;
                }

                if (e.key === Qt.Key_Enter) {
                    AppLauncherService.activate(appList.currentIndex);
                    e.accepted = true;
                    return;
                }
            }
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

            if (activeTopLevel.appId != SystemInformaton.quickshellAppId && Theme.appLauncher.closeOnFocusLoss) {
                root.requestClose();
            }
        }
    }
}
