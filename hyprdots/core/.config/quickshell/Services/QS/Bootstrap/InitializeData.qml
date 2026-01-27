import QtQuick

import qs.Services.System

/*!
 * QtObject InitializeData
 *
 * Is designed to be used via shell.qml
 * Loads Singleton QtObject that are used by windows later in the cycle
 */
QtObject {
    Component.onCompleted: {
        AppLauncherService.createCacheFile();
        AppLauncherService.loadCacheFile();
    }
}
