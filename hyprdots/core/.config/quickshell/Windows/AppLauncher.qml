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
 * A window that loads a custom app launcher with Theme-specific properties
 * Includes Delegate and Model usage examples
 */
FloatingWindow {
    id: root
    title: "App launcher"

    implicitWidth: Theme.appLauncher.windowWidth
    implicitHeight: content.implicitHeight + Theme.appLauncher.windowMargins * 2
    color: Theme.colors.bgMain

    Column {
        id: content
        anchors.fill: parent
        anchors.margins: Theme.appLauncher.windowMargins
        spacing: Theme.appLauncher.mainGap

        TextField {
            id: inputField
            width: parent.width

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

            onTextChanged: updateListView(inputField.text)

            function updateListView(text) {
                AppLauncherService.refilter(text);

                appList.currentIndex = AppLauncherService.appsModel.count > 0 ? 0 : -1;
                if (appList.currentIndex >= 0)
                    appList.positionViewAtIndex(0, ListView.Beginning);
            }
        }

        ListView {
            id: appList
            width: parent.width
            implicitHeight: Theme.appLauncher.maxVisibleRows * Theme.appLauncher.rowHeight
            clip: true

            model: AppLauncherService.appsModel
            delegate: appRowDelegate

            currentIndex: model.count > 0 ? 0 : -1
            highlight: Rectangle {
                radius: Theme.appLauncher.radius
                color: Theme.colors.bgActive
            }
            highlightMoveDuration: Theme.appLauncher.highlightMoveDuration
        }

        Component {
            id: appRowDelegate
            Rectangle {
                id: appItem
                width: ListView.view.width
                height: Theme.appLauncher.rowHeight
                radius: Theme.appLauncher.radius
                color: "transparent"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: appList.currentIndex = index
                    onClicked: {
                        AppLauncherService.launch(index);
                        Qt.callLater(root.requestClose);
                    }
                }

                Row {
                    id: row
                    anchors.fill: parent
                    anchors.leftMargin: Theme.appLauncher.paddingH
                    anchors.rightMargin: Theme.appLauncher.paddingH
                    spacing: Theme.appLauncher.appRowSpacing

                    Image {
                        width: Theme.appLauncher.iconSize
                        height: Theme.appLauncher.iconSize
                        anchors.verticalCenter: parent.verticalCenter

                        source: icon
                        fillMode: Image.PreserveAspectFit
                        asynchronous: true
                        smooth: true
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: name

                        font.pointSize: Theme.appLauncher.pointSizeMedium
                        font.family: Theme.font.fontFamily
                        font.weight: Theme.font.defaultWeight

                        color: Theme.colors.text
                        elide: Text.ElideRight
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: comment

                        font.pointSize: Theme.appLauncher.pointSizeSmall
                        font.family: Theme.font.fontFamily
                        font.weight: Theme.font.defaultWeight

                        color: Theme.colors.textMuted
                        elide: Text.ElideRight
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
                appList.positionViewAtIndex(appList.currentIndex, ListView.Contain);
                e.accepted = true;
                return;
            }

            if (e.key === Qt.Key_Up) {
                appList.currentIndex = (appList.currentIndex - 1) % count;
                appList.positionViewAtIndex(appList.currentIndex, ListView.Contain);
                e.accepted = true;
                return;
            }

            onAccepted: {
                const idx = appList.currentIndex;
                if (idx >= 0) {
                    AppLauncherService.launch(idx);
                    Qt.callLater(root.requestClose);
                }
            }
        }
    }

    // -----------------------------------------------

    Component.onCompleted: {
        inputField.updateListView("");
        AppLauncherService.loadCacheFile();
    }

    onVisibleChanged: {
        if (visible)
            inputField.forceActiveFocus();
    }

    function requestClose() {
        Qt.callLater(() => AppLauncherService.createCacheFile());
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
            if (activeTopLevel.appId !== SystemInformaton.quickshellAppId && Theme.appLauncher.closeOnFocusLoss) {
                root.requestClose();
            }
        }
    }
}
