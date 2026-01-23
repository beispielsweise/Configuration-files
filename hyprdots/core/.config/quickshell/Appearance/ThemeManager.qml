import QtQuick

QtObject {
    // function Placeholder for theme parsing rom .json file
    function loadThemeFromUrl(url) {
        const xhr = new XMLHttpRequest();
        xhr.open("GET", url);
        xhr.onreadystatechange = function () {};
        xhr.send();
    }
}
