import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Component {
  id: aboutDialog

  Dialog {
    signal closed();
    id: dialogue
    title: "Instellingen"

    Component.onCompleted: {
      selector.selectedIndex = -1
    }

    Label {
      width: parent.width
      wrapMode: Text.Wrap
      text: "Kies hieronder uw regio uit. U kunt uw keuze later aanpassen in de instellingen."
    }

    OptionSelector {
      id: selector
      expanded: true
      containerHeight: parent.height * 0.75
      anchors.horizontalCenter: parent.horizontalCenter
      model: ["Antwerpen", "Brussel", "Henegouwen", "Limburg", "Luik", "Luxemburg", "Namen", "Oost-Vlaanderen", "West-Vlaanderen", "Vlaams-Brabant", "Waals-Brabant"]
      onSelectedIndexChanged: {
        switch(selector.selectedIndex) {
        case 0: {
          if (settings.antvisible == "false") {
            settings.antvisible = "true"
            settings.bruvisible = "false"
            settings.henvisible = "false"
            settings.limvisible = "false"
            settings.luivisible = "false"
            settings.luxvisible = "false"
            settings.navisible = "false"
            settings.ovvisible = "false"
            settings.wvvisible = "false"
            settings.vbvisible = "false"
            settings.wbvisible = "false"
            settings.selectedIndex = "0"
            selector.containerHeight = units.gu(5)
            button.ready = true
          }
          break;
        }
      case 1: {
        if (settings.bruvisible == "false") {
          settings.antvisible = "false"
          settings.bruvisible = "true"
          settings.henvisible = "false"
          settings.limvisible = "false"
          settings.luivisible = "false"
          settings.luxvisible = "false"
          settings.navisible = "false"
          settings.ovvisible = "false"
          settings.wvvisible = "false"
          settings.vbvisible = "false"
          settings.wbvisible = "false"
          settings.selectedIndex = "1"
          selector.containerHeight = units.gu(5)
          button.ready = true
        }
        break;
      }
    case 2: {
      if (settings.henvisible == "false") {
        settings.antvisible = "false"
        settings.bruvisible = "false"
        settings.henvisible = "true"
        settings.limvisible = "false"
        settings.luivisible = "false"
        settings.luxvisible = "false"
        settings.navisible = "false"
        settings.ovvisible = "false"
        settings.wvvisible = "false"
        settings.vbvisible = "false"
        settings.wbvisible = "false"
        settings.selectedIndex = "2"
        selector.containerHeight = units.gu(5)
        button.ready = true
      }
      break;
    }
  case 3: {
    if (settings.limvisible == "false") {
      settings.antvisible = "false"
      settings.bruvisible = "false"
      settings.henvisible = "false"
      settings.limvisible = "true"
      settings.luivisible = "false"
      settings.luxvisible = "false"
      settings.navisible = "false"
      settings.ovvisible = "false"
      settings.wvvisible = "false"
      settings.vbvisible = "false"
      settings.wbvisible = "false"
      settings.selectedIndex = "3"
      selector.containerHeight = units.gu(5)
      button.ready = true
    }
    break;
  }
case 4: {
  if (settings.luivisible == "false") {
    settings.antvisible = "false"
    settings.bruvisible = "false"
    settings.henvisible = "false"
    settings.limvisible = "false"
    settings.luivisible = "true"
    settings.luxvisible = "false"
    settings.navisible = "false"
    settings.ovvisible = "false"
    settings.wvvisible = "false"
    settings.vbvisible = "false"
    settings.wbvisible = "false"
    settings.selectedIndex = "4"
    selector.containerHeight = units.gu(5)
    button.ready = true
  }
  break;
}
case 5: {
  if (settings.luxvisible == "false") {
    settings.antvisible = "false"
    settings.bruvisible = "false"
    settings.henvisible = "false"
    settings.limvisible = "false"
    settings.luivisible = "false"
    settings.luxvisible = "true"
    settings.navisible = "false"
    settings.ovvisible = "false"
    settings.wvvisible = "false"
    settings.vbvisible = "false"
    settings.wbvisible = "false"
    settings.selectedIndex = "5"
    selector.containerHeight = units.gu(5)
    button.ready = true
  }
  break;
}
case 6: {
  if (settings.navisible == "false") {
    settings.antvisible = "false"
    settings.bruvisible = "false"
    settings.henvisible = "false"
    settings.limvisible = "false"
    settings.luivisible = "false"
    settings.luxvisible = "false"
    settings.navisible = "true"
    settings.ovvisible = "false"
    settings.wvvisible = "false"
    settings.vbvisible = "false"
    settings.wbvisible = "false"
    settings.selectedIndex = "6"
    selector.containerHeight = units.gu(5)
    button.ready = true
  }
  break;
}
case 7: {
  if (settings.ovvisible == "false") {
    settings.antvisible = "false"
    settings.bruvisible = "false"
    settings.henvisible = "false"
    settings.limvisible = "false"
    settings.luivisible = "false"
    settings.luxvisible = "false"
    settings.navisible = "false"
    settings.ovvisible = "true"
    settings.wvvisible = "false"
    settings.vbvisible = "false"
    settings.wbvisible = "false"
    settings.selectedIndex = "7"
    selector.containerHeight = units.gu(5)
    button.ready = true
  }
  break;
}
case 8: {
  if (settings.wvvisible == "false") {
    settings.antvisible = "false"
    settings.bruvisible = "false"
    settings.henvisible = "false"
    settings.limvisible = "false"
    settings.luivisible = "false"
    settings.luxvisible = "false"
    settings.navisible = "false"
    settings.ovvisible = "false"
    settings.wvvisible = "true"
    settings.vbvisible = "false"
    settings.wbvisible = "false"
    settings.selectedIndex = "8"
    selector.containerHeight = units.gu(5)
    button.ready = true
  }
  break;
}
case 9: {
  if (settings.vbvisible == "false") {
    settings.antvisible = "false"
    settings.bruvisible = "false"
    settings.henvisible = "false"
    settings.limvisible = "false"
    settings.luivisible = "false"
    settings.luxvisible = "false"
    settings.navisible = "false"
    settings.ovvisible = "false"
    settings.wvvisible = "false"
    settings.vbvisible = "true"
    settings.wbvisible = "false"
    settings.selectedIndex = "9"
    selector.containerHeight = units.gu(5)
    button.ready = true
  }
  break;
}
case 10: {
  if (settings.wbvisible == "false") {
    settings.antvisible = "false"
    settings.bruvisible = "false"
    settings.henvisible = "false"
    settings.limvisible = "false"
    settings.luivisible = "false"
    settings.luxvisible = "false"
    settings.navisible = "false"
    settings.ovvisible = "false"
    settings.wvvisible = "false"
    settings.vbvisible = "false"
    settings.wbvisible = "true"
    settings.selectedIndex = "10"
    selector.containerHeight = units.gu(5)
    button.ready = true
  }
  break;
}
}
}
}

Button {
  id: button
  width: parent.width

  property var ready: false

  text: {
    if (button.ready == false) {
      "Annuleren"
    }
    else {
      "Sluiten"
    }
  }
  color: theme.palette.normal.activity

  onClicked: {
    if (button.ready == false) {
      scrollLandelijk.visible = true
      flickLandelijk.state = "landelijk"
      flickRegionaal.state = "landelijk"
      scrollRegionaal.visible = false
      settingsAction.visible = false
      sections.selectedIndex = 0
      PopupUtils.close(dialogue);
      closed();
    }
    else {
      settings.tutorialRegionaal = "false"
      PopupUtils.close(dialogue);
      closed();
    }
  }
}
}
}
