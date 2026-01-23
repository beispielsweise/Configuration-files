import Quickshell
import QtQuick
import QtQuick.Controls

Button {
    id: root

    property int customHeight: 32
    property int customWidth: 120
    property int customPointSize: 11
    property int customPaddingH: 15
    property int customPaddingV: 4
    property int customRadius: 7
    property int customBorderWidth: 1
    property string customActiveTextColor: "#f9fcf7"
    property string customBorderColor: "#f9fcf7"
    property string customBackgroundColor: "#353535"

    implicitHeight: Math.max(32, contentItem.implicitHeight + bottomPadding + topPadding)
    implicitWidth: Math.max(120, contentItem.implicitWidth + leftPadding + rightPadding)

    topPadding: customPaddingV
    rightPadding: customPaddingH
    bottomPadding: customPaddingV
    leftPadding: customPaddingH

    font.pointSize: customPointSize

    contentItem: Label {
        text: root.text
        font.pointSize: root.font.pointSize
        color: root.customActiveTextColor // root.enabled ? activeTextColor : passiveTextcolor

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        radius: root.customRadius

        border.width: root.customBorderWidth
        border.color: root.customBorderColor

        // color: customBackgroundColor
        color: !root.enabled ? "#2b2b2b" : root.down ? "#2a2a2a" : root.hovered ? "#404040" : "#353535"
    }
}
