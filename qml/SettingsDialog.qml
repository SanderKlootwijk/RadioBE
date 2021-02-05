import QtQuick 2.9
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Component {
  id: aboutDialog

  Dialog {
    signal closed();
    id: dialogue
    title: i18n.tr("Settings")

    Component.onCompleted: {
      selector.selectedIndex = settings.selectedIndex
    }

    Label {
      width: parent.width
      wrapMode: Text.Wrap
      text: i18n.tr("Choose your region below.")
    }

    OptionSelector {
      id: selector
      expanded: true
      containerHeight: parent.height * 0.75
      anchors.horizontalCenter: parent.horizontalCenter
      model: [i18n.tr("Antwerp"), i18n.tr("Brussels"), i18n.tr("Hainaut"), i18n.tr("Limburg"), i18n.tr("Liege"), i18n.tr("Luxembourg"), i18n.tr("Namur"), i18n.tr("East Flanders"), i18n.tr("West Flanders"), i18n.tr("Flemish Brabant"), i18n.tr("Walloon Brabant")]
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
            ok.color = UbuntuColors.green
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
          ok.color = UbuntuColors.green
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
        ok.color = UbuntuColors.green
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
      ok.color = UbuntuColors.green
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
    ok.color = UbuntuColors.green
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
    ok.color = UbuntuColors.green
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
    ok.color = UbuntuColors.green
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
    ok.color = UbuntuColors.green
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
    ok.color = UbuntuColors.green
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
    ok.color = UbuntuColors.green
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
    ok.color = UbuntuColors.green
  }
  break;
}
}
}
}

Button {
  width: parent.width
  id: ok
  text: i18n.tr("Close")
  color: theme.palette.normal.activity

  onClicked: {
    PopupUtils.close(dialogue);
    closed();
  }
}
}
}
