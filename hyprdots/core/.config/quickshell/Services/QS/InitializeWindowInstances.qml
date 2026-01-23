import Quickshell
import QtQuick

import qs.Windows

Scope {
    id: root

    ScreenshotMenu {
        visible: GlobalStates.screenshotMenuOpen
    }
}
