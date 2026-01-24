import QtQuick
import QtQuick.Controls

import qs.Appearance

Button {
    id: root

    focusPolicy: Qt.StrongFocus

    topPadding: Theme.customButton.paddingV
    rightPadding: Theme.customButton.paddingH
    bottomPadding: Theme.customButton.paddingV
    leftPadding: Theme.customButton.paddingH

    implicitHeight: Theme.customButton.height
    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding

    font.pointSize: Theme.customButton.pointSize
    font.family: Theme.fontFamily

    contentItem: Label {
        text: root.text
        font.pointSize: root.font.pointSize
        color: Theme.colors.text // root.enabled ? activeTextColor : passiveTextcolor

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        radius: Theme.customButton.radius

        border.width: root.hovered || root.activeFocus ? Theme.customButton.borderWidth + 1 : Theme.customButton.borderWidth
        border.color: Theme.customButton.borderColor

        color: root.down ? Theme.colors.bgDown : root.hovered || root.activeFocus ? Theme.colors.bgHovered : Theme.colors.bgActive
    }

    Keys.onPressed: ev => {
        if (!root.enabled)
            return;
        if (ev.key === Qt.Key_Return || ev.key === Qt.Key_Enter) {
            root.clicked();
            ev.accepted = true;
        }
    }
}
