import QtQuick 2.9
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3
import "components"

Page {
    id: provinceSettingsPage

    anchors.fill: parent

    header: PageHeader {
                id: provinceSettingsPageHeader

                title: i18n.tr('Province')
            }

    Scrollbar {
        z: 1
        id: scrollProvinceSettings

        flickableItem: flickProvinceSettings
        align: Qt.AlignTrailing
    }

    Flickable {
        id: flickProvinceSettings

        anchors {
            fill: parent
            topMargin: provinceSettingsPageHeader.height
        }

        contentWidth: columnProvinceSettings.width
        contentHeight: columnProvinceSettings.height

        Column {
            id: columnProvinceSettings

            width: provinceSettingsPage.width

            ListItem {
                id: firstRunListItem
                width: parent.width
                height: stationDividerLabel.contentHeight + units.gu(4)
                
                Label {
                    id: stationDividerLabel

                    width: parent.width - units.gu(4)

                    anchors.centerIn: parent
                    
                    text: i18n.tr("Choose a province from the list below, to show radio stations from your province on the <i>Regional</i> tab")
                    
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            ProvinceListItem {
                name: i18n.tr("Antwerp")
                province: "Antwerp"
            }

            ProvinceListItem {
                name: i18n.tr("Brussels")
                province: "Brussels"
            }

            ProvinceListItem {
                name: i18n.tr("Hainaut")
                province: "Hainaut"
            }

            ProvinceListItem {
                name: i18n.tr("Limburg")
                province: "Limburg"
            }

            ProvinceListItem {
                name: i18n.tr("Liege")
                province: "Liege"
            }

            ProvinceListItem {
                name: i18n.tr("Luxembourg")
                province: "Luxembourg"
            }

            ProvinceListItem {
                name: i18n.tr("Namur")
                province: "Namur"
            }

            ProvinceListItem {
                name: i18n.tr("East Flanders")
                province: "East Flanders"
            }

            ProvinceListItem {
                name: i18n.tr("West Flanders")
                province: "West Flanders"
            }

            ProvinceListItem {
                name: i18n.tr("Flemish Brabant")
                province: "Flemish Brabant"
            }

            ProvinceListItem {
                name: i18n.tr("Walloon Brabant")
                province: "Walloon Brabant"
            }
        }
    }
}