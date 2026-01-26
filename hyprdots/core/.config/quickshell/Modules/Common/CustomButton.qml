import QtQuick
import QtQuick.Controls

import qs.Appearance

/*!
 * Button CustomButton
 *
 * Reusable custom Button module
 * Uses Theme-specific values
 *
 * To change text position from left to right, overwrite leftPadding or rightPadding
 * Text is horizontally alligned by default, maybe this will need to be changed in the future
 */

Button {
    id: root

    // Default properties
    property int maxWidth: contentItem.implicitWidth + leftPadding + rightPadding

    focusPolicy: Qt.StrongFocus

    topPadding: Theme.customButton.paddingV
    rightPadding: Theme.customButton.paddingH
    bottomPadding: Theme.customButton.paddingV
    leftPadding: Theme.customButton.paddingH

    implicitHeight: Theme.customButton.height
    implicitWidth: maxWidth

    font.pointSize: Theme.customButton.pointSize
    font.family: Theme.font.fontFamily
    font.weight: Font.Medium

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
        Behavior on border.width {
            NumberAnimation {
                duration: Theme.customButton.animationSpeed
                easing.type: Theme.customButton.animationType
            }
        }

        border.color: Theme.colors.border

        color: root.down ? Theme.colors.bgDown : root.hovered || root.activeFocus ? Theme.colors.bgHovered : Theme.colors.bgActive
        Behavior on color {
            ColorAnimation {
                duration: Theme.customButton.animationSpeed
                easing.type: Theme.customButton.animationType
            }
        }
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
