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
    source: "https://stubru.be/favicon.ico"
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
      if (parent.width < units.gu(120)) {
        parent.width
      }
      else {
        parent.width - units.gu(40)
      }
    }

    header: PageHeader {
      id: header
      title: i18n.tr("Radio BE")
      opacity: 1

      ActionBar {
        id: actionBar
        anchors.right: parent.right
        height: playerPageHeader.height
        numberOfSlots: {
          if (settings.tutorialLandelijk == "true") {
            1
          }
          else {
            3
          }
        }
        actions: [
        Action {
          id: vlaanderenAction
          visible:  {
            if (settings.vlavisible == "true"){
              false
            }
            else if (settings.tutorialLandelijk == "true") {
              false
            }
            else {
              true
            }
          }
          text: i18n.tr("Flanders")
          iconSource: "img/vlaanderen.svg"
          onTriggered: {
            settings.vlavisible = "true"
            settings.walvisible = "false"
            settings.obvisible = "false"
          }
        },
        Action {
          id: wallonieAction
          visible:  {
            if (settings.walvisible == "true"){
              false
            }
            else if (settings.tutorialLandelijk == "true") {
              false
            }
            else {
              true
            }
          }
          text: i18n.tr("Wallonia")
          iconSource: "img/wallonie.svg"
          onTriggered: {
            settings.vlavisible = "false"
            settings.walvisible = "true"
            settings.obvisible = "false"
          }
        },
        Action {
          id: oostbelgieAction
          visible:  {
            if (settings.obvisible == "true"){
              false
            }
            else if (settings.tutorialLandelijk == "true") {
              false
            }
            else {
              true
            }
          }
          text: i18n.tr("East-Belgium")
          iconSource: "img/oost-belgie.svg"
          onTriggered: {
            settings.vlavisible = "false"
            settings.walvisible = "false"
            settings.obvisible = "true"
          }
        },
        Action {
          id: settingsAction
          text: i18n.tr("Settings")
          iconName: "settings"
          onTriggered: openSettingsDialog()
        },
        Action {
          id: themeAction
          text: {
            if (settings.theme == "Ambiance"){
              i18n.tr("Night mode")

            }
            else {
              i18n.tr("Day mode")
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
          text: i18n.tr("Help")
          iconName: "help"
          onTriggered: {
            PopupUtils.open(tutorialMainDialog)
          }
        },
        Action {
          id: infoAction
          text: i18n.tr("About")
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
          text: i18n.tr("National")
          onTriggered: {
            settingsAction.visible = false
          }
        },
        Action {
          text: i18n.tr("Alternative")
          onTriggered: {
            settingsAction.visible = false
          }
        },
        Action {
          text: i18n.tr("Regional")
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
      property string tutorialLandelijk: "true"
      property string tutorialRegionaal: "true"
      //Landelijk
      property string vlavisible: "false"
      property string walvisible: "false"
      property string obvisible: "false"
      //Regionaal
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
            if (root.width < units.gu(120)) {
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

            /* TUTORIAL LANDELIJK */

            ListItem {
              visible: {
                if (settings.tutorialLandelijk == "true"){
                  true
                }
                else {
                  false
                }
              }
              
              height: units.gu(7)
                            
              Label {
                
                anchors {
                  centerIn: parent
                }

                horizontalAlignment: Text.AlignHCenter

                text: i18n.tr("Select a region to listen to national<br>and alternative radio stations")

              }

            }

            Gewest {
              naam: i18n.tr("Flanders")
              subText: i18n.tr("Dutch-speaking Belgium")
              logo: "img/vlaanderen-square.svg"
              MouseArea {
                anchors.fill: parent
                onClicked: {
                  settings.vlavisible = "true"
                  settings.tutorialLandelijk = "false"
                }
              }
              visible: {
                if (settings.tutorialLandelijk == "true"){
                  true
                }
                else {
                  false
                }
              }
            }

            Gewest {
              naam: i18n.tr("Wallonia")
              subText: i18n.tr("French-speaking Belgium")
              logo: "img/wallonie-square.svg"
              MouseArea {
                anchors.fill: parent
                onClicked: {
                  settings.walvisible = "true"
                  settings.tutorialLandelijk = "false"
                }
              }
              visible: {
                if (settings.tutorialLandelijk == "true"){
                  true
                }
                else {
                  false
                }
              }
            }

            Gewest {
              naam: i18n.tr("East-Belgium")
              subText: i18n.tr("German-speaking Belgium")
              logo: "img/oost-belgie-square.svg"
              MouseArea {
                anchors.fill: parent
                onClicked: {
                  settings.obvisible = "true"
                  settings.tutorialLandelijk = "false"
                }
              }
              visible: {
                if (settings.tutorialLandelijk == "true"){
                  true
                }
                else {
                  false
                }
              }
            }
            
            /* TUTORIAL LANDELIJK */

            ZenderDivider {
              text: i18n.tr("Public broadcast Corporation")

              visible: {
                if (settings.tutorialLandelijk == "true"){
                  false
                }
                else {
                  true
                }
              }
            }

            /* PUBLIEKE OMROEP VLAANDEREN */

            Zender {
              naam: "Radio 1"
              subText: "Altijd benieuwd"
              logo: "img/radio1.jpg"
              bron: "http://icecast.vrtcdn.be/radio1-high.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Radio 2"
              subText: "De grootste familie"
              logo: "img/radio2.jpg"
              bron: "http://icecast.vrtcdn.be/ra2wvl-high.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "MNM"
              subText: "Music and more"
              logo: "img/mnm.jpg"
              bron: "http://icecast.vrtcdn.be/mnm-high.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Studio Brussel"
              subText: "Life is Music"
              logo: "img/stubru.jpg"
              bron: "http://icecast.vrtcdn.be/stubru-high.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Klara"
              subText: "Blijf verwonderd"
              logo: "img/klara.jpg"
              bron: "http://icecast.vrtcdn.be/klara-high.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE PUBLIEKE OMROEP VLAANDEREN */

            /* PUBLIEKE OMROEP WALLONIË */

            Zender {
              naam: "RTBF La Première"
              subText: "L'esprit clair"
              logo: "img/rtbflapremiere.jpg"
              bron: "https://radios.rtbf.be/laprem1ere-128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "RTBF VivaCité"
              subText: "Et la vie va!"
              logo: "img/rtbfvivacite.jpg"
              bron: "https://radios.rtbf.be/vivabxl-128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "RTBF Musiq3"
              subText: "Changez d'airs"
              logo: "img/rtbfmusiq3.jpg"
              bron: "https://radios.rtbf.be/musiq3-128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "RTBF Classic 21"
              subText: "Écoutez l'orginal"
              logo: "img/rtbfclassic21.jpg"
              bron: "https://radios.rtbf.be/classic21-128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "RTBF Tipik"
              subText: "Le nouveau média digital"
              logo: "img/rtbftipik.jpg"
              bron: "https://radios.rtbf.be/pure-128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE PUBLIEKE OMROEP WALLONIË */

            /* PUBLIEKE OMROEP OOST-BELGIË */

            Zender {
              naam: "BRF1"
              subText: "Aktuelle Hits"
              logo: "img/brf1.jpg"
              bron: "https://streaming.brf.be/brf1-high.mp3"
              visible: {
                if (settings.obvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "BRF2"
              subText: "Wir lieben deutschsprachige Musik!"
              logo: "img/brf2.jpg"
              bron: "https://streaming.brf.be/brf2-high.mp3"
              visible: {
                if (settings.obvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE PUBLIEKE OMROEP OOST-BELGIË */

            ZenderDivider {
              text: i18n.tr("Commercial stations")

              visible: {
                if (settings.tutorialLandelijk == "true"){
                  false
                }
                else {
                  true
                }
              }
            }

            /* COMMERCIEEL VLAANDEREN */

            Zender {
              naam: "Q-music"
              subText: "Q sounds better with you"
              logo: "img/qmusic.jpg"
              bron: "https://20133.live.streamtheworld.com/QMUSIC.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Joe"
              subText: "All the way"
              logo: "img/joe.jpg"
              bron: "https://21283.live.streamtheworld.com/JOE.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Nostalgie"
              subText: "What a feeling!"
              logo: "img/nostalgie.jpg"
              bron: "https://22193.live.streamtheworld.com/NOSTALGIEWHATAFEELING.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "TOPradio"
              subText: "We Love Music"
              logo: "img/topradio.jpg"
              bron: "https://str.topradio.be/topradio.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE COMMERCIEEL VLAANDEREN */

            /* COMMERCIEEL WALLONIË */

            Zender {
              naam: "Bel RTL"
              subText: "Vos meillurs moments"
              logo: "img/belrtl.jpg"
              bron: "https://belrtl.ice.infomaniak.ch/belrtl-mp3-192.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Radio Contact"
              subText: "Feel Good"
              logo: "img/radiocontact.jpg"
              bron: "http://audiostream.rtl.be/contactfr"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Fun Radio"
              subText: "Enjoy The Music"
              logo: "img/funradio.jpg"
              bron: "http://live.funradio.be/funradiobe-high.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "NRJ Belgique"
              subText: "Hit Music Only"
              logo: "img/nrjbelgique.jpg"
              bron: "https://streamingp.shoutcast.com/NRJ"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "DH Radio"
              subText: "Le plaisir de la musique"
              logo: "img/dhradio.jpg"
              bron: "http://n05a-eu.rcs.revma.com/anew1ctrgzzuv"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE COMMERCIEEL WALLONIË */

            /* COMMERCIEEL OOST-BELGIË */

            Zender {
              naam: "100'5 DAS HITRADIO"
              subText: "Die Superhits der 80er, der 90er und das Beste von heute"
              logo: "img/1005dashitradio.jpg"
              bron: "http://stream.dashitradio.de/dashitradio/mp3-128/stream.mp3"
              visible: {
                if (settings.obvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Radio Contact Ostbelgien NOW"
              subText: "Der einzige private Sender"
              logo: "img/radiocontactostbelgiennow.jpg"
              bron: "http://radio-contact.dh-media.net:7000/stream/1/;stream.mp3"
              visible: {
                if (settings.obvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Radio Sunshine"
              subText: "Hier spielt die Musik"
              logo: "img/radiosunshine.jpg"
              bron: "http://streamlive.syndicationradio.fr:8158/stream"
              visible: {
                if (settings.obvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Radio 700"
              subText: "Schlager und Oldies"
              logo: "img/radio700.jpg"
              bron: "http://5.35.250.101:8000/radio700-aacplus"
              visible: {
                if (settings.obvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE COMMERCIEEL OOST-BELGIË */
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
            if (root.width < units.gu(120)) {
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

            /* TUTORIAL */

            ListItem {
              visible: {
                if (settings.tutorialLandelijk == "true"){
                  true
                }
                else {
                  false
                }
              }
              
              height: units.gu(7)
                            
              Label {
                
                anchors {
                  centerIn: parent
                }

                horizontalAlignment: Text.AlignHCenter

                text: "Kies een gewest om landelijke<br>en alternatieve zenders te beluisteren"

              }

            }

            Gewest {
              naam: "Vlaanderen"
              subText: "Nederlandstalig België"
              logo: "img/vlaanderen-square.svg"
              MouseArea {
                anchors.fill: parent
                onClicked: {
                  settings.vlavisible = "true"
                  settings.tutorialLandelijk = "false"
                }
              }
              visible: {
                if (settings.tutorialLandelijk == "true"){
                  true
                }
                else {
                  false
                }
              }
            }

            Gewest {
              naam: "Wallonië"
              subText: "Franstalig België"
              logo: "img/wallonie-square.svg"
              MouseArea {
                anchors.fill: parent
                onClicked: {
                  settings.walvisible = "true"
                  settings.tutorialLandelijk = "false"
                }
              }
              visible: {
                if (settings.tutorialLandelijk == "true"){
                  true
                }
                else {
                  false
                }
              }
            }

            Gewest {
              naam: "Oost-België"
              subText: "Duitstalig België"
              logo: "img/oost-belgie-square.svg"
              MouseArea {
                anchors.fill: parent
                onClicked: {
                  settings.obvisible = "true"
                  settings.tutorialLandelijk = "false"
                }
              }
              visible: {
                if (settings.tutorialLandelijk == "true"){
                  true
                }
                else {
                  false
                }
              }
            }
            
            /* TUTORIAL */

            ZenderDivider {
              text: i18n.tr("Public broadcast Corporation")

              visible: {
                if (settings.tutorialLandelijk == "true"){
                  false
                }
                else {
                  true
                }
              }
            }

            /* ALTERNATIEF PUBLIEK VLAANDEREN */

            Zender {
              naam: "VRT NWS"
              subText: "Betrouwbaar, helder en prikkelend"
              logo: "img/vrtnws.jpg"
              bron: "http://progressive-audio.lwc.vrtcdn.be/content/fixed/11_11niws-snip_hi.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Radio 1 Classics"
              subText: "Non-stop classics"
              logo: "img/radio1classics.jpg"
              bron: "http://icecast.vrtcdn.be/radio1_classics_high.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }      

            Zender {
              naam: "Ketnet Hits"
              subText: "De hipste, coolste én plezantste hits!"
              logo: "img/ketnethits.jpg"
              bron: "http://icecast.vrtcdn.be/ketnetradio-high.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }      

            /* EINDE ALTERNATIEF PUBLIEK VLAANDEREN */

            /* ALTERNATIEF PUBLIEK WALLONIË */

            Zender {
              naam: "RTBF Viva+"
              subText: "Vos chansons ont une histoire"
              logo: "img/rtbfvivaplus.jpg"
              bron: "https://radios.rtbf.be/vivaplus-128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "RTBF Jam."
              subText: "JAM, l'inattendu, l'inentendu"
              logo: "img/rtbfjam.jpg"
              bron: "https://radios.rtbf.be/jam-128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "RTBF Tarmac"
              subText: "The new playground"
              logo: "img/rtbftarmac.jpg"
              bron: "https://radios.rtbf.be/tarmac-128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE ALTERNATIEF PUBLIEK WALLONIË */

            /* ALTERNATIEF PUBLIEK OOST-BELGIË */

            ZenderDivider {
              text: i18n.tr("No stations found...")

              visible: {
                if (settings.obvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE ALTERNATIEF PUBLIEK OOST-BELGIË */

            ZenderDivider {
              text: i18n.tr("Commercial stations")

              visible: {
                if (settings.tutorialLandelijk == "true"){
                  false
                }
                else {
                  true
                }
              }
            }

            /* ALTERNATIEF COMMERCIEEL VLAANDEREN */

            // Voor Ment nog een degelijke werkende stream vinden
            /*
            Zender {
              naam: "Ment Radio"
              subText: "Al-1-maar-hits!"
              logo: "img/mentradio.jpg"
              bron: ""
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }
            */

            Zender {
              naam: "NRJ België"
              subText: "Hit music only!"
              logo: "img/nrjbelgie.jpg"
              bron: "https://20853.live.streamtheworld.com/NRJBELGIE.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "VBRO Radio"
              subText: "Ik luister Nederlandstalig"
              logo: "img/vbroradio.jpg"
              bron: "http://stream.vbro.be:9100/vbro"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Willy"
              subText: "Music Matters"
              logo: "img/willy.jpg"
              bron: "https://playerservices.streamtheworld.com/api/livestream-redirect/WILLY.mp3"
              visible: {
                if (settings.vlavisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE ALTERNATIEF COMMERCIEEL VLAANDEREN */

            /* ALTERNATIEF COMMERCIEEL WALLONIË */

            /*Zender {
              naam: "Antipode"
              subText: "La Radio du Brabant Wallon"
              logo: "img/antipode.jpg"
              bron: "http://antipode.belstream.net/antipode128.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }*/

            Zender {
              naam: "Must FM"
              subText: "Le son de votre région"
              logo: "img/mustfm.jpg"
              bron: "http://mustfm.ice.infomaniak.ch/mustfm-192.mp3"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "K I F"
              subText: "La radio Hip-Hop & RnB non-stop"
              logo: "img/kif.jpg"
              bron: "http://broadcast.sksgroup.com/kif_aac"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Sud Radio"
              subText: "C'est VOTRE radio proximité"
              logo: "img/sudradio.jpg"
              bron: "http://stream.ceit.be/sudradio-hainaut"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Radio Vibration"
              subText: "Belgium's best electronic music radio"
              logo: "img/radiovibration.jpg"
              bron: "http://vibrationbelgique.ice.infomaniak.ch/vibrationbelgique-high"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            Zender {
              naam: "Chérie Belgique"
              subText: "Chérir chaque instant, en musique"
              logo: "img/cherie.jpg"
              bron: "https://streamingp.shoutcast.com/Cherie"
              visible: {
                if (settings.walvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE ALTERNATIEF COMMERCIEEL WALLONIË */

            /* ALTERNATIEF COMMERCIEEL OOST-BELGIË */

            Zender {
              naam: "100'5 DAS HITRADIO Alemannia"
              subText: "Alemannia stream"
              logo: "img/1005dashitradio.jpg"
              bron: "http://stream.dashitradio.de/alemannia/mp3-128/stream.mp3"
              visible: {
                if (settings.obvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /* EINDE ALTERNATIEF COMMERCIEEL OOST-BELGIË */

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
            if (root.width < units.gu(120)) {
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
              text: i18n.tr("Antwerp")
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
              naam: "Geel FM"
              subText: "Jij hoort bij ons!"
              logo: "img/geelfm.jpg"
              bron: "http://geelfm.nsupdate.info:8080/geelfm.mp3"
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
              naam: "Radio Centraal"
              subText: "Antwerps lokaal, vrij radiostation"
              logo: "img/radiocentraal.jpg"
              bron: "http://streams.movemedia.eu/centraal"
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
              naam: "Radio Expres"
              subText: "Dé radio van 't stad"
              logo: "img/radioexpres.jpg"
              bron: "http://www.clubfmserver.be:8000/expres.mp3"
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
              naam: "Radio Minerva"
              subText: "Alle senioren willen hem horen!"
              logo: "img/radiominerva.jpg"
              bron: "http://91.121.219.80/minerva"
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
              naam: "Radio Noorderkempen"
              subText: "Heel veel hits!"
              logo: "img/radionoorderkempen.jpg"
              bron: "http://streams.movemedia.eu:8350/"
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
              naam: "Radio Paloma"
              subText: "Hét muzikale hart van de Kempen"
              logo: "img/radiopaloma.jpg"
              bron: "http://84.80.98.187:8000/paloma106"
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
              naam: "Radio Reflex"
              subText: "Regio Mechelen en de Rupelstreek"
              logo: "img/radioreflex.jpg"
              bron: "https://shoutcast2.wirelessbelgie.be/reflex"
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
              naam: "Zoe FM"
              subText: "De grootste classics!"
              logo: "img/zoefm.jpg"
              bron: "http://streams.movemedia.eu:8000/zoefmmp3"
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
              text: i18n.tr("Brussels")
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
              naam: "BRUZZ"
              subText: "Nieuws uit Brussel en de beste cultuurtips"
              logo: "img/bruzz.jpg"
              bron: "https://ice.cr6.streamzilla.xlcdn.com:8000/sz=fmbrussel=fmb988.mp3"
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
              naam: "BXFM"
              subText: "Brussels the sound of Europe"
              logo: "img/bxfm.jpg"
              bron: "https://bxfmradio.ice.infomaniak.ch/bxfmradio-192.mp3"
              visible: {
                if (settings.bruvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Geen werkende streaming URL gevonden
            /*Zender {
              naam: "Radio Air Libre"
              subText: "Radio associative d'expression"
              logo: "img/radioairlibre.jpg"
              bron: ""
              visible: {
                if (settings.bruvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }*/

            Zender {
              naam: "Radio Alma"
              subText: "La fréquence méditerranéenne de Bruxelles"
              logo: "img/radioalma.jpg"
              bron: "http://shoutcast2.wirelessbelgie.be:8310/;stream.mp3"
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
              naam: "Radio Campus Bruxelles"
              subText: "Radio d'expression libre"
              logo: "img/radiocampusbruxelles.jpg"
              bron: "http://streamer.radiocampus.be:8000/stream.mp3"
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
              naam: "Radio Judaïca"
              subText: "Ecoutez le changement"
              logo: "img/radiojudaica.jpg"
              bron: "http://radiojudaica.ice.infomaniak.ch/radiojudaica-128.mp3"
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
              naam: "Radio Panik"
              subText: "Radio libre bruxelloise"
              logo: "img/radiopanik.jpg"
              bron: "http://streaming.domainepublic.net/radiopanik.mp3"
              visible: {
                if (settings.bruvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            // Geen werkende stream
            /*Zender {
              naam: "XL Air"
              subText: "Oorverdovende Radio"
              logo: "img/xlair.jpg"
              bron: "http://streaming.ritcs.be/stream1"
              visible: {
                if (settings.bruvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }*/

            // Henegouwen

            ZenderDivider {
              text: i18n.tr("Hainaut")
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
              naam: "Buzz Radio"
              subText: "Votre radio pop/rock de référence à Charleroi"
              logo: "img/buzzradio.jpg"
              bron: "http://buzzradio.ice.infomaniak.ch/buzzradio-128.mp3"
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
              naam: "Charleking Radio"
              subText: "La grande radio de Charleroi"
              logo: "img/charlekingradio.jpg"
              bron: "http://charlekingradio.ice.infomaniak.ch/charlekingradio.mp3"
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
              naam: "Ma Radio"
              subText: "La radio qui me ressemble !"
              logo: "img/maradio.jpg"
              bron: "http://188.165.35.60:7150/;stream.nsv"
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
              naam: "Radio J600"
              subText: "La radio du Folklore Jumétois et de l'Animation de ses Quartiers"
              logo: "img/radioj600.jpg"
              bron: "http://manager2.streaming-ingenierie.fr:8106/;stream.mp3"
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
              naam: "VivaCité Hainaut"
              subText: "Ma radio complicité en Hainaut"
              logo: "img/vivacitehainaut.jpg"
              bron: "https://radios.rtbf.be/vivahainaut-128.mp3"
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
              naam: "YOUFM 106.9"
              subText: "La radio universitaire montoise !"
              logo: "img/youfm1069.jpg"
              bron: "http://youfm.ice.infomaniak.ch/youfm-96"
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
              text: i18n.tr("Limburg")
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
              naam: "BOO"
              subText: "De radio voor Zuidoost-Limburg"
              logo: "img/boo.jpg"
              bron: "http://stream03.level27.be/;stream.mp3"
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
              naam: "Family Radio"
              subText: "Bij ons ben je thuis!"
              logo: "img/familyradio.jpg"
              bron: "http://www.clubfmserver.be:8000/family.mp3"
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
              naam: "FM Goud"
              subText: "De beste muziekmix voor Noord-Limburg"
              logo: "img/fmgoud.jpg"
              bron: "https://fmgoud.level27.be/;stream.mp3"
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
              naam: "GRK"
              subText: "The Feelgood Station"
              logo: "img/grk.jpg"
              bron: "http://grk.stream01.level27.be/;stream.mp3"
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
              naam: "Hasselt1"
              subText: "Jouw nieuwe stadsradio!"
              logo: "img/hasselt1.jpg"
              bron: "http://live.radiostudio.be/hasselt1"
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
              naam: "Hit FM"
              subText: "Alle hits altijd"
              logo: "img/hitfm.jpg"
              bron: "http://94.23.48.124:8000/;&type=mp3"
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
              naam: "Radio Ariana"
              subText: "Vanuit de poort van haspengouw"
              logo: "img/radioariana.jpg"
              bron: "http://caster04.streampakket.com:8862/stream"
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
              naam: "Radio Benelux"
              subText: "Altijd in beweging"
              logo: "img/radiobenelux.jpg"
              bron: "http://remote.radiobenelux.be/MP3"
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
              naam: "Radio Internazionale"
              subText: "La radio dal cuore italiano"
              logo: "img/radiointernazionale.jpg"
              bron: "http://str01.fluidstream.net/fluid06.mp3"
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
              naam: "Radio Maaskant"
              subText: "Fijn van Maas tot mijn"
              logo: "img/radiomaaskant.jpg"
              bron: "http://antares.dribbcast.com/proxy/maaskant?mp=/stream"
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
              naam: "Radio Maria"
              subText: "Een kahtolieke stem bij u thuis"
              logo: "img/radiomaria.jpg"
              bron: "http://www.radiomaria.be:8000/RadioMaria-96"
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
              naam: "Radio Scorpio Leuven"
              subText: "Leuven - FM106"
              logo: "img/radioscorpioleuven.jpg"
              bron: "http://193.190.253.57:8000/stream"
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
              naam: "Radio VRD"
              subText: "Limburgs Leukste"
              logo: "img/radiovrd.jpg"
              bron: "http://live.radiostudio.be:8000/vrd"
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
              naam: "Sport FM Continu"
              subText: "Jouw grootste voor het Zuid-Oosten!"
              logo: "img/sportfmcontinu.jpg"
              bron: "http://stream.zeno.fm/kkbcxquzs4zuv"
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
              naam: "TrudoFM"
              subText: "Sint-Truiden - Borgloon"
              logo: "img/trudofm.jpg"
              bron: "http://198.143.144.226:8068/stream"
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
              text: i18n.tr("Liege")
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
              naam: "48FM"
              subText: "La radio des étudiants Liégeois"
              logo: "img/48fm.jpg"
              bron: "http://stream.48fm.com:8000/48fm-64"
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
              naam: "Équinoxe FM" 
              subText: "La radio liégeoise"
              logo: "img/equinoxefm.jpg"
              bron: "http://live.equinoxenamur.be:8000/Equinoxe.mp3"
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
              naam: "Radio-Hitalia"
              subText: "La dolce vita en fm"
              logo: "img/radiohitalia.jpg"
              bron: "http://wma02.fluidstream.net:8130/;stream.nsv"
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
              naam: "Radio Ourthe-Amblève"
              subText: "La radio de votre région !"
              logo: "img/radioourtheambleve.jpg"
              bron: "http://roa1062fm.ice.infomaniak.ch/roa1062fm-128.mp3"
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
              naam: "Radio Plus"
              subText: "Le radio de vos 20 ans"
              logo: "img/radioplus.jpg"
              bron: "https://stunnel1.cyber-streaming.com:9016/;stream.oa6v"
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
              naam: "Radio Prima"
              subText: "Toutes les infos de la radio en direct ici !"
              logo: "img/radioprima.jpg"
              bron: "http://37.187.114.62:8002/live"
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
              naam: "Warm FM"
              subText: "Votre prescription journalière de musique électronique"
              logo: "img/warmfm.jpg"
              bron: "http://stream05.warm.fm/warm"
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
              text: i18n.tr("Luxembourg")
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
              naam: "7FM"
              subText: "Love, Like, Fun"
              logo: "img/7fm.jpg"
              bron: "http://7fm.ice.infomaniak.ch/radio7fm-192.aac"
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
              naam: "Metropole Radio"
              subText: "La radio de la province de Luxembourg"
              logo: "img/metropoleradio.jpg"
              bron: "http://maxpag.eu:8000/metropole"
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
              naam: "Radio Sud"
              subText: "La radio du Beau Canton"
              logo: "img/radiosud.jpg"
              bron: "http://radiosud.ice.infomaniak.ch:80/radiosud-128"
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
              naam: "Studio S"
              subText: "L'écho de votre jeunesse !"
              logo: "img/studios.jpg"
              bron: "http://studios.ice.infomaniak.ch/studios-48.mp3"
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
              naam: "RLO"
              subText: "La radio du Centre Ardenne"
              logo: "img/rlo.jpg"
              bron: "http://94.23.27.6:8286/;"
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
              text: i18n.tr("Namur")
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
              naam: "Fréquence Éghezée"
              subText: "La radio locale d'Eghezée et des ses alentours"
              logo: "img/frequenceeghezee.jpg"
              bron: "http://stream.fr-eghezee.be:8054/FE"
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
              naam: "Hit Radio Namur"
              subText: "Be positive..."
              logo: "img/hitradionamur.jpg"
              bron: "http://player.hit-radio.be/hitradio.mp3"
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
              naam: "Radio quartz"
              subText: "La radio des trois provinces"
              logo: "img/radioquartz.jpg"
              bron: "http://91.121.29.128:8026/stream"
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
              naam: "Radio universitaire namuroise"
              subText: "La radio universitaire namuroise"
              logo: "img/radiouniversitairenamuroise.jpg"
              bron: "http://stream.run.be:8000/run128.mp3"
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
              text: i18n.tr("East Flanders")
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
              naam: "ClubFM"
              subText: "Join the Club!"
              logo: "img/clubfm.jpg"
              bron: "http://www.clubfmserver.be:8000/radioclubfm.mp3"
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
              naam: "Goeiedagradio"
              subText: "Wij zijn Aalst"
              logo: "img/goeiedagradio.jpg"
              bron: "http://goeiedag.radiostudio.be/aalst"
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
              naam: "KIX"
              subText: "Maximaal Radio"
              logo: "img/kix.jpg"
              bron: "http://stream.radiokix.be:10460/stream/1/"
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
              naam: "Radio Accent"
              subText: "Jouw radio voor Oost-Vlaanderen"
              logo: "img/radioaccent.jpg"
              bron: "http://www.clubfmserver.be:8000/accent.mp3"
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
              naam: "Aktief! Gold"
              subText: "De GOLDEN hits uit de jaren 60-70-80!"
              logo: "img/aktiefgold.jpg"
              bron: "http://www.clubfmserver.be:8000/aktief.mp3"
              visible: {
                if (settings.ovvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }

            /*/ Geen werkende URL gevonden
            Zender {
              naam: "Radio Beverland"
              subText: "Dé regioradio voor het waasland!"
              logo: "img/radiobeverland.jpg"
              bron: "http://livestream.beverland.info:8009/Beverland"
              visible: {
                if (settings.ovvisible == "false") {
                  false
                }
                else {
                  true
                }
              }
            }
            /*/

            Zender {
              naam: "TROS FM"
              subText: "Fun & Music"
              logo: "img/trosfm.jpg"
              bron: "http://s16.myradiostream.com:9362/listen.mp3"
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
              naam: "Urgent.fm"
              subText: "Radio van woonkamer naar woonkamer"
              logo: "img/urgentfm.jpg"
              bron: "http://urgentstream.radiostudio.be:8000/live"
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
              naam: "Zen FM"
              subText: "The answer is here!"
              logo: "img/zenfm.jpg"
              bron: "http://lb.zenfm.be/zenfm.mp3"
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
              text: i18n.tr("West Flanders")
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
              naam: "Kustradio"
              subText: "De kust is van jou"
              logo: "img/kustradio.jpg"
              bron: "http://www.clubfmserver.be:8000/kustradio.mp3"
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
              naam: "Westradio"
              subText: "Jouw radio voor de westkust"
              logo: "img/westradio.jpg"
              bron: "http://www.clubfmserver.be:8000/westradio.mp3"
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
              text: i18n.tr("Flemish Brabant")
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
              naam: "Radio Scorpio Ledegem"
              subText: "Een gewoonte"
              logo: "img/radioscorpioledegem.jpg"
              bron: "https://caster05.streampakket.com/proxy/8928/stream"
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
              naam: "RGR fm (hits)"
              subText: "Classic hits"
              logo: "img/rgrfm.jpg"
              bron: "http://uplink.intronic.nl/rgrfm_oldiesradio"
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
              naam: "RGR fm (dance)"
              subText: "Non stop rhythm & dance"
              logo: "img/rgrfmdance.jpg"
              bron: "http://uplink.intronic.nl/rgrfm"
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
              naam: "RGR 2"
              subText: "Altijd muziek - altijd plezier"
              logo: "img/rgr2.jpg"
              bron: "http://igor.torontocast.com:1760/stream"
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
              text: i18n.tr("Walloon Brabant")
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
              naam: "Radio Émotion"
              subText: "De loin la plus proche des radios"
              logo: "img/radioemotion.jpg"
              bron: "http://stream.radioemotion.be:80/;stream.mp3"
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
              naam: "Radio Extermix"
              subText: "100% Dance Radio Extremix!"
              logo: "img/radioextermix.jpg"
              bron: "http://streamingv2.shoutcast.com/RadioE-xtremix"
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
              naam: "Mélodie FM"
              subText: "La radio qui chante"
              logo: "img/melodiefm.jpg"
              bron: "http://188.165.35.60:8008/;"
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
              naam: "Ultrason"
              subText: "Ma radio, ma communauté"
              logo: "img/ultrason.jpg"
              bron: "http://broadcast.infomaniak.ch/ultrason-high.mp3"
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
              naam: "UpRadio"
              subText: "La Radio d'ici"
              logo: "img/upradio.jpg"
              bron: "http://upradio.ovh:8034/;stream/1"
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

    // bottomMenu; this menu contains te current playing radio station and player. It hides when the screen is bigger then units.gu(120), e.g. tablets or computers
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
        if (root.width > units.gu(120)) {
          false
        }
        else if (player.source < 1) {
          false
        }
        else {
          true
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

          text: i18n.tr("Now playing")

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

          width: units.gu(3)
          height: width

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

          anchors {
            centerIn: playerIcon
          }

          color: theme.palette.normal.background

          ActivityIndicator {
            running: true
            anchors.fill: parent
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
          title: i18n.tr("Favorites")
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
                  player.source = settings.slot1source
                  player.play()
                  playerText.text = settings.slot1text
                  bottomIMG.source = settings.slot1img
                  settings.source = settings.slot1source
                  settings.text = settings.slot1text
                  settings.image = settings.slot1img
                  bottomEdge.collapse()
                }
              }
              onPressAndHold: {
                slot1img.source = settings.image
                settings.slot1img = settings.image
                settings.slot1text = settings.text
                settings.slot1source = settings.source
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
                  player.source = settings.slot2source
                  player.play()
                  playerText.text = settings.slot2text
                  bottomIMG.source = settings.slot2img
                  settings.source = settings.slot2source
                  settings.text = settings.slot2text
                  settings.image = settings.slot2img
                  bottomEdge.collapse()
                }
              }
              onPressAndHold: {
                slot2img.source = settings.image
                settings.slot2img = settings.image
                settings.slot2text = settings.text
                settings.slot2source = settings.source
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
                  player.source = settings.slot3source
                  player.play()
                  playerText.text = settings.slot3text
                  bottomIMG.source = settings.slot3img
                  settings.source = settings.slot3source
                  settings.text = settings.slot3text
                  settings.image = settings.slot3img
                  bottomEdge.collapse()
                }
              }
              onPressAndHold: {
                slot3img.source = settings.image
                settings.slot3img = settings.image
                settings.slot3text = settings.text
                settings.slot3source = settings.source
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
                  player.source = settings.slot4source
                  player.play()
                  playerText.text = settings.slot4text
                  bottomIMG.source = settings.slot4img
                  settings.source = settings.slot4source
                  settings.text = settings.slot4text
                  settings.image = settings.slot4img
                  bottomEdge.collapse()
                }
              }
              onPressAndHold: {
                slot4img.source = settings.image
                settings.slot4img = settings.image
                settings.slot4text = settings.text
                settings.slot4source = settings.source
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

  // PlayerPage. It shows up when the screen is bigger then units.gu(120), e.g. tablets or computers
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
      if (parent.width < units.gu(120)) {
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
      title: i18n.tr("Now playing")
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
            i18n.tr("Select a station...")
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
      title: i18n.tr("Oops!")
      text: i18n.tr("This app requires an active internet connection! Please check your network settings and try again.")
      Button {
        text: i18n.tr("Close")
        color: theme.palette.normal.activity
        onClicked: Qt.quit()
      }

      Button {
        text: i18n.tr("Try anyway")
        color: "#888888"
        onClicked: PopupUtils.close(dialogue)
      }
    }
  }

  Component {
    id: tutorialMainDialog
    Dialog {
      id: dialogue3
      text: "<b>" + i18n.tr("Switch category") + "</b><br>" + i18n.tr("At the top of the screen you can switch between national, alternative and regional stations. You can switch between the different regions by using the flags in the menu bar.") + "<br> <br><b>" + i18n.tr("Add favorites") + "</b><br>" + i18n.tr("Swipe up from the bottom of the screen to show the favorites.") + "<br> <br>" + i18n.tr("Long press a button and the current playing radio station will be added to the favorites.") + "<br> <br>" + i18n.tr("Tap an existing favorite to play the radio station.") + " " + i18n.tr("Existing favorites can be overwritten by long pressing a button again.")
      Button {
        text:  i18n.tr("Close")
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
      title: i18n.tr("About") + " " + i18n.tr("Radio BE")
      Text {
        text: '<b>' + i18n.tr('Version') + ': 1.0</b> <br><b>' + i18n.tr('Source code') + ':</b> <a href="https://github.com/SanderKlootwijk/RadioBE">GitHub</a><br><b>' + i18n.tr('License') + ':</b> <a href="https://tldrlegal.com/license/mit-license">MIT ' + i18n.tr('License') + '</a><br><br> <br>© 2020 Sander Klootwijk'
        color: theme.palette.normal.baseText
        horizontalAlignment: Text.AlignHCenter
        onLinkActivated: Qt.openUrlExternally(link)
      }
      Button {
        text: i18n.tr("Close")
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
