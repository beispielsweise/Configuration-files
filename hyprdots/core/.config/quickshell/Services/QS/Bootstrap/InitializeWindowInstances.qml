import Quickshell
import QtQuick

import qs.Services.QS.States
import qs.Windows

Scope {
    Bar {}

    LazyLoader {
        id: screenshotMenuLoader
        activeAsync: GlobalStates.screenshotMenuVisible
        component: ScreenshotMenu {}
    }
}
