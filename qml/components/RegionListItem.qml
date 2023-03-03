import QtQuick 2.9
import Ubuntu.Components 1.3

ListItem {
    id: regionFlagListItem
    
    height: units.gu(9)

    property alias name: name.text
    property alias subText: subText.text
    property string region

    onClicked: {
      settings.regionName = region
    }

    UbuntuShape {
      id: logoShape
      height: units.gu(7)
      width: height

      anchors {
        left: parent.left
        leftMargin: units.gu(1)
        verticalCenter: parent.verticalCenter
      }

      // Put region flag in UbuntuShape
      source: Image {
        id: logo
        source: "img/" + region + "-square.svg"
      }

      aspect: UbuntuShape.Inset
    }

    // Put labels in a 'box'

    Item {
      width: parent.width - units.gu(9)
      height: units.gu(4.5)

      anchors {
        left: logoShape.right
        leftMargin: units.gu(1)
        verticalCenter: parent.verticalCenter
      }
      Label {
        id: name
        font.bold: true

        anchors {
          left: parent.left
          top: parent.top
        }
      }

      Label {
        id: subText

        width: parent.width - logoShape.width - checkIcon.width

        maximumLineCount: 1

        elide: Text.ElideRight

        anchors {
          left: parent.left
          bottom: parent.bottom
        }
      }
    }

    Icon {
      id: checkIcon
      height: units.gu(2)
      width: units.gu(2)

      anchors {
          verticalCenter: parent.verticalCenter
          right: parent.right
          rightMargin: units.gu(3.5)    
      }

      visible: settings.regionName == region

      name: 'toolkit_tick'
    }
}
