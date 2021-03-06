import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import "../components"

Drawer {
    id: root
    height: mainApp.height; width: mainApp.width*0.6
    edge: Qt.RightEdge

    background: Rectangle
    {
        color: isDarkTheme? darkThemeBgColor:lightThemeBgColor

        Item
        {
            anchors.margins: 20
            anchors.fill: parent


            ColumnLayout
            {
                anchors.fill: parent
                spacing: 10

                Text {
                    text: qsTr("SETTINGS")
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    font.pixelSize: 15;
                    color: isDarkTheme? darkThemeForeColor:lightThemeForeColor
                }

                Rectangle
                {
                    Layout.fillWidth: true; Layout.preferredHeight: 1; color: "grey"; opacity: 0.5
                }

                SettingsWidget
                {
                    id: themeChangerWidget
                }

                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                Item{
                    height: 50; Layout.fillWidth: true

                    RowLayout
                    {
                        anchors.fill: parent

                        Text{
                            Layout.fillWidth: true; Layout.fillHeight: true
                        }

                        Rectangle
                        {
                            height: 40; anchors.topMargin: 5; anchors.bottomMargin: 5
                            width: 100; radius: height/2
                            color: "#E08A7B"

                            RowLayout
                            {
                                anchors.fill: parent
                                anchors.leftMargin: 10; anchors.rightMargin: 10

                                AppIcon
                                {
                                    icon: "\uf05e"
                                    size: 15
                                    Layout.alignment: Qt.AlignVCenter|Qt.AlignLeft
                                    Layout.rightMargin: 10
                                    color: darkThemeForeColor
                                }

                                Text {
                                    text: qsTr("Cancel")
                                    Layout.alignment: Qt.AlignRight|Qt.AlignVCenter
                                    font.pixelSize: 15; Layout.rightMargin: 20
                                    color: darkThemeForeColor
                                }
                            }

                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked: {
                                    close()
                                }
                            }
                        }

                        Rectangle
                        {
                            height: 40; anchors.topMargin: 5; anchors.bottomMargin: 5
                            width: 150; radius: height/2
                            color: "#19799F"

                            RowLayout
                            {
                                anchors.fill: parent
                                anchors.leftMargin: 10; anchors.rightMargin: 10

                                AppIcon
                                {
                                    icon: "\uf0c7"
                                    size: 15
                                    Layout.alignment: Qt.AlignVCenter|Qt.AlignLeft
                                    Layout.rightMargin: 10
                                    color: darkThemeForeColor
                                }

                                Text {
                                    text: qsTr("Save Changes")
                                    Layout.alignment: Qt.AlignRight|Qt.AlignVCenter
                                    font.pixelSize: 15; Layout.rightMargin: 20
                                    color: darkThemeForeColor
                                }
                            }

                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked: {
                                    isDarkTheme = themeChangerWidget.themeIsToggled
                                    close()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
