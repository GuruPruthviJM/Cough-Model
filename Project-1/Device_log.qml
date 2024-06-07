import QtQuick 2.15

Item {
    width: windowId.width
    height: windowId.height
    visible: false
    Rectangle{
        anchors.fill: parent
        color: "black"
    }
    Rectangle{
        width: parent.width
        height: parent.height*0.1
        color: "#57578f"
    }
    Rectangle{
        width: parent.width
        height: parent.height*0.09
        color: "black"
        Row{
            spacing: parent.width*0.18
            x: parent.width*0.1
            anchors.verticalCenter: parent.verticalCenter
            Text {
                id: systemTextId
                text: qsTr("SYSTEM LOGS")
                font.bold: true
                color: "white"
                font.pixelSize: parent.width*0.025
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        systemId.visible=true
                        monitoringLogId.visible=false
                        techId.visible=false
                        systemTextId.font.bold=true
                        deviceLogTextId.font.bold=false
                        techTextId.font.bold=false
                        systemLogId.visible=true
                        monitorLogId.visible=false
                        systemLogId.updateDat()
                        techLogId.visible=false
                    }
                }
            }
            Text {
                id: deviceLogTextId
                text: qsTr("MONITORING LOGS")
                // font.bold: true
                color: "white"
                font.pixelSize: parent.width*0.025
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        systemId.visible=false
                        monitoringLogId.visible=true
                        techId.visible=false
                        systemTextId.font.bold=false
                        deviceLogTextId.font.bold=true
                        techTextId.font.bold=false
                        systemLogId.visible=false
                        monitorLogId.visible=true
                        techLogId.visible=false
                        monitorLogId.updateDat()
                        // deviceInfoId.visible=false
                    }
                }
            }
            Text {
                id: techTextId
                text: qsTr("TECH LOGS")
                // font.bold: true
                color: "white"
                font.pixelSize: parent.width*0.025
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        systemId.visible=false
                        monitoringLogId.visible=false
                        techId.visible=true
                        systemTextId.font.bold=false
                        deviceLogTextId.font.bold=false
                        techTextId.font.bold=true
                        systemLogId.visible=false
                        monitorLogId.visible=false
                        techLogId.visible=true
                        techLogId.updateDat()
                        // deviceInfoId.visible=false
                    }
                }
            }
        }
        Rectangle{
            id: systemId
            x: parent.width*0.07
            y: parent.height*0.991
            width: parent.width*0.2
            height: parent.height*0.1
            color: "blue"
        }
        Rectangle{
            id: monitoringLogId
            x: parent.width*0.39
            y: parent.height*0.991
            width: parent.width*0.22
            height: parent.height*0.1
            visible: false
            color: "blue"
        }
        Rectangle{
            id: techId
            x: parent.width*0.715
            y: parent.height*0.991
            width: parent.width*0.19
            height: parent.height*0.1
            visible: false
            color: "blue"
        }
    }
}

