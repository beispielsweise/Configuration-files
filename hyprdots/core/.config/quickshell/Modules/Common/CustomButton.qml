import QtQuick
import QtQuick.Controls

import qs.Appearance

Button {
    id: root

    topPadding: Theme.customButton.paddingV
    rightPadding: Theme.customButton.paddingH
    bottomPadding: Theme.customButton.paddingV
    leftPadding: Theme.customButton.paddingH

    implicitHeight: Math.max(32, contentItem.implicitHeight + bottomPadding + topPadding)
    implicitWidth: Math.max(120, contentItem.implicitWidth + leftPadding + rightPadding)

    font.pointSize: Theme.customButton.pointSize

    contentItem: Label {
        text: root.text
        font.pointSize: root.font.pointSize
        color: Theme.colors.text // root.enabled ? activeTextColor : passiveTextcolor

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        radius: Theme.customButton.radius

        border.width: Theme.customButton.borderWidth
        border.color: Theme.customButton.borderColor

        color: root.down ? Theme.colors.bgDown : root.hovered ? Theme.colors.bgHovered : Theme.colors.bgActive
    }
}
