import QtQuick 2.9
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3
import "components"

Item {
    id: tabRegional

    Scrollbar {
        z: 1
        id: scrollRegional

        flickableItem: flickRegional
        align: Qt.AlignTrailing
    }

    Flickable {
        id: flickRegional

        anchors.fill: parent

        contentWidth: columnRegional.width
        contentHeight: columnRegional.height

        Column {
            id: columnRegional

            width: tabRegional.width
                
            ListItem {
                id: firstRunListItem
                width: parent.width
                height: stationDividerLabel.contentHeight + units.gu(4)
                
                visible: settings.provinceName == "FirstRun"

                Label {
                    id: stationDividerLabel

                    width: parent.width - units.gu(4)

                    anchors.centerIn: parent
                    
                    text: i18n.tr("Choose a province from the app settings, to show regional radio stations below")
                    
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            /* ANTWERP */

            Column {
                width: parent.width

                visible: settings.provinceName == "Antwerp"            
                
                StationDivider {
                    text: i18n.tr("Antwerp")
                }

                Station {
                    name: "Geel FM"
                    subText: "Jij hoort bij ons!"
                    logo: "img/geelfm.jpg"
                    source: "http://geelfm.nsupdate.info:8080/geelfm.mp3"
                }

                Station {
                    name: "Radio Centraal"
                    subText: "Antwerps lokaal, vrij radiostation"
                    logo: "img/radiocentraal.jpg"
                    source: "http://streams.movemedia.eu/centraal"
                }

                Station {
                    name: "Radio Expres"
                    subText: "Dé radio van 't stad"
                    logo: "img/radioexpres.jpg"
                    source: "http://www.clubfmserver.be:8000/expres.mp3"
                }

                Station {
                    name: "Radio Minerva"
                    subText: "Alle senioren willen hem horen!"
                    logo: "img/radiominerva.jpg"
                    source: "http://91.121.219.80/minerva"
                }

                Station {
                    name: "Radio Noorderkempen"
                    subText: "Heel veel hits!"
                    logo: "img/radionoorderkempen.jpg"
                    source: "http://streams.movemedia.eu:8350/"
                }

                Station {
                    name: "Radio Paloma"
                    subText: "Hét muzikale hart van de Kempen"
                    logo: "img/radiopaloma.jpg"
                    source: "http://84.80.98.187:8000/paloma106"
                }

                Station {
                    name: "Radio Reflex"
                    subText: "Regio Mechelen en de Rupelstreek"
                    logo: "img/radioreflex.jpg"
                    source: "https://shoutcast2.wirelessbelgie.be/reflex"
                }

                Station {
                    name: "Zoe FM"
                    subText: "De grootste classics!"
                    logo: "img/zoefm.jpg"
                    source: "http://streams.movemedia.eu:8000/zoefmmp3"
                }
            }

            /* END OF ANTWERP */

            /* BRUSSEL */

            Column {
                width: parent.width

                visible: settings.provinceName == "Brussels"            
                
                StationDivider {
                    text: i18n.tr("Brussels")
                }

                Station {
                    name: "BRUZZ"
                    subText: "Nieuws uit Brussel en de beste cultuurtips"
                    logo: "img/bruzz.jpg"
                    source: "https://ice.cr6.streamzilla.xlcdn.com:8000/sz=fmbrussel=fmb988.mp3"
                }

                Station {
                    name: "BXFM"
                    subText: "Brussels the sound of Europe"
                    logo: "img/bxfm.jpg"
                    source: "https://bxfmradio.ice.infomaniak.ch/bxfmradio-192.mp3"
                }

                // No working streaming URL
                /*Station {
                    name: "Radio Air Libre"
                    subText: "Radio associative d'expression"
                    logo: "img/radioairlibre.jpg"
                    source: ""
                }*/

                Station {
                    name: "Radio Alma"
                    subText: "La fréquence méditerranéenne de Bruxelles"
                    logo: "img/radioalma.jpg"
                    source: "http://shoutcast2.wirelessbelgie.be:8310/;stream.mp3"
                }

                Station {
                    name: "Radio Campus Bruxelles"
                    subText: "Radio d'expression libre"
                    logo: "img/radiocampusbruxelles.jpg"
                    source: "http://streamer.radiocampus.be:8000/stream.mp3"
                }

                Station {
                    name: "Radio Judaïca"
                    subText: "Ecoutez le changement"
                    logo: "img/radiojudaica.jpg"
                    source: "http://radiojudaica.ice.infomaniak.ch/radiojudaica-128.mp3"
                }

                Station {
                    name: "Radio Panik"
                    subText: "Radio libre bruxelloise"
                    logo: "img/radiopanik.jpg"
                    source: "http://streaming.domainepublic.net/radiopanik.mp3"
                }

                // No working streaming URL
                /*Station {
                    name: "XL Air"
                    subText: "Oorverdovende Radio"
                    logo: "img/xlair.jpg"
                    source: "http://streaming.ritcs.be/stream1"
                }*/
            }

            /* END OF BRUSSEL */

            /* HAINAUT */

            Column {
                width: parent.width

                visible: settings.provinceName == "Hainaut"            
                
                StationDivider {
                    text: i18n.tr("Hainaut")
                }
                
                Station {
                    name: "Buzz Radio"
                    subText: "Votre radio pop/rock de référence à Charleroi"
                    logo: "img/buzzradio.jpg"
                    source: "http://buzzradio.ice.infomaniak.ch/buzzradio-128.mp3"
                }

                Station {
                    name: "Charleking Radio"
                    subText: "La grande radio de Charleroi"
                    logo: "img/charlekingradio.jpg"
                    source: "http://charlekingradio.ice.infomaniak.ch/charlekingradio.mp3"
                }

                Station {
                    name: "Ma Radio"
                    subText: "La radio qui me ressemble !"
                    logo: "img/maradio.jpg"
                    source: "http://188.165.35.60:7150/;stream.nsv"
                }

                Station {
                    name: "Radio J600"
                    subText: "La radio du Folklore Jumétois et de l'Animation de ses Quartiers"
                    logo: "img/radioj600.jpg"
                    source: "http://manager2.streaming-ingenierie.fr:8106/;stream.mp3"
                }

                Station {
                    name: "VivaCité Hainaut"
                    subText: "Ma radio complicité en Hainaut"
                    logo: "img/vivacitehainaut.jpg"
                    source: "https://radios.rtbf.be/vivahainaut-128.mp3"
                }

                Station {
                    name: "YOUFM 106.9"
                    subText: "La radio universitaire montoise !"
                    logo: "img/youfm1069.jpg"
                    source: "http://youfm.ice.infomaniak.ch/youfm-96"
                }
            }

            /* END OF HAINAUT */

            /* LIMBURG */

            Column {
                width: parent.width

                visible: settings.provinceName == "Limburg"            
                
                StationDivider {
                    text: i18n.tr("Limburg")
                }

                Station {
                    name: "BOO"
                    subText: "De radio voor Zuidoost-Limburg"
                    logo: "img/boo.jpg"
                    source: "http://stream03.level27.be/;stream.mp3"
                }

                Station {
                    name: "Family Radio"
                    subText: "Bij ons ben je thuis!"
                    logo: "img/familyradio.jpg"
                    source: "http://www.clubfmserver.be:8000/family.mp3"
                }

                Station {
                    name: "FM Goud"
                    subText: "De beste muziekmix voor Noord-Limburg"
                    logo: "img/fmgoud.jpg"
                    source: "https://fmgoud.level27.be/;stream.mp3"
                }

                Station {
                    name: "GRK"
                    subText: "The Feelgood Station"
                    logo: "img/grk.jpg"
                    source: "http://grk.stream01.level27.be/;stream.mp3"
                }

                Station {
                    name: "Hasselt1"
                    subText: "Jouw nieuwe stadsradio!"
                    logo: "img/hasselt1.jpg"
                    source: "http://live.radiostudio.be/hasselt1"
                }

                Station {
                    name: "Hit FM"
                    subText: "Alle hits altijd"
                    logo: "img/hitfm.jpg"
                    source: "http://94.23.48.124:8000/;&type=mp3"
                }

                Station {
                    name: "Radio Ariana"
                    subText: "Vanuit de poort van haspengouw"
                    logo: "img/radioariana.jpg"
                    source: "http://caster04.streampakket.com:8862/stream"
                }

                Station {
                    name: "Radio Benelux"
                    subText: "Altijd in beweging"
                    logo: "img/radiobenelux.jpg"
                    source: "http://remote.radiobenelux.be/MP3"
                }

                Station {
                    name: "Radio Internazionale"
                    subText: "La radio dal cuore italiano"
                    logo: "img/radiointernazionale.jpg"
                    source: "http://str01.fluidstream.net/fluid06.mp3"
                }

                Station {
                    name: "Radio Maaskant"
                    subText: "Fijn van Maas tot mijn"
                    logo: "img/radiomaaskant.jpg"
                    source: "http://antares.dribbcast.com/proxy/maaskant?mp=/stream"
                }

                Station {
                    name: "Radio Maria"
                    subText: "Een kahtolieke stem bij u thuis"
                    logo: "img/radiomaria.jpg"
                    source: "http://www.radiomaria.be:8000/RadioMaria-96"
                }

                Station {
                    name: "Radio Scorpio Leuven"
                    subText: "Leuven - FM106"
                    logo: "img/radioscorpioleuven.jpg"
                    source: "http://193.190.253.57:8000/stream"
                }

                Station {
                    name: "Radio VRD"
                    subText: "Limburgs Leukste"
                    logo: "img/radiovrd.jpg"
                    source: "http://live.radiostudio.be:8000/vrd"
                }

                Station {
                    name: "Sport FM Continu"
                    subText: "Jouw grootste voor het Zuid-Oosten!"
                    logo: "img/sportfmcontinu.jpg"
                    source: "http://stream.zeno.fm/kkbcxquzs4zuv"
                }

                Station {
                    name: "TrudoFM"
                    subText: "Sint-Truiden - Borgloon"
                    logo: "img/trudofm.jpg"
                    source: "http://198.143.144.226:8068/stream"
                }
            }

            /* END OF LIMBURG */

            /* LIEGE */

            Column {
                width: parent.width

                visible: settings.provinceName == "Liege"            
                
                StationDivider {
                    text: i18n.tr("Liege")
                }
                
                Station {
                    name: "48FM"
                    subText: "La radio des étudiants Liégeois"
                    logo: "img/48fm.jpg"
                    source: "http://stream.48fm.com:8000/48fm-64"
                }

                Station {
                    name: "Équinoxe FM" 
                    subText: "La radio liégeoise"
                    logo: "img/equinoxefm.jpg"
                    source: "http://live.equinoxenamur.be:8000/Equinoxe.mp3"
                }

                Station {
                    name: "Radio-Hitalia"
                    subText: "La dolce vita en fm"
                    logo: "img/radiohitalia.jpg"
                    source: "http://wma02.fluidstream.net:8130/;stream.nsv"
                }

                Station {
                    name: "Radio Ourthe-Amblève"
                    subText: "La radio de votre région !"
                    logo: "img/radioourtheambleve.jpg"
                    source: "http://roa1062fm.ice.infomaniak.ch/roa1062fm-128.mp3"
                }

                Station {
                    name: "Radio Plus"
                    subText: "Le radio de vos 20 ans"
                    logo: "img/radioplus.jpg"
                    source: "https://stunnel1.cyber-streaming.com:9016/;stream.oa6v"
                }

                Station {
                    name: "Radio Prima"
                    subText: "Toutes les infos de la radio en direct ici !"
                    logo: "img/radioprima.jpg"
                    source: "http://37.187.114.62:8002/live"
                }

                Station {
                    name: "Warm FM"
                    subText: "Votre prescription journalière de musique électronique"
                    logo: "img/warmfm.jpg"
                    source: "http://stream05.warm.fm/warm"
                }
            }

            /* END OF LIEGE */

            /* LUXEMBOURG */

            Column {
                width: parent.width

                visible: settings.provinceName == "Luxembourg"            
                
                StationDivider {
                    text: i18n.tr("Luxembourg")
                }

                Station {
                    name: "7FM"
                    subText: "Love, Like, Fun"
                    logo: "img/7fm.jpg"
                    source: "http://7fm.ice.infomaniak.ch/radio7fm-192.aac"
                }

                Station {
                    name: "Metropole Radio"
                    subText: "La radio de la province de Luxembourg"
                    logo: "img/metropoleradio.jpg"
                    source: "http://maxpag.eu:8000/metropole"
                }

                Station {
                    name: "Radio Sud"
                    subText: "La radio du Beau Canton"
                    logo: "img/radiosud.jpg"
                    source: "http://radiosud.ice.infomaniak.ch:80/radiosud-128"
                }

                Station {
                    name: "Studio S"
                    subText: "L'écho de votre jeunesse !"
                    logo: "img/studios.jpg"
                    source: "http://studios.ice.infomaniak.ch/studios-48.mp3"
                }

                Station {
                    name: "RLO"
                    subText: "La radio du Centre Ardenne"
                    logo: "img/rlo.jpg"
                    source: "http://94.23.27.6:8286/;"
                }
            }

            /* END OF LUXEMBOURG */

            /* NAMUR */

            Column {
                width: parent.width

                visible: settings.provinceName == "Namur"            
                
                StationDivider {
                    text: i18n.tr("Namur")
                }
                
                Station {
                    name: "Fréquence Éghezée"
                    subText: "La radio locale d'Eghezée et des ses alentours"
                    logo: "img/frequenceeghezee.jpg"
                    source: "http://stream.fr-eghezee.be:8054/FE"
                }

                Station {
                    name: "Hit Radio Namur"
                    subText: "Be positive..."
                    logo: "img/hitradionamur.jpg"
                    source: "http://player.hit-radio.be/hitradio.mp3"
                }

                Station {
                    name: "Radio quartz"
                    subText: "La radio des trois provinces"
                    logo: "img/radioquartz.jpg"
                    source: "http://91.121.29.128:8026/stream"
                }

                Station {
                    name: "Radio universitaire namuroise"
                    subText: "La radio universitaire namuroise"
                    logo: "img/radiouniversitairenamuroise.jpg"
                    source: "http://stream.run.be:8000/run128.mp3"
                }
            }

            /* END OF NAMUR */

            /* EAST FLANDERS */

            Column {
                width: parent.width

                visible: settings.provinceName == "East Flanders"            
                
                StationDivider {
                    text: i18n.tr("East Flanders")
                }
                
                Station {
                    name: "ClubFM"
                    subText: "Join the Club!"
                    logo: "img/clubfm.jpg"
                    source: "http://www.clubfmserver.be:8000/radioclubfm.mp3"
                }

                Station {
                    name: "Goeiedagradio"
                    subText: "Wij zijn Aalst"
                    logo: "img/goeiedagradio.jpg"
                    source: "http://goeiedag.radiostudio.be/aalst"
                }

                Station {
                    name: "KIX"
                    subText: "Maximaal Radio"
                    logo: "img/kix.jpg"
                    source: "http://stream.radiokix.be:10460/stream/1/"
                }

                Station {
                    name: "Radio Accent"
                    subText: "Jouw radio voor Oost-Vlaanderen"
                    logo: "img/radioaccent.jpg"
                    source: "http://www.clubfmserver.be:8000/accent.mp3"
                }

                Station {
                    name: "Aktief! Gold"
                    subText: "De GOLDEN hits uit de jaren 60-70-80!"
                    logo: "img/aktiefgold.jpg"
                    source: "http://www.clubfmserver.be:8000/aktief.mp3"
                }

                /*/ No working URL
                Station {
                    name: "Radio Beverland"
                    subText: "Dé regioradio voor het waasland!"
                    logo: "img/radiobeverland.jpg"
                    source: "http://livestream.beverland.info:8009/Beverland"
                }
                /*/

                Station {
                    name: "TROS FM"
                    subText: "Fun & Music"
                    logo: "img/trosfm.jpg"
                    source: "http://s16.myradiostream.com:9362/listen.mp3"
                }

                Station {
                    name: "Urgent.fm"
                    subText: "Radio van woonkamer naar woonkamer"
                    logo: "img/urgentfm.jpg"
                    source: "http://urgentstream.radiostudio.be:8000/live"
                }

                Station {
                    name: "Zen FM"
                    subText: "The answer is here!"
                    logo: "img/zenfm.jpg"
                    source: "http://lb.zenfm.be/zenfm.mp3"
                }
            }

            /* END OF EAST FLANDERS */

            /* WEST FLANDERS */

            Column {
                width: parent.width

                visible: settings.provinceName == "West Flanders"            
                
                StationDivider {
                    text: i18n.tr("West Flanders")
                }

                Station {
                    name: "Kustradio"
                    subText: "De kust is van jou"
                    logo: "img/kustradio.jpg"
                    source: "http://www.clubfmserver.be:8000/kustradio.mp3"
                }

                Station {
                    name: "Westradio"
                    subText: "Jouw radio voor de westkust"
                    logo: "img/westradio.jpg"
                    source: "http://www.clubfmserver.be:8000/westradio.mp3"
                }
            }

            /* END OF WEST FLANDERS */

            /* FLEMISH BRABANT */

            Column {
                width: parent.width

                visible: settings.provinceName == "Flemish Brabant"            
                
                StationDivider {
                    text: i18n.tr("Flemish Brabant")
                }

                Station {
                    name: "Radio Scorpio Ledegem"
                    subText: "Een gewoonte"
                    logo: "img/radioscorpioledegem.jpg"
                    source: "https://caster05.streampakket.com/proxy/8928/stream"
                }

                Station {
                    name: "RGR fm (hits)"
                    subText: "Classic hits"
                    logo: "img/rgrfm.jpg"
                    source: "http://uplink.intronic.nl/rgrfm_oldiesradio"
                }

                Station {
                    name: "RGR fm (dance)"
                    subText: "Non stop rhythm & dance"
                    logo: "img/rgrfmdance.jpg"
                    source: "http://uplink.intronic.nl/rgrfm"
                }

                Station {
                    name: "RGR 2"
                    subText: "Altijd muziek - altijd plezier"
                    logo: "img/rgr2.jpg"
                    source: "http://igor.torontocast.com:1760/stream"
                }
            }

            /* END OF FLEMISH BRABANT */

            /* WALLOON BRABANT */

            Column {
                width: parent.width

                visible: settings.provinceName == "Walloon Brabant"            
                
                StationDivider {
                    text: i18n.tr("Walloon Brabant")
                }

                Station {
                    name: "Radio Émotion"
                    subText: "De loin la plus proche des radios"
                    logo: "img/radioemotion.jpg"
                    source: "http://stream.radioemotion.be:80/;stream.mp3"
                }

                Station {
                    name: "Radio Extermix"
                    subText: "100% Dance Radio Extremix!"
                    logo: "img/radioextermix.jpg"
                    source: "http://streamingv2.shoutcast.com/RadioE-xtremix"
                }

                Station {
                    name: "Mélodie FM"
                    subText: "La radio qui chante"
                    logo: "img/melodiefm.jpg"
                    source: "http://188.165.35.60:8008/;"
                }

                Station {
                    name: "Ultrason"
                    subText: "Ma radio, ma communauté"
                    logo: "img/ultrason.jpg"
                    source: "http://broadcast.infomaniak.ch/ultrason-high.mp3"
                }

                Station {
                    name: "UpRadio"
                    subText: "La Radio d'ici"
                    logo: "img/upradio.jpg"
                    source: "http://upradio.ovh:8034/;stream/1"
                }
            }

            /* END OF WALLOON BRABANT */
        }
    }
}