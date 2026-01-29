pragma Singleton
import QtQuick
import Quickshell

/*!
 * QtObject AppLauncherService
 *
 * A service that manages app launching
 * Parses currently available .desktop files for display
 * Manages _globalAppsModel/appsModel instances to be used by AppLauncher.qml as models
 */
QtObject {
    
    readonly property string scriptPath: Quickshell.env("HOME") + "/.config/quickshell/scripts/IndexApplications.sh"
    readonly property string appsIndexCachePath: Quickshell.env("HOME") + "/.cache/quickshell/apps.json"

    property ListModel _globalAppsModel: ListModel {}           // holds all currenly available .desktop entries
    property ListModel appsModel: ListModel {}                  // holds filtered .desktop entries

    function createCacheFile() {
        Quickshell.execDetached(["sh", scriptPath]);
        console.info(".cache/quickshell/apps.json created");
    }

    function loadCacheFile() {
        _readFileText(appsIndexCachePath, text => _loadFromJsonText(text), (code, msg) => console.warn("Failed to read cache:", code, msg));
    }

    function _readFileText(absPath, onOk, onErr) {
        const xhr = new XMLHttpRequest();
        xhr.open("GET", "file://" + absPath, true);

        xhr.onreadystatechange = function () {
            if (xhr.readyState !== XMLHttpRequest.DONE)
                return;
            if (xhr.status === 0 || xhr.status === 200) {
                onOk(xhr.responseText);
            } else {
                if (onErr)
                    onErr(xhr.status, xhr.statusText);
            }
        };

        xhr.send();
    }

    function _loadFromJsonText(jsonText) {
        _globalAppsModel.clear();

        let arr;
        try {
            arr = JSON.parse(jsonText);
        } catch (e) {
            console.warn("AppLauncherService: JSON parse failed:", e);
            refilter("");
            return;
        }

        if (!Array.isArray(arr)) {
            console.warn("AppLauncherService: JSON is not an array");
            refilter("");
            return;
        }

        for (let i = 0; i < arr.length; i++) {
            const a = arr[i];
            if (!a || !a.name)
                continue;
            _globalAppsModel.append({
                name: a.name,
                comment: a.comment || "",
                icon: a.icon || "",
                exec: a.exec || "",
                desktopId: a.desktopId || ""
            });
        }

        refilter("");
    }

    // Refilters appsModel based on current inputField querry
    function refilter(query) {
        appsModel.clear();
        const q = (query || "").trim().toLowerCase();

        for (let i = 0; i < _globalAppsModel.count; i++) {
            const it = _globalAppsModel.get(i);
            const hay = ((it.name || "") + " " + (it.comment || "")).toLowerCase();
            if (q === "" || hay.indexOf(q) !== -1)
                appsModel.append(it);
        }
    }

    function launch(index) {
        const cmd = appsModel.get(index).exec;
        Quickshell.execDetached(["sh", "-c", cmd]);
    }
}
