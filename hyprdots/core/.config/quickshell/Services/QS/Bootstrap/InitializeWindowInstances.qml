import Quickshell
import QtQuick

import qs.Services.QS.States
import qs.Windows
import qs.Windows.Menu

/*
 * Scope InitizlizeWindowInstances
 *
 * Is designed to be used on quickshell launch via shell.qml
 * Loads Bar{} immediately, other windows load on-demand with LazyLoader
 */
Scope {
    Bar {}

    LazyLoader {
        id: screenshotMenuLoader
        activeAsync: GlobalStates.screenshotMenuVisible
        component: ScreenshotMenu {}
    }

    LazyLoader {
        id: monitorSetupMenuLoader
        activeAsync: GlobalStates.monitorSetupMenuVisible
        component: MonitorSetupMenu {}
    }

    LazyLoader {
        id: shutdownMenuLoader
        activeAsync: GlobalStates.shutdownMenuVisible
        component: ShutdownMenu {}
    }

    LazyLoader {
        id: rebootMenuLoader
        activeAsync: GlobalStates.rebootMenuVisible
        component: RebootMenu {}
    }

    LazyLoader {
        id: sleepMenuLoader
        activeAsync: GlobalStates.sleepMenuVisible
        component: SleepMenu {}
    }

    LazyLoader {
        id: logoutMenuLoader
        activeAsync: GlobalStates.logoutMenuVisible
        component: LogoutMenu {}
    }
}
