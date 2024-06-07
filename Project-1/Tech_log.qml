import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    width: windowId.width
    height: windowId.height
    signal toDrawer
    visible: false

    function updateDat() {
        var r = systemLog.fetchTechData();
        systemListModel.clearData();
        for (var i = 0; i < r.length; ++i) {
            var row = r[i];
            systemListModel.addData(row);
        }
    }
    Rectangle{
        width: parent.width*0.9
        height: parent.height*0.7
        color: "white"
        anchors.centerIn: parent
        y:parent.height*0.1
        TableView {
            id: tableView
            width: parent.width*0.99
            height: parent.height*0.99
            anchors.centerIn: parent
            model: systemListModel
            Component.onCompleted: {
                updateDat()
            }
            style: TableViewStyle {
                transientScrollBars : true
                headerDelegate: Rectangle {
                    height: tableView.height*0.1
                    color: "black"
                    Text {
                        id: textItem
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: styleData.value
                        renderType: Text.NativeRendering
                        font.bold: true
                        color: "white"
                        font.pixelSize: tableView.width*0.02
                    }
                }
                rowDelegate: Rectangle {
                    width: parent.width
                    height: tableView.height*0.1
                    color: "black"
                }
                backgroundColor: "black"
            }
            TableViewColumn {
                role: "Time_Stamp"
                title: "Time Stamp"
                width: tableView.width*0.3
                resizable: false
                movable: false
            }

            TableViewColumn {
                role: "Event_ID"
                title: "Event ID"
                width: tableView.width*0.1
                resizable: false
                movable: false
            }
            TableViewColumn {
                role: "Log_Type"
                title: "Log Type"
                width: tableView.width*0.14
                resizable: false
                movable: false
            }
            TableViewColumn {
                role: "Event_Type"
                title: "Event Type"
                width: tableView.width*0.24
                resizable: false
                movable: false
            }
            TableViewColumn {
                role: "Value"
                title: "Value"
                width: tableView.width*0.1
                resizable: false
                movable: false
            }
            TableViewColumn {
                role: "Ref_ID"
                title: "Ref ID"
                width: tableView.width*0.1
                resizable: false
                movable: false
            }
            itemDelegate: Item {
                implicitWidth: tableView.width
                implicitHeight: tableView.height
                Rectangle {
                    color: "black"
                    anchors.fill: parent
                    Text {
                        anchors.centerIn: parent
                        text: styleData.value
                        color: "white"
                        font.pixelSize: tableView.width*0.02
                    }
                }
            }
        }
    }
    Row {
        width: parent.width
        height: parent.height * 0.1
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.12
        spacing: parent.width * 0.15
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.02
        Rectangle {
            id: preButtonId
            width: parent.width * 0.15
            height: parent.height * 0.9
            opacity: 0.2
            enabled: false
            Text {
                text: qsTr("PREVIOUS")
                font.pixelSize: parent.width * 0.12
                font.bold: true
                anchors.centerIn: parent
                color: "white"
            }
            color: "#43536e"
            radius: parent.width * 0.015
        }
        Rectangle {
            width: parent.width * 0.15
            height: parent.height * 0.9
            Text {
                text: qsTr("CLOSE")
                font.pixelSize: parent.width * 0.12
                font.bold: true
                anchors.centerIn: parent
                color: "white"
            }
            color: "#43536e"
            radius: parent.width * 0.015
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    toDrawer()
                }
            }
        }
        Rectangle {
            id: nextButtonId
            width: parent.width * 0.15
            height: parent.height * 0.9
            Text {
                text: qsTr("NEXT")
                font.pixelSize: parent.width * 0.12
                font.bold: true
                anchors.centerIn: parent
                color: "white"
            }
            color: "#43536e"
            radius: parent.width * 0.015
            // MouseArea {
            //     anchors.fill: parent
            //     onClicked: {
            //         // tableView.flick(0, -1300)
            //         clickCount++
            //         if (clickCount > 0) {
            //             preButtonId.enabled = true
            //             preButtonId.opacity = 1
            //         } else {
            //             preButtonId.enabled = false
            //             preButtonId.opacity = 0.2
            //         }
            //     }
            // }
        }
    }
    // Text {
    //     text: qsTr("Hii boss")
    //     font.pixelSize: parent.width*0.25
    // }
}
