import QtQuick

import qs.Appearance

/*!
 * Text DefaultLabel
 *
 * A reusable Text item which uses Theme-specific values
 */
Text {
    id: root

    font.pointSize: Theme.defaultLabel.pointSize
    font.family: Theme.font.fontFamily
    font.weight: Font.DemiBold

    color: Theme.colors.text
}
