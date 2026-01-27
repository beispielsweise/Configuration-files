import QtQuick

import qs.Services.System

QtObject {
    Component.onCompleted: {
        AppLauncherService.createCacheFile();
        AppLauncherService.loadCacheFile();
    }
}
