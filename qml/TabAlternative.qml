import QtQuick 2.9
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3
import "components"

Item {
    id: tabAlternative

    Scrollbar {
        z: 1
        id: scrollAlternative

        flickableItem: flickAlternative
        align: Qt.AlignTrailing
    }

    Flickable {
        id: flickAlternative

        anchors.fill: parent

        contentWidth: columnAlternative.width
        contentHeight: columnAlternative.height

        Column {
            id: columnAlternative

            width: tabAlternative.width

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

                /* ALTERNATIVE PUBLIC STATIONS FLANDERS */

                StationDivider {
                    text: "VRT " + i18n.tr("Stations")
                }

                Station {
                    name: "VRT NWS"
                    subText: "Betrouwbaar, helder en prikkelend"
                    logo: "img/vrtnws.jpg"
                    source: "http://progressive-audio.vrtcdn.be/content/fixed/11_11niws-snip_hi.mp3"
                }

                Station {
                    name: "Radio 1 Classics"
                    subText: "Non-stop classics"
                    logo: "img/radio1classics.jpg"
                    source: "http://icecast.vrtcdn.be/radio1_classics_high.mp3"
                }      

                Station {
                    name: "Ketnet Hits"
                    subText: "De hipste, coolste én plezantste hits!"
                    logo: "img/ketnethits.jpg"
                    source: "http://icecast.vrtcdn.be/ketnetradio-high.mp3"
                }      

                /* END OF ALTERNATIVE PUBLIC STATIONS FLANDERS */

                /* ALTERNATIVE COMMERCIAL STATIONS FLANDERS */

                StationDivider {
                    text: i18n.tr("Commercial Stations")
                }

                Station {
                    name: "Ment Radio"
                    subText: "Al-1-maar-hits!"
                    logo: "img/mentradio.jpg"
                    source: "https://s44.myradiostream.com/:8030/listen.mp3"
                }

                Station {
                    name: "NRJ België"
                    subText: "Hit music only!"
                    logo: "img/nrjbelgie.jpg"
                    source: "https://20853.live.streamtheworld.com/NRJBELGIE.mp3"
                }

                Station {
                    name: "VBRO Radio"
                    subText: "Ik luister Nederlandstalig"
                    logo: "img/vbroradio.jpg"
                    source: "http://stream.vbro.be:9100/vbro"
                }

                Station {
                    name: "Willy"
                    subText: "Music Matters"
                    logo: "img/willy.jpg"
                    source: "https://playerservices.streamtheworld.com/api/livestream-redirect/WILLY.mp3"
                }

                /* END OF ALTERNATIVE COMMERCIAL STATIONS FLANDERS */
            }

            /* END OF FLANDERS */

            /* WALLONIA */

            Column {
                width: parent.width

                visible: settings.regionName == "Wallonia"

                /* ALTERNATIVE PUBLIC STATIONS WALLONIA */

                StationDivider {
                    text: "RTBF " + i18n.tr("Stations")
                }

                Station {
                    name: "RTBF Viva+"
                    subText: "Vos chansons ont une histoire"
                    logo: "img/rtbfvivaplus.jpg"
                    source: "https://radios.rtbf.be/vivaplus-128.mp3"
                }

                Station {
                    name: "RTBF Jam."
                    subText: "JAM, l'inattendu, l'inentendu"
                    logo: "img/rtbfjam.jpg"
                    source: "https://radios.rtbf.be/jam-128.mp3"
                }

                Station {
                    name: "RTBF Tarmac"
                    subText: "The new playground"
                    logo: "img/rtbftarmac.jpg"
                    source: "https://radios.rtbf.be/tarmac-128.mp3"
                }

                /* END OF ALTERNATIVE PUBLIC STATIONS WALLONIA */

                /* ALTERNATIVE COMMERCIAL STATIONS WALLONIA */

                StationDivider {
                    text: i18n.tr("Commercial Stations")
                }

                Station {
                    name: "Must FM"
                    subText: "Le son de votre région"
                    logo: "img/mustfm.jpg"
                    source: "https://n08a-eu.rcs.revma.com/cm96zpmrmm0uv"
                }

                Station {
                    name: "K I F"
                    subText: "La radio Hip-Hop & RnB non-stop"
                    logo: "img/kif.jpg"
                    source: "http://broadcast.sksgroup.com/kif_aac"
                }

                Station {
                    name: "Sud Radio"
                    subText: "C'est VOTRE radio proximité"
                    logo: "img/sudradio.jpg"
                    source: "http://stream.ceit.be/sudradio-hainaut"
                }

                Station {
                    name: "Radio Vibration"
                    subText: "Belgium's best electronic music radio"
                    logo: "img/radiovibration.jpg"
                    source: "http://vibrationbelgique.ice.infomaniak.ch/vibrationbelgique-high"
                }

                Station {
                    name: "Chérie Belgique"
                    subText: "Chérir chaque instant, en musique"
                    logo: "img/cherie.jpg"
                    source: "https://streamingp.shoutcast.com/Cherie"
                }

                /* END OF ALTERNATIVE COMMERCIAL STATIONS WALLONIA */
            }

            /* END OF WALLONIA */

            /* EAST-BELGIUM */

            Column {
                width: parent.width

                visible: settings.regionName == "East-Belgium"

                /* ALTERNATIVE PUBLIC STATIONS EAST-BELGIUM */

                // No alternative public stations

                /* END OF ALTERNATIVE PUBLIC STATIONS EAST-BELGIUM */

                /* ALTERNATIVE COMMERCIAL STATIONS EAST-BELGIUM */

                StationDivider {
                    text: i18n.tr("Commercial Stations")
                }

                Station {
                    name: "100'5 DAS HITRADIO Alemannia"
                    subText: "Alemannia stream"
                    logo: "img/1005dashitradio.jpg"
                    source: "http://dashitradio-de-hz-fal-stream05-cluster01.radiohost.de/alemannia_128"
                }

                /* END OF ALTERNATIVE COMMERCIAL STATIONS EAST-BELGIUM */
            }

            /* END OF EAST-BELGIUM */
        }
    }
}