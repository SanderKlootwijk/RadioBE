import QtQuick 2.9
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3
import "components"

Page {
    id: regionSettingsPage

    anchors.fill: parent

    header: PageHeader {
                id: regionSettingsPageHeader

                title: i18n.tr('Region')
            }

    Scrollbar {
        z: 1
        id: scrollRegionSettings

        flickableItem: flickRegionSettings
        align: Qt.AlignTrailing
    }

    Flickable {
        id: flickRegionSettings

        anchors {
            fill: parent
            topMargin: regionSettingsPageHeader.height
        }

        contentWidth: columnRegionSettings.width
        contentHeight: columnRegionSettings.height

        Column {
            id: columnRegionSettings

            width: regionSettingsPage.width

            ListItem {
                id: firstRunListItem
                width: parent.width
                height: stationDividerLabel.contentHeight + units.gu(4)
                
                Label {
                    id: stationDividerLabel

                    width: parent.width - units.gu(4)

                    anchors.centerIn: parent
                    
                    text: i18n.tr("Choose a region from the list below, to show national and alternative radio stations")
                    
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            RegionListItem {
                name: i18n.tr("Flanders")
                region: "Flanders"
                subText: i18n.tr("Dutch-speaking Belgium")
            }

            RegionListItem {
                name: i18n.tr("Wallonia")
                region: "Wallonia"
                subText: i18n.tr("French-speaking Belgium")
            }

            RegionListItem {
                name: i18n.tr("East-Belgium")
                region: "East-Belgium"
                subText: i18n.tr("German-speaking Belgium")
            }
        }
    }
}