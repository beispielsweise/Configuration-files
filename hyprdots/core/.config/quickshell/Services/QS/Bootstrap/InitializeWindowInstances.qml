import Quickshell
import QtQuick

import qs.Services.QS.States
import qs.Windows
import qs.Windows.Menu

/*
 * Scope InitizlizeWindowInstances
 *
 * Is designed to be used on quickshell launch via shell.qml
 * Loads Bar{} immediately, other windows load on-demand with Loader
 */
Scope {
    Bar {
        visible: GlobalStates.barVisible
    }

    Loader {
        id: appLauncher
        active: GlobalStates.appLauncherVisible
        asynchronous: true
        sourceComponent: AppLauncher {}
    }

    Loader {
        id: screenshotMenuLoader
        active: GlobalStates.screenshotMenuVisible
        asynchronous: true
        sourceComponent: ScreenshotMenu {}
    }

    Loader {
        id: monitorSetupMenuLoader
        active: GlobalStates.monitorSetupMenuVisible
        asynchronous: true
        sourceComponent: MonitorSetupMenu {}
    }

    Loader {
        id: shutdownMenuLoader
        active: GlobalStates.shutdownMenuVisible
        asynchronous: true
        sourceComponent: ShutdownMenu {}
    }

    Loader {
        id: rebootMenuLoader
        active: GlobalStates.rebootMenuVisible
        asynchronous: true
        sourceComponent: RebootMenu {}
    }

    Loader {
        id: sleepMenuLoader
        active: GlobalStates.sleepMenuVisible
        asynchronous: true
        sourceComponent: SleepMenu {}
    }

    Loader {
        id: logoutMenuLoader
        active: GlobalStates.logoutMenuVisible
        asynchronous: true
        sourceComponent: LogoutMenu {}
    }
}
