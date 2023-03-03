import QtQuick 2.9
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3
import "components"

Item {
    id: tabNational

    Scrollbar {
        z: 1
        id: scrollNational

        flickableItem: flickNational
        align: Qt.AlignTrailing
    }

    Flickable {
        id: flickNational

        anchors.fill: parent

        contentWidth: columnNational.width
        contentHeight: columnNational.height

        Column {
            id: columnNational

            width: tabNational.width

            ListItem {
                id: firstRunListItem
                width: parent.width
                height: stationDividerLabel.contentHeight + units.gu(4)
                
                visible: settings.regionName == "FirstRun"

                Label {
                    id: stationDividerLabel

                    width: parent.width - units.gu(4)

                    anchors.centerIn: parent
                    
                    text: i18n.tr("Select a region to listen to national and alternative radio stations")
                    
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            RegionListItem {
                name: i18n.tr("Flanders")
                region: "Flanders"
                subText: i18n.tr("Dutch-speaking Belgium")

                visible: settings.regionName == "FirstRun"
            }

            RegionListItem {
                name: i18n.tr("Wallonia")
                region: "Wallonia"
                subText: i18n.tr("French-speaking Belgium")

                visible: settings.regionName == "FirstRun"
            }

            RegionListItem {
                name: i18n.tr("East-Belgium")
                region: "East-Belgium"
                subText: i18n.tr("German-speaking Belgium")
                
                visible: settings.regionName == "FirstRun"
            }

            /* FLANDERS */

            Column {
                width: parent.width

                visible: settings.regionName == "Flanders"

                /* PUBLIC STATIONS FLANDERS */

                StationDivider {
                    text: "VRT " + i18n.tr("Stations")
                }

                Station {
                    name: "Radio 1"
                    subText: "Altijd benieuwd"
                    logo: "img/radio1.jpg"
                    source: "http://icecast.vrtcdn.be/radio1-high.mp3"
                }

                Station {
                    name: "Radio 2"
                    subText: "De grootste familie"
                    logo: "img/radio2.jpg"
                    source: "http://icecast.vrtcdn.be/ra2wvl-high.mp3"
                }

                Station {
                    name: "MNM"
                    subText: "Music and more"
                    logo: "img/mnm.jpg"
                    source: "http://icecast.vrtcdn.be/mnm-high.mp3"
                }

                Station {
                    name: "Studio Brussel"
                    subText: "Life is Music"
                    logo: "img/stubru.jpg"
                    source: "http://icecast.vrtcdn.be/stubru-high.mp3"
                }

                Station {
                    name: "Klara"
                    subText: "Blijf verwonderd"
                    logo: "img/klara.jpg"
                    source: "http://icecast.vrtcdn.be/klara-high.mp3"
                }

                /* END OF PUBLIC STATIONS FLANDERS */

                /* COMMERCIAL STATIONS FLANDERS */

                StationDivider {
                    text: i18n.tr("Commercial Stations")
                }

                Station {
                    name: "Q-music"
                    subText: "Q sounds better with you"
                    logo: "img/qmusic.jpg"
                    source: "https://20133.live.streamtheworld.com/QMUSIC.mp3"
                }

                Station {
                    name: "Joe"
                    subText: "All the way"
                    logo: "img/joe.jpg"
                    source: "https://icecast-qmusicbe-cdp.triple-it.nl/joe.mp3"
                }

                Station {
                    name: "Nostalgie"
                    subText: "What a feeling!"
                    logo: "img/nostalgie.jpg"
                    source: "https://22193.live.streamtheworld.com/NOSTALGIEWHATAFEELING.mp3"
                }

                Station {
                    name: "TOPradio"
                    subText: "We Love Music"
                    logo: "img/topradio.jpg"
                    source: "https://str.topradio.be/topradio.mp3"
                }

                /* END OF COMMERCIAL STATIONS FLANDERS */
            }

            /* END OF FLANDERS */

            /* WALLONIA */

            Column {
                width: parent.width

                visible: settings.regionName == "Wallonia"

                /* PUBLIC STATIONS WALLONIA */

                StationDivider {
                    text: "RTBF " + i18n.tr("Stations")
                }

                Station {
                    name: "RTBF La Première"
                    subText: "L'esprit clair"
                    logo: "img/rtbflapremiere.jpg"
                    source: "https://radios.rtbf.be/laprem1ere-128.mp3"
                }

                Station {
                    name: "RTBF VivaCité"
                    subText: "Et la vie va!"
                    logo: "img/rtbfvivacite.jpg"
                    source: "https://redbeemedia.streamabc.net/redbm-vivabxl-aac-128-1428473"
                }

                Station {
                    name: "RTBF Musiq3"
                    subText: "Changez d'airs"
                    logo: "img/rtbfmusiq3.jpg"
                    source: "https://radios.rtbf.be/musiq3-128.mp3"
                }

                Station {
                    name: "RTBF Classic 21"
                    subText: "Écoutez l'orginal"
                    logo: "img/rtbfclassic21.jpg"
                    source: "https://radios.rtbf.be/classic21-128.mp3"
                }

                Station {
                    name: "RTBF Tipik"
                    subText: "Le nouveau média digital"
                    logo: "img/rtbftipik.jpg"
                    source: "https://radios.rtbf.be/pure-128.mp3"
                }

                /* END OF PUBLIC STATIONS WALLONIA */

                /* COMMERCIAL STATIONS WALLONIA */

                StationDivider {
                    text: i18n.tr("Commercial Stations")
                }

                Station {
                    name: "Bel RTL"
                    subText: "Vos meillurs moments"
                    logo: "img/belrtl.jpg"
                    source: "https://belrtl.ice.infomaniak.ch/belrtl-mp3-192.mp3"
                }

                Station {
                    name: "Radio Contact"
                    subText: "Feel Good"
                    logo: "img/radiocontact.jpg"
                    source: "http://audiostream.rtl.be/contactfr"
                }

                Station {
                    name: "Fun Radio"
                    subText: "Enjoy The Music"
                    logo: "img/funradio.jpg"
                    source: "http://live.funradio.be/funradiobe-high.mp3"
                }

                Station {
                    name: "NRJ Belgique"
                    subText: "Hit Music Only"
                    logo: "img/nrjbelgique.jpg"
                    source: "https://streamingp.shoutcast.com/NRJ"
                }

                Station {
                    name: "DH Radio"
                    subText: "Le plaisir de la musique"
                    logo: "img/dhradio.jpg"
                    source: "http://n05a-eu.rcs.revma.com/anew1ctrgzzuv"
                }

                /* END OF COMMERCIAL STATIONS WALLONIA */
            }

            /* END OF WALLONIA */

            /* EAST-BELGIUM */

            Column {
                width: parent.width

                visible: settings.regionName == "East-Belgium"

                /* PUBLIC STATIONS EAST-BELGIUM */

                StationDivider {
                    text: "BRF " + i18n.tr("Stations")
                }

                Station {
                    name: "BRF1"
                    subText: "Aktuelle Hits"
                    logo: "img/brf1.jpg"
                    source: "https://streaming.brf.be/brf1-high.mp3"
                }

                Station {
                    name: "BRF2"
                    subText: "Wir lieben deutschsprachige Musik!"
                    logo: "img/brf2.jpg"
                    source: "https://streaming.brf.be/brf2-high.mp3"
                }

                /* END OF PUBLIC STATIONS EAST-BELGIUM */

                /* COMMERCIAL STATIONS EAST-BELGIUM */

                StationDivider {
                    text: i18n.tr("Commercial Stations")
                }

                Station {
                    name: "100'5 DAS HITRADIO"
                    subText: "Die Superhits der 80er, der 90er und das Beste von heute"
                    logo: "img/1005dashitradio.jpg"
                    source: "https://dashitradio-de-hz-fal-stream09-cluster01.radiohost.de/dashitradio_128"
                }

                Station {
                    name: "Radio Contact Ostbelgien NOW"
                    subText: "Der einzige private Sender"
                    logo: "img/radiocontactostbelgiennow.jpg"
                    source: "http://radio-contact.dh-media.net:7000/stream/1/;stream.mp3"
                }

                Station {
                    name: "Radio Sunshine"
                    subText: "Hier spielt die Musik"
                    logo: "img/radiosunshine.jpg"
                    source: "http://streamlive.syndicationradio.fr:8158/stream"
                }

                Station {
                    name: "Radio 700"
                    subText: "Schlager und Oldies"
                    logo: "img/radio700.jpg"
                    source: "https://www.tunefm.de:2000/stream/radio700"
                }

                /* END OF COMMERCIAL STATIONS EAST-BELGIUM */
            }

            /* END OF EAST-BELGIUM */
        }
    }
}