import QtQuick

import qs.Appearance

Text {
    id: root

    property string customTextColor: "#f9fcf7"

    font.pointSize: Theme.defaultLabel.pointSize
    color: Theme.colors.text
}
