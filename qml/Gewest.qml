import QtQuick 2.9
import Ubuntu.Components 1.3

ListItem {
  id: zenderLandelijk

  height: units.gu(9)

  property alias logo: logo.source
  property alias naam: naam.text
  property alias subText: subText.text

  UbuntuShape {
    id: logoShape
    height: units.gu(7)
    width: height

    anchors {
      left: parent.left
      leftMargin: units.gu(1)
      verticalCenter: parent.verticalCenter
    }

    // Put district flag in UbuntuShape
    source: Image {
      id: logo
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
      id: naam
      font.bold: true

      anchors {
        left: parent.left
        top: parent.top
      }
    }

    Label {
      id: subText

      width: parent.width - logoShape.width - goIcon.width

      maximumLineCount: 1

      elide: Text.ElideRight

      anchors {
        left: parent.left
        bottom: parent.bottom
      }
    }
  }

  Icon {
    z: 3
    id: goIcon
    width: units.gu(3)
    height: width
    anchors {
      verticalCenter: parent.verticalCenter
      right: parent.right
      rightMargin: units.gu(3)
    }

    name: "go-next"
  }
}
