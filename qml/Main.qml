import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import QtMultimedia 5.0
import Qt.labs.settings 1.0

MainView {
  id: root
  objectName: 'mainView'
  applicationName: 'radiobe.sanderklootwijk'
  automaticOrientation: true

  Keys.onSpacePressed: {
    if (player.playbackState == true) {
      player.stop()
    }
    else {
      player.play()
    }
  }

  width: units.gu(45)
  height: units.gu(75)

  Image {
    id: testImg
    anchors.right: parent.left
    source: "https://www.npo3fm.nl/templates/npo3fm/images/logo-npo3fm.png"
    onStatusChanged: if (testImg.status == Image.Ready) console.log('TestImg is loaded!')
  }

  Timer {
    id: delaytimer
    interval: 2500
    running: false
    repeat: false
    onTriggered: {
      if (loaded.text == 'Not loaded'){
        PopupUtils.open(noConnectionDialog)
        console.log('Oops! No internet connection.')
      }
      else {
        console.log('Yes! Working internet connection.')
      }
    }
  }

  Text {
    id: loaded
    visible: false
    text: testImg.status == Image.Ready ? 'Loaded' : 'Not loaded'
    Component.onCompleted: {
      delaytimer.start()
      console.log('hello!')
    }
  }

  Page {
    id: mainPage
    visible: true
    height: parent.height
    width: {
      if (parent.width < units.gu(100)) {
        parent.width
      }
      else {
        parent.width - units.gu(40)
      }
    }

    header: PageHeader {
      id: header
      title: "Radio BE"
      opacity: 1

      ActionBar {
        id: actionBar
        anchors.right: parent.right
        height: playerPageHeader.height
        numberOfSlots: 1
        actions: [
        Action {
          id: settingsAction
          text: "Instellingen"
          iconName: "settings"
          onTriggered: openSettingsDialog()
        },
        Action {
          id: themeAction
          text: {
            if (settings.theme == "Ambiance"){
              "Nachtmodus"

            }
            else {
              "Dagmodus"
            }
          }
          iconSource: {
            if (settings.theme == "Ambiance"){
              "img/night-mode.svg"

            }
            else {
              "img/day-mode.svg"
            }
          }
          onTriggered: {
            if (settings.theme == "Ambiance"){
              Theme.name = "Ubuntu.Components.Themes.SuruDark"
              settings.theme = "SuruDark"
              // bottomEdge moet geopend en gesloten worden voordat het nieuwe thema is toegepast. Anders toont zich een lege pagina:
              bottomEdge.commit()
              bottomEdge.collapse()
            }
            else {
              Theme.name = "Ubuntu.Components.Themes.Ambiance"
              settings.theme = "Ambiance"
              // bottomEdge moet geopend en gesloten worden voordat het nieuwe thema is toegepast. Anders toont zich een lege pagina:
              bottomEdge.commit()
              bottomEdge.collapse()
            }
          }
        },
        Action {
          id: helpAction
          text: "Help"
          iconName: "help"
          onTriggered: {
            PopupUtils.open(tutorialMainDialog)
          }
        },
        Action {
          id: infoAction
          text: "Over"
          iconName: "info"
          onTriggered: {
            PopupUtils.open(aboutDialog)
          }
        }
        ]
      }

      extension: Sections {
        id: sections
        anchors {
          horizontalCenter: parent.horizontalCenter
          bottom: parent.bottom
        }

        actions: [
        Action {
          text: "Landelijk"
          onTriggered: {
            settingsAction.visible = false
          }
        },
        Action {
          text: "Alternatief"
          onTriggered: {
            settingsAction.visible = false
          }
        },
        Action {
          text: "Regionaal"
          onTriggered: {
            if (settings.tutorialRegionaal == "true"){
              openTutorialRegionaalDialog()
              settingsAction.visible = true
            }
            else{
              settingsAction.visible = true
            }
          }
        }
        ]
        onSelectedIndexChanged: {
          tabView.currentIndex = selectedIndex
        }

      }
    }

    Settings {
      id: settings
      property string source: ""
      property string image: ""
      property string text: ""
      property string tutorialRegionaal: "true"
      property string antvisible: "false"
      property string bruvisible: "false"
      property string henvisible: "false"
      property string limvisible: "false"
      property string luivisible: "false"
      property string luxvisible: "false"
      property string navisible: "false"
      property string ovvisible: "false"
      property string vbvisible: "false"
      property string wbvisible: "false"
      property string wvvisible: "false"
      property string selectedIndex: ""
      property string theme: "Ambiance"
      //Slot 1
      property string slot1img: ""
      property string slot1text: ""
      property string slot1source: ""
      //Slot 2
      property string slot2img: ""
      property string slot2text: ""
      property string slot2source: ""
      //Slot 3
      property string slot3img: ""
      property string slot3text: ""
      property string slot3source: ""
      //Slot 4
      property string slot4img: ""
      property string slot4text: ""
      property string slot4source: ""
    }

    Component.onCompleted: {
      Theme.name = "Ubuntu.Components.Themes." + settings.theme
      player.source = settings.source
      playerText.text = settings.text
      bottomIMG.source = settings.image
    }

    VisualItemModel {
      id: tabs

      Item {
        id: landelijkPage
        width: tabView.width
        height: tabView.height

        Scrollbar {
          z: 1
          id: scrollLandelijk
          visible: true
          flickableItem: flickLandelijk
          align: Qt.AlignTrailing
        }

        Flickable {
          id: flickLandelijk
          width: parent.width
          height: {
            if (root.width < units.gu(100)) {
              parent.height - bottomMenu.height - units.gu(4)
            }
            else {
              parent.height - units.gu(4)
            }
          }

          anchors {
            right: parent.right
            top: parent.top
          }

          contentWidth: zendersLandelijkColumn.width
          contentHeight: zendersLandelijkColumn.height - units.gu(0.1)

          Column {
            id: zendersLandelijkColumn
            width: mainPage.width

            ZenderDivider {
              text: "Publieke Omroep"
            }

            /* PUBLIEKE OMROEP */

            Zender {
              naam: "Radio 1"
              subText: "Altijd benieuwd"
              logo: "img/radio1.jpg"
              bron: "http://icecast.vrtcdn.be/radio1-high.mp3"
            }

            Zender {
              naam: "Radio 2"
              subText: "De grootste familie"
              logo: "img/radio2.png"
              bron: "http://icecast.vrtcdn.be/ra2wvl-high.mp3"
            }

            /* EINDE PUBLIEKE OMROEP */

            ZenderDivider {
              text: "Commerciële zenders"
            }

            /* COMMERCIEEL */

            Zender {
              naam: "Q-music"
              subText: "Q sounds better with you"
              logo: "img/qmusic.jpg"
              bron: "http://icecast-qmusic.cdp.triple-it.nl/Qmusic_be_live_64.aac"
            }

            /* EINDE COMMERCIEEL */

          }
        }
      }

      Item {
        id: alternatiefPage
        width: tabView.width
        height: tabView.height

        Scrollbar {
          z: 1
          id: scrollAlternatief
          visible: true
          flickableItem: flickAlternatief
          align: Qt.AlignTrailing
        }

        Flickable {
          id: flickAlternatief
          width: parent.width
          height: {
            if (root.width < units.gu(100)) {
              parent.height - bottomMenu.height - units.gu(4)
            }
            else {
              parent.height - units.gu(4)
            }
          }

          anchors {
            right: parent.right
            top: parent.top
          }

          contentWidth: zendersAlternatiefColumn.width
          contentHeight: zendersAlternatiefColumn.height - units.gu(0.1)

          Column {
            id: zendersAlternatiefColumn
            width: mainPage.width

            ZenderDivider {
              text: "Commerciële zenders"
            }

            /* ALTERNATIEF */

            Zender {
              naam: "Joe"
              subText: "All the way"
              logo: "img/joe.jpg"
              bron: "http://icecast-qmusic.cdp.triple-it.nl/JOEfm_be_live_128.mp3"
            }

            /* EINDE ALTERNATIEF */

          }
        }
      }

      Item {
        id: regionaalPage
        width: tabView.width
        height: tabView.height

        Scrollbar {
          z: 1
          id: scrollRegionaal
          visible: true
          flickableItem: flickRegionaal
          align: Qt.AlignTrailing
        }

        Flickable {
          id: flickRegionaal
          width: parent.width
          height: {
            if (root.width < units.gu(100)) {
              parent.height - bottomMenu.height - units.gu(4)
            }
            else {
              parent.height - units.gu(4)
            }
          }

          anchors {
            right: parent.right
            top: parent.top
          }

          contentWidth: zendersRegionaalColumn.width
          contentHeight: zendersRegionaalColumn.height - units.gu(0.1)

          Column {
            id: zendersRegionaalColumn
            width: mainPage.width

            /* REGIO */

            // Antwerpen

            ZenderDivider {
              text: "Antwerpen"
              visible: {
                if (settings.antvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Antwerpen"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.antvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Brussel

            ZenderDivider {
              text: "Brussel"
              visible: {
                if (settings.bruvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Brussel"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.bruvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Henegouwen

            ZenderDivider {
              text: "Henegouwen"
              visible: {
                if (settings.henvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Henegouwen"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.henvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Limburg

            ZenderDivider {
              text: "Limburg"
              visible: {
                if (settings.limvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Limburg"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.limvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Luik

            ZenderDivider {
              text: "Luik"
              visible: {
                if (settings.luivisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Luik"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.luivisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Luxemburg

            ZenderDivider {
              text: "Luxemburg"
              visible: {
                if (settings.luxvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Luxemburg"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.luxvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Namen

            ZenderDivider {
              text: "Namen"
              visible: {
                if (settings.navisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Namen"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.navisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Oost-Vlaanderen

            ZenderDivider {
              text: "Oost-Vlaanderen"
              visible: {
                if (settings.ovvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Oost-Vlaanderen"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.ovvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // West-Vlaanderen

            ZenderDivider {
              text: "West-Vlaanderen"
              visible: {
                if (settings.wvvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender West-Vlaanderen"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.wvvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }  

            // Vlaams-Brabant

            ZenderDivider {
              text: "Vlaams-Brabant"
              visible: {
                if (settings.vbvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Vlaams-Brabant"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.vbvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }     

            // Waals-Brabant

            ZenderDivider {
              text: "Waals-Brabant"
              visible: {
                if (settings.wbvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Zender Waals-Brabant"
              subText: "Subtext"
              logo: "img/AFBEELDING.jpg"
              bron: ""
              visible: {
                if (settings.wbvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }           

            /*  REGIONAAL */

          }
        }
      }
    }


    ListView {
      id: tabView
      anchors {
        top: mainPage.header.bottom
        bottom: parent.bottom
        left: parent.left
        right: parent.right
      }
      model: tabs
      currentIndex: 0

      orientation: Qt.Horizontal
      snapMode: ListView.SnapOneItem
      highlightRangeMode: ListView.StrictlyEnforceRange
      highlightMoveDuration: UbuntuAnimation.FastDuration

      onCurrentIndexChanged: {
        sections.selectedIndex = currentIndex
      }

    }

    // bottomMenu; this menu contains te current playing radio station and player. It hides when the screen is bigger then units.gu(100), e.g. tablets or computers
    Rectangle {
      z: 4
      id: bottomMenu

      width: parent.width
      height: units.gu(9)

      color: theme.palette.normal.background

      anchors {
        bottom: parent.bottom
        bottomMargin: units.gu(4)
      }

      visible: {
        if (root.width < units.gu(100)) {
          true
        }
        else {
          false
        }
      }

      // Grey line on top of bottomMenu

      Rectangle {
        z: 10
        width: parent.width
        height: units.gu(0.1)
        color: theme.palette.normal.base
      }

      // Contents of the menu are below

      UbuntuShape {
        id: bottomIMGShape
        height: units.gu(7)
        width: height

        anchors {
          left: parent.left
          leftMargin: units.gu(1)
          verticalCenter: parent.verticalCenter
        }

        // Put radio station logo in UbuntuShape
        source: Image {
          id: bottomIMG

          // Source is blank, it gets set by the 'zender' component
          source: ""
        }

        aspect: UbuntuShape.Inset
      }

      Audio {
        id: player

        // Source is blank, it gets set by the 'zender' component
        source: " "
      }

      // Put labels in a 'box'

      Item {
        width: parent.width - units.gu(9)
        height: units.gu(4.5)

        anchors {
          left: bottomIMGShape.right
          leftMargin: units.gu(1)
          verticalCenter: parent.verticalCenter
        }

        visible: {
          if (player.playbackState == true) {
            true
          }
          else {
            false
          }
        }

        Label {
          anchors {
            left: parent.left
            top: parent.top
          }

          text: "Nu aan het spelen"

          font.bold: true
        }

        Label {
          id: playerText

          anchors {
            left: parent.left
            bottom: parent.bottom
          }

          // playerText is blank, it gets set by the 'zender' component
          text: " "
        }
      }

      // Put the playerIcon in a Rectangle to make the MouseArea bigger
      Rectangle {
        id: playerIconHolder

        height: parent.height
        width: height * 1.5

        color: theme.palette.normal.background

        anchors {
          verticalCenter: parent.verticalCenter
          right: parent.right
        }

        MouseArea {
          anchors.fill: parent
          onClicked: {
            if (player.playbackState == true) {
              player.stop()
            }
            else {
              player.play()
            }
          }
        }

        // Player icon
        Icon {
          z: 3
          id: playerIcon

          width: units.gu(3)
          height: width

          anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: units.gu(3)
          }

          name: {
            if (player.playbackState == true) {
              "media-playback-stop"
            }
            else {
              "media-playback-start"
            }
          }
        }

        // Buffer rectangle. If the audio player is loading, the ActivityIndicator will show
        Rectangle {
          z: 4
          id: buffer
          visible: {
            if (player.playbackState == true) {
              if (player.bufferProgress < 0.20) {
                true
              }
              else {
                false
              }
            }
            else {
              false
            }
          }

          anchors.fill: parent
          color: theme.palette.normal.background

          ActivityIndicator {
            width: units.gu(3.2)
            height: width

            running: true
            anchors.centerIn: parent
          }
        }
      }
    }

    // Needed to open the bottomEdge in desktop mode. Temporary solution.
    MouseArea {
      z: 10

      width: bottomEdge.width
      height: units.gu(4)

      anchors {
        bottom: parent.bottom
        left: parent.left
      }

      onClicked: {
        bottomEdge.commit()
      }
    }

    // The bottomEdge cointains the favorite radio station set by the user.
    BottomEdge {

      id: bottomEdge

      hint.iconName: "go-up"

      height: {
        if (root.width < units.gu(65)) {
          parent.width / 4 + units.gu(7)
        }
        else {
          units.gu(18)
        }
      }

      contentComponent: Page {
        PageHeader {
          id: bottomHeader
          title: "Favorieten"
        }
        width: root.width
        height: root.height

        Row {
          anchors {
            top: bottomHeader.bottom
            topMargin: units.gu(1)
            horizontalCenter: parent.horizontalCenter
          }
          width: parent.width - units.gu(2)
          spacing: units.gu(1)
          //Slot 1
          UbuntuShape {
            id: slot1
            width: {
              if (root.width < units.gu(65)){
                parent.width / 4 - units.gu(0.8)
              }
              else{
                units.gu(10)
              }
            }
            height: width
            source: Image {
              id: slot1img
              source: settings.slot1img
            }

            MouseArea {
              id: mouseArea;
              anchors.fill: parent
              onClicked: {
                if (settings.slot1source == "") {
                }
                else {
                  player.stop()
                  player.source = settings.slot1source
                  player.play()
                  playerText.text = settings.slot1text
                  bottomIMG.source = settings.slot1img
                  settings.source = player.source
                  settings.text = playerText.text
                  settings.image = bottomIMG.source
                  bottomEdge.collapse()
                }
              }
              onPressAndHold: {
                slot1img.source = bottomIMG.source
                settings.slot1img = bottomIMG.source
                settings.slot1text = playerText.text
                settings.slot1source = player.source
              }
            }

            states: State {
              name: "pressed"; when: mouseArea.pressed
              PropertyChanges { target: slot1; scale: 1.03 }
            }

            transitions: Transition {
              NumberAnimation { properties: "scale"; duration: 50; easing.type: Easing.InOutQuad }
            }
          }

          //Slot 2
          UbuntuShape {
            id: slot2
            width: {
              if (root.width < units.gu(65)){
                parent.width / 4 - units.gu(0.8)
              }
              else{
                units.gu(10)
              }
            }
            height: width
            source: Image {
              id: slot2img
              source: settings.slot2img
            }

            MouseArea {
              id: mouseArea2;
              anchors.fill: parent
              onClicked: {
                if (settings.slot2source == "") {
                }
                else {
                  player.stop()
                  player.source = settings.slot2source
                  player.play()
                  playerText.text = settings.slot2text
                  bottomIMG.source = settings.slot2img
                  settings.source = player.source
                  settings.text = playerText.text
                  settings.image = bottomIMG.source
                  bottomEdge.collapse()
                }
              }
              onPressAndHold: {
                slot2img.source = bottomIMG.source
                settings.slot2img = bottomIMG.source
                settings.slot2text = playerText.text
                settings.slot2source = player.source
              }
            }

            states: State {
              name: "pressed"; when: mouseArea2.pressed
              PropertyChanges { target: slot2; scale: 1.03 }
            }

            transitions: Transition {
              NumberAnimation { properties: "scale"; duration: 50; easing.type: Easing.InOutQuad }
            }
          }

          //Slot 3
          UbuntuShape {
            id: slot3
            width: {
              if (root.width < units.gu(65)){
                parent.width / 4 - units.gu(0.8)
              }
              else{
                units.gu(10)
              }
            }
            height: width
            source: Image {
              id: slot3img
              source: settings.slot3img
            }

            MouseArea {
              id: mouseArea3;
              anchors.fill: parent
              onClicked: {
                if (settings.slot3source == "") {
                }
                else {
                  player.stop()
                  player.source = settings.slot3source
                  player.play()
                  playerText.text = settings.slot3text
                  bottomIMG.source = settings.slot3img
                  settings.source = player.source
                  settings.text = playerText.text
                  settings.image = bottomIMG.source
                  bottomEdge.collapse()
                }
              }
              onPressAndHold: {
                slot3img.source = bottomIMG.source
                settings.slot3img = bottomIMG.source
                settings.slot3text = playerText.text
                settings.slot3source = player.source
              }
            }

            states: State {
              name: "pressed"; when: mouseArea3.pressed
              PropertyChanges { target: slot3; scale: 1.03 }
            }

            transitions: Transition {
              NumberAnimation { properties: "scale"; duration: 50; easing.type: Easing.InOutQuad }
            }
          }

          //Slot 4
          UbuntuShape {
            id: slot4
            width: {
              if (root.width < units.gu(65)){
                parent.width / 4 - units.gu(0.8)
              }
              else{
                units.gu(10)
              }
            }
            height: width
            source: Image {
              id: slot4img
              source: settings.slot4img
            }

            MouseArea {
              id: mouseArea4;
              anchors.fill: parent
              onClicked: {
                if (settings.slot4source == "") {
                }
                else {
                  player.stop()
                  player.source = settings.slot4source
                  player.play()
                  playerText.text = settings.slot4text
                  bottomIMG.source = settings.slot4img
                  settings.source = player.source
                  settings.text = playerText.text
                  settings.image = bottomIMG.source
                  bottomEdge.collapse()
                }
              }
              onPressAndHold: {
                slot4img.source = bottomIMG.source
                settings.slot4img = bottomIMG.source
                settings.slot4text = playerText.text
                settings.slot4source = player.source
              }
            }

            states: State {
              name: "pressed"; when: mouseArea4.pressed
              PropertyChanges { target: slot4; scale: 1.03 }
            }

            transitions: Transition {
              NumberAnimation { properties: "scale"; duration: 50; easing.type: Easing.InOutQuad }
            }
          }
        }
      }
      Rectangle {
        width: parent.width
        height: units.gu(4)
        anchors.bottom: parent.bottom

        color: theme.palette.normal.background

        Rectangle {
          width: parent.width
          height: units.gu(0.1)
          color: theme.palette.normal.base
        }
      }
    }
  }

  // PlayerPage. It shows up when the screen is bigger then units.gu(100), e.g. tablets or computers
  Rectangle {
    id: playerPage

    height: parent.height
    width: units.gu(39.9)//parent.width / 4

    color: theme.palette.normal.background

    anchors {
      right: parent.right
      bottom: root.bottom
    }

    visible: {
      if (parent.width < units.gu(100)) {
        false
      }
      else {
        true
      }
    }

    // Content below

    Rectangle {
      z: 30
      width: units.gu(0.1)
      height: parent.height - playerPageHeader.height + units.gu(0.1)
      color: theme.palette.normal.base
      anchors.right: parent.left
      anchors.bottom: parent.bottom
    }

    MouseArea {
      // Ensures that in tablet mode the page behind the playpage is not 'touched'
      anchors.fill: parent
    }

    PageHeader {
      z: 20
      id: playerPageHeader
      title: "Nu aan het afspelen"
    }

    Rectangle {
      z: 10
      height: centerIMG.height / 7
      width: centerIMG.width

      anchors {
        left: parent.left
        bottom: centerIMG.bottom
      }

      color: "#111111"
      opacity: 0.8

      Text {
        color: "white"

        anchors {
          verticalCenter: parent.verticalCenter
          left: parent.left
          leftMargin: units.gu(2)
        }

        text: {
          if (settings.image == "") {
            "Selecteer een zender..."
          }
          else {
            playerText.text
          }
        }

        font.pointSize: parent.height / 3
      }
    }

    Image {
      z: 5
      id: centerIMG
      height: width
      width: parent.width

      anchors {
        left: parent.left
        top: playerPageHeader.bottom
      }

      // Fetch the larger image for the playerPage
      source: bottomIMG.source + "_large.jpg"

    }

    Rectangle {
      z: 9
      height: centerIMG.height
      width: centerIMG.width

      color: theme.palette.normal.background

      anchors {
        horizontalCenter: centerIMG.horizontalCenter
        verticalCenter: centerIMG.verticalCenter
      }

      visible: {
        if (settings.image == "") {
          true
        }
        else {
          false
        }
      }
    }

    Image {
      z: 7
      height: width
      width: centerIMG.width / 1.8

      anchors {
        horizontalCenter: centerIMG.horizontalCenter
        verticalCenter: centerIMG.verticalCenter
      }

      source: centerIMG.source

    }

    FastBlur {
      z: 5
      anchors.fill: centerIMG

      source: centerIMG
      radius: 32
    }

    // This rectangle cointains te player button from the playerPage
    Rectangle {
      z: 10
      height: parent.height - centerIMG.height - playerPageHeader.height
      width: parent.width

      color: theme.palette.normal.background

      anchors {
        horizontalCenter: parent.horizontalCenter
        bottom: parent.bottom
      }

      Icon {
        z: 3
        width: units.gu(5)
        height: width

        anchors {
          verticalCenter: parent.verticalCenter
          horizontalCenter: parent.horizontalCenter
        }

        name: playerIcon.name

        MouseArea {
          anchors.fill: parent
          onClicked: {
            if (player.playbackState == true) {
              player.stop()
            }
            else {
              player.play()
            }
          }
        }
      }
    }
  }

  Component {
    id: noConnectionDialog
    Dialog {
      id: dialogue
      title: "Oeps!"
      text: "Deze app vereist een actieve internetverbinding! Controleer je netwerkinstellingen en probeer het opnieuw."
      Button {
        text: "Sluiten"
        color: theme.palette.normal.activity
        onClicked: Qt.quit()
      }

      Button {
        text: "Toch Proberen"
        color: "#888888"
        onClicked: PopupUtils.close(dialogue)
      }
    }
  }

  Component {
    id: tutorialMainDialog
    Dialog {
      id: dialogue3
      text: "<b>Van categorie wisselen</b><br>Bovenin het scherm kun je wisselen tussen landelijke, alternatieve en regionale zenders.<br> <br><b>Favorieten toevoegen</b><br>Veeg vanaf de onderkant van het scherm omhoog om de favorieten te tonen.<br> <br>Houd een (leeg) slot lang ingedrukt en het huidig spelende radiostation wordt aan de favorieten toegevoegd.<br> <br>Tik op een bestaande favoriet om het radiostation af te spelen."
      Button {
        text: "Sluiten"
        color: theme.palette.normal.activity
        onClicked: {
          PopupUtils.close(dialogue3)
        }
      }
    }
  }

  Component {
    id: aboutDialog
    Dialog {
      id: dialogue4
      title: "Over Radio BE"
      Text {
        text: '<b>Versie: 1.0</b> <br><b>Broncode:</b> <a href="https://github.com/SanderKlootwijk/RadioBE">GitHub</a><br><b>Licentie:</b> <a href="https://tldrlegal.com/license/mit-license">MIT Licentie</a><br><br> <br>© 2020 Sander Klootwijk'
        color: theme.palette.normal.baseText
        horizontalAlignment: Text.AlignHCenter
        onLinkActivated: Qt.openUrlExternally(link)
      }
      Button {
        text: "Sluiten"
        color: theme.palette.normal.activity
        onClicked: {
          PopupUtils.close(dialogue4)
        }
      }
    }
  }

  SettingsDialog {
    id: settingsDialog
  }

  function openSettingsDialog() {
    var sd = PopupUtils.open(settingsDialog);
  }

  TutorialRegionaalDialog {
    id: tutorialRegionaalDialog
  }

  function openTutorialRegionaalDialog() {
    var sd = PopupUtils.open(tutorialRegionaalDialog);
  }
}
