import QtQuick

/*
 * Shortcut EscapeShortcut
 *
 * Holds a reusable preset for a shortcut to close a window on Escape press
 */
Shortcut {
    sequence: "Escape"
    context: Qt.WindowShortcut
}
