import QtQuick 2.15

Item {
    id: root
    anchors.fill: parent
    property var  idHolder: ""
    property int  pre_val: 2
    Rectangle{
        width: parent.width
        height: parent.height*0.9
        anchors.bottom: parent.bottom
        color: "black"
        Row{
            width: parent.width
            height: parent.height*0.15
            x: parent.width*0.02
            y:parent.height*0.02
            spacing: parent.width*0.012
            Rectangle{
                width: parent.width*0.15
                height: parent.height
                color: "#9573e2"
                Image {
                    width: parent.width*0.6
                    height: parent.height*0.6
                    anchors.centerIn: parent
                    source: "images/usb-removebg-preview.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        firstRectId.visible=true
                        secoundRectId.visible=false
                        thirdRectId.visible=false
                        fourthRectId.visible=false
                        fifthRectId.visible=false
                        sixthRectId.visible=false
                        firstItemId.visible=true
                        secoundItemId.visible=false
                        thirdItemId.visible=false
                        fourthItemId.visible=false
                        fifthItemId.visible=false
                        sixthItemId.visible=false
                    }
                }
            }
            Rectangle{
                width: parent.width*0.15
                height: parent.height
                color: "#9b7a49"
                Image {
                    width: parent.width*0.6
                    height: parent.height*0.6
                    anchors.centerIn: parent
                    source: "images/output-onlinepngtools (3).png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        firstRectId.visible=false
                        secoundRectId.visible=true
                        thirdRectId.visible=false
                        fourthRectId.visible=false
                        fifthRectId.visible=false
                        sixthRectId.visible=false
                        firstItemId.visible=false
                        secoundItemId.visible=true
                        thirdItemId.visible=false
                        fourthItemId.visible=false
                        fifthItemId.visible=false
                        sixthItemId.visible=false
                    }
                }
            }
            Rectangle{
                width: parent.width*0.15
                height: parent.height
                color: "#4059ec"
                Image {
                    width: parent.width*0.6
                    height: parent.height*0.6
                    anchors.centerIn: parent
                    source: "images/reset_admin-removebg-preview.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        firstRectId.visible=false
                        secoundRectId.visible=false
                        thirdRectId.visible=true
                        fourthRectId.visible=false
                        fifthRectId.visible=false
                        sixthRectId.visible=false
                        firstItemId.visible=false
                        secoundItemId.visible=false
                        thirdItemId.visible=true
                        fourthItemId.visible=false
                        fifthItemId.visible=false
                        sixthItemId.visible=false
                    }
                }
            }
            Rectangle{
                width: parent.width*0.15
                height: parent.height
                color: "#3eb04e"
                Image {
                    width: parent.width*0.6
                    height: parent.height*0.6
                    anchors.centerIn: parent
                    source: "images/save-removebg-preview.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        firstRectId.visible=false
                        secoundRectId.visible=false
                        thirdRectId.visible=false
                        fourthRectId.visible=true
                        fifthRectId.visible=false
                        sixthRectId.visible=false
                        firstItemId.visible=false
                        secoundItemId.visible=false
                        thirdItemId.visible=false
                        fourthItemId.visible=true
                        fifthItemId.visible=false
                        sixthItemId.visible=false
                    }
                }
            }
            Rectangle{
                width: parent.width*0.15
                height: parent.height
                color: "#0096f3"
                Image {
                    width: parent.width*0.6
                    height: parent.height*0.6
                    anchors.centerIn: parent
                    source: "images/usb-removebg-preview.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        firstRectId.visible=false
                        secoundRectId.visible=false
                        thirdRectId.visible=false
                        fourthRectId.visible=false
                        fifthRectId.visible=true
                        sixthRectId.visible=false
                        firstItemId.visible=false
                        secoundItemId.visible=false
                        thirdItemId.visible=false
                        fourthItemId.visible=false
                        fifthItemId.visible=true
                        sixthItemId.visible=false
                    }
                }
            }
            Rectangle{
                width: parent.width*0.15
                height: parent.height
                color: "#80bc00"
                Image {
                    width: parent.width*0.6
                    height: parent.height*0.6
                    anchors.centerIn: parent
                    source: "images/download_admin-removebg-preview.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        firstRectId.visible=false
                        secoundRectId.visible=false
                        thirdRectId.visible=false
                        fourthRectId.visible=false
                        fifthRectId.visible=false
                        sixthRectId.visible=true
                        firstItemId.visible=false
                        secoundItemId.visible=false
                        thirdItemId.visible=false
                        fourthItemId.visible=false
                        fifthItemId.visible=false
                        sixthItemId.visible=true
                    }
                }
            }
        }
        Rectangle{
            width: parent.width*0.958
            height: parent.height*0.01
            color: "#57578f"
            y:parent.height*0.172
            x:parent.width*0.02
        }

        Rectangle{
            id: firstRectId
            width: parent.width*0.15
            height: parent.height*0.01
            color: "blue"
            visible: true
            x: parent.width*0.02
            y: parent.height*0.172
        }
        Rectangle{
            id: secoundRectId
            width: parent.width*0.15
            height: parent.height*0.01
            color: "blue"
            visible: false
            y: parent.height*0.172
            anchors.left: firstRectId.right
            anchors.leftMargin: parent.width*0.012
        }
        Rectangle{
            id: thirdRectId
            width: parent.width*0.15
            height: parent.height*0.01
            color: "blue"
            visible: false
            y: parent.height*0.172
            anchors.left: secoundRectId.right
            anchors.leftMargin: parent.width*0.012
        }
        Rectangle{
            id: fourthRectId
            width: parent.width*0.15
            height: parent.height*0.01
            color: "blue"
            visible: false
            y: parent.height*0.172
            anchors.left: thirdRectId.right
            anchors.leftMargin: parent.width*0.012
        }
        Rectangle{
            id: fifthRectId
            width: parent.width*0.15
            height: parent.height*0.01
            color: "blue"
            visible: false
            y: parent.height*0.172
            anchors.left: fourthRectId.right
            anchors.leftMargin: parent.width*0.012
        }
        Rectangle{
            id: sixthRectId
            width: parent.width*0.15
            height: parent.height*0.01
            color: "blue"
            visible: false
            y: parent.height*0.172
            anchors.left: fifthRectId.right
            anchors.leftMargin: parent.width*0.012
        }
    }
    Item {
        id: firstItemId
        width: parent.width
        height: parent.height*0.7
        anchors.bottom: parent.bottom
        // visible: false
        Text {
            text: qsTr("Remote Server Settings")
            font.pixelSize: parent.width*0.03
            color: "white"
            font.bold: true
            x: parent.width*0.02
        }
        Rectangle{
            width: parent.width*0.8
            height: parent.height*0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "#3a4963"
            border.width: parent.width*0.008
            border.color: "#727089"
            Text {
                text: qsTr("Remote Webserver URL:")
                font.pixelSize: parent.width*0.03
                color: "white"
                x: parent.width*0.02
                y: parent.height*0.02
            }
            Rectangle{
                width: parent.width*0.65
                height: parent.height*0.08
                color: "#c2d4ec"
                x: parent.width*0.02
                y:parent.height*0.1
                clip: true
                Text {
                    anchors.centerIn: parent
                    text: qsTr("ar.herokuapp.com/tesla.data.server/rest/receiver")
                    font.pixelSize: parent.width*0.035
                    color: "white"
                    font.bold: true
                }
            }
            Text{
                text: "NTP Server Address :"
                font.pixelSize: parent.width*0.03
                color: "white"
                x: parent.width*0.02
                y: parent.height*0.23
            }
            Rectangle{
                width: parent.width*0.65
                height: parent.height*0.08
                color: "#c2d4ec"
                x: parent.width*0.02
                y:parent.height*0.31
            }
            Text{
                text: "Enable/Disable Log Service: "
                color: "white"
                font.pixelSize: parent.width*0.03
                x: parent.width*0.02
                y: parent.height*0.5
            }
            Tooglebar{
                x: parent.width*0.5
                y: parent.height*0.5
            }
            Text{
                text: "Enable/Disable Insp Breath: "
                color: "white"
                font.pixelSize: parent.width*0.03
                x: parent.width*0.02
                y: parent.height*0.62
            }
            Tooglebar{
                x: parent.width*0.5
                y: parent.height*0.62
            }
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.1
                color: "#a4b8d5"
                x: parent.width*0.25
                y: parent.height*0.8
                radius: parent.width*0.01
                Text {
                    text: qsTr("SAVE")
                    font.pixelSize: parent.width*0.1
                    anchors.centerIn: parent
                    color: "white"
                }
            }
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.1
                color: "#a4b8d5"
                x: parent.width*0.55
                y: parent.height*0.8
                radius: parent.width*0.01
                Text {
                    text: qsTr("CANCEL")
                    font.pixelSize: parent.width*0.1
                    anchors.centerIn: parent
                    color: "white"
                }
            }
        }
    }
    Item {
        id: secoundItemId
        width: parent.width
        height: parent.height*0.7
        visible: false
        anchors.bottom: parent.bottom
        Text {
            text: qsTr("Lock Limits Adjustments")
            font.pixelSize: parent.width*0.03
            color: "white"
            font.bold: true
            x: parent.width*0.02
        }
        Rectangle{
            width: parent.width*0.8
            height: parent.height*0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "#3a4963"
            border.width: parent.width*0.008
            border.color: "#727089"
            Rect_Drawer{
                id: frequencyId
                y: parent.height*0.1
                g:"Preassure Adjust\nAllow Limit"
                textValue: 7
                x: parent.width*0.02
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        frequencyId.rectColorFlag=(frequencyId.rectColorFlag)?false:true
                        amplitudeId.rectColorFlag=true
                        flowId.rectColorFlag=true
                        // triggerId.rectColorFlag=true
                        idHolder=frequencyId
                        pre_val=idHolder.textValue
                    }
                }
            }
            Rect_Drawer{
                id: amplitudeId
                y: parent.height*0.35
                g:"Time Adjust\nAllow Limit"
                textValue: 3
                x: parent.width*0.02
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        frequencyId.rectColorFlag=true
                        amplitudeId.rectColorFlag=(amplitudeId.rectColorFlag)?false:true
                        flowId.rectColorFlag=true
                        // triggerId.rectColorFlag=true
                        idHolder=amplitudeId
                        pre_val=idHolder.textValue
                    }
                }
            }
            Rect_Drawer{
                id:flowId
                y: parent.height*0.6
                g:"Cycle Adjustment\nAllow Limit"
                textValue: 2
                x: parent.width*0.02
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        frequencyId.rectColorFlag=true
                        amplitudeId.rectColorFlag=true
                        flowId.rectColorFlag=(flowId.rectColorFlag)?false:true
                        // triggerId.rectColorFlag=true
                        idHolder=flowId
                        pre_val=idHolder.textValue
                    }
                }
            }
            Rectangle{
                x: parent.width*0.65
                y:parent.height*0.23
                width: parent.width*0.1
                height: parent.height*0.15
                radius: parent.width*0.1/2
                color: "#7296c4"
                Image {
                    anchors.centerIn: parent
                    width: parent.width*0.35
                    height: parent.height*0.5
                    source: "images/"+imageNameUp+"-removebg-preview-removebg-preview (1).png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(idHolder===frequencyId&&idHolder.textValue<20){
                            idHolder.textValue+=1
                        }else if(idHolder===amplitudeId&&idHolder.textValue<5){
                            idHolder.textValue+=1
                        }else if(idHolder===flowId&&idHolder.textValue<5){
                            idHolder.textValue+=1
                        }else{}
                    }

                    onPressed: {
                        imageNameUp="upkey-black"
                        timerIncr.start()
                        parent.color="white"
                    }
                    onReleased: {
                        imageNameUp="upkey"
                        timerIncr.stop()
                        parent.color="#7296c4"
                    }
                    Timer {
                        id: timerIncr
                        interval: 500
                        repeat: true
                        running: false
                        onTriggered: {
                            if(idHolder===frequencyId&&idHolder.textValue<20){
                                idHolder.textValue+=1
                            }else if(idHolder===amplitudeId&&idHolder.textValue<5){
                                idHolder.textValue+=1
                            }else if(idHolder===flowId&&idHolder.textValue<5){
                                idHolder.textValue+=1
                            }else{}
                        }
                    }
                }
            }
            Rectangle{
                x: parent.width*0.65
                y:parent.height*0.4
                width: parent.width*0.1
                height: parent.height*0.15
                radius: parent.width*0.1/2
                color: "#7296c4"
                Image {
                    anchors.centerIn: parent
                    width: parent.width*0.35
                    height: parent.height*0.5
                    source: "images/"+imageNameDown+"-removebg-preview-removebg-preview (1).png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(idHolder===frequencyId&&idHolder.textValue>5){
                            idHolder.textValue-=1
                        }else if(idHolder===amplitudeId&&idHolder.textValue>1){
                            idHolder.textValue-=1
                        }else if(idHolder===flowId&&idHolder.textValue>1){
                            idHolder.textValue-=1
                        }else{}
                    }
                    onPressed: {
                        imageNameDown="downkey-black"
                        timerDecr.start()
                        parent.color="white"
                    }
                    onReleased: {
                        imageNameDown="downkey"
                        timerDecr.stop()
                        parent.color="#7296c4"
                    }
                    Timer {
                        id: timerDecr
                        interval: 500
                        repeat: true
                        running: false
                        onTriggered: {
                            if(idHolder===frequencyId&&idHolder.textValue>5){
                                idHolder.textValue-=1
                            }else if(idHolder===amplitudeId&&idHolder.textValue>1){
                                idHolder.textValue-=1
                            }else if(idHolder===flowId&&idHolder.textValue>1){
                                idHolder.textValue-=1
                            }else{}
                        }
                    }
                }
            }
            Rectangle{
                x: parent.width*0.65
                y:parent.height*0.57
                width: parent.width*0.1
                height: parent.height*0.15
                radius: parent.width*0.1/2
                color: "#7296c4"
                Image {
                    anchors.centerIn: parent
                    width: parent.width*0.8
                    height: parent.height*0.8
                    source: "images/"+imageNameReset+"-removebg-preview.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        imageNameReset="reset-black"
                        timer.start()
                        parent.color="white"
                    }
                    onReleased: {
                        imageNameReset="reset"
                        timer.stop()
                        parent.color="#7296c4"
                    }
                    Timer {
                        id: timer
                        interval: 200
                        repeat: true
                        running: false
                        onTriggered: {
                            if(idHolder===frequencyId&&idHolder.textValue>5){
                                idHolder.textValue-=1
                            }else if(idHolder===amplitudeId&&idHolder.textValue>1){
                                idHolder.textValue-=1
                            }else if(idHolder===flowId&&idHolder.textValue>1){
                                idHolder.textValue-=1
                            }else{}
                        }
                    }
                }
            }
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.1
                color: "#a4b8d5"
                x: parent.width*0.78
                anchors.verticalCenter: parent.verticalCenter
                radius: parent.width*0.01
                Text {
                    text: qsTr("SAVE")
                    font.pixelSize: parent.width*0.1
                    anchors.centerIn: parent
                    color: "white"
                }
            }
        }

    }
    Item {
        id: thirdItemId
        width: parent.width
        height: parent.height*0.7
        anchors.bottom: parent.bottom
        visible: false
        Text {
            text: qsTr("Reset Device to Default Settings")
            font.pixelSize: parent.width*0.03
            color: "white"
            font.bold: true
            x: parent.width*0.02
        }
        Rectangle{
            width: parent.width*0.8
            height: parent.height*0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "#3a4963"
            border.width: parent.width*0.008
            border.color: "#727089"
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.1
                color: "green"
                x: parent.width*0.25
                y: parent.height*0.8
                radius: parent.width*0.01
                Text {
                    text: qsTr("Reset")
                    font.pixelSize: parent.width*0.1
                    anchors.centerIn: parent
                    color: "white"
                }
            }
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.1
                color: "green"
                x: parent.width*0.55
                y: parent.height*0.8
                radius: parent.width*0.01
                Text {
                    text: qsTr("Reset HMR")
                    font.pixelSize: parent.width*0.1
                    anchors.centerIn: parent
                    color: "white"
                }
            }
        }
    }
    Item {
        id: fourthItemId
        width: parent.width
        height: parent.height*0.7
        anchors.bottom: parent.bottom
        visible: false
        Text {
            text: qsTr("Select USB Device to Save Device Settings")
            font.pixelSize: parent.width*0.03
            color: "white"
            font.bold: true
            x: parent.width*0.02
        }
        Rectangle{
            width: parent.width*0.8
            height: parent.height*0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "#3a4963"
            border.width: parent.width*0.008
            border.color: "#727089"
        }
    }
    Item {
        id: fifthItemId
        width: parent.width
        height: parent.height*0.7
        anchors.bottom: parent.bottom
        visible: false
        Text {
            text: qsTr("Select USB Device to Load Device Settings")
            font.pixelSize: parent.width*0.03
            color: "white"
            font.bold: true
            x: parent.width*0.02
        }
        Rectangle{
            width: parent.width*0.8
            height: parent.height*0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "#3a4963"
            border.width: parent.width*0.008
            border.color: "#727089"
        }
    }
    Item {
        id: sixthItemId
        width: parent.width
        height: parent.height*0.7
        anchors.bottom: parent.bottom
        visible: false
        Text {
            text: qsTr("Select USB Device to Download the Logs")
            font.pixelSize: parent.width*0.03
            color: "white"
            font.bold: true
            x: parent.width*0.02
        }
        Rectangle{
            width: parent.width*0.8
            height: parent.height*0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "#3a4963"
            border.width: parent.width*0.008
            border.color: "#727089"
        }
    }
}
