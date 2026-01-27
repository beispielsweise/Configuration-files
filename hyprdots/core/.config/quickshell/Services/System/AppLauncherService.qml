pragma Singleton
import QtQuick
import Quickshell

QtObject {
    readonly property string scriptPath: Quickshell.env("HOME") + "/.config/quickshell/scripts/IndexApplications.sh"
    readonly property string appsIndexCachePath: Quickshell.env("HOME") + "/.cache/quickshell/apps.json"

    property ListModel globalAppsModel: ListModel {}
    property ListModel appsModel: ListModel {}

    function createCacheFile() {
        Quickshell.execDetached(["sh", scriptPath]);
        console.info(".cache/quickshell/apps.json created");
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

    function loadCacheFile() {
        _readFileText(appsIndexCachePath, text => _loadFromJsonText(text), (code, msg) => console.warn("Failed to read cache:", code, msg));
    }

    function _loadFromJsonText(jsonText) {
        globalAppsModel.clear();

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
            globalAppsModel.append({
                name: a.name,
                comment: a.comment || "",
                icon: a.icon || "",
                exec: a.exec || "",
                desktopId: a.desktopId || ""
            });
        }

        refilter("");
    }

    function refilter(query) {
        appsModel.clear();
        const q = (query || "").trim().toLowerCase();

        for (let i = 0; i < globalAppsModel.count; i++) {
            const it = globalAppsModel.get(i);
            const hay = ((it.name || "") + " " + (it.comment || "")).toLowerCase();
            if (q === "" || hay.indexOf(q) !== -1)
                appsModel.append(it);
        }
    }
}
