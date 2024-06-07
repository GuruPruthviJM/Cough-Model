import QtQuick 2.15
// import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15
Item {
    id: drawerId
    width: windowId.width
    height: windowId.height
    property string fromWhere: ""
    signal toPassword()
    signal toConfirm()
    property string imageNameUp: "upkey"
    property string imageNameDown: "downkey"
    property string imageNameReset: "reset"
    property int freVal: 0
    property int  aptVal: 3
    property string  inspFlowVal: "2"
    property int  triggerFlowVal: 1

    Component.onCompleted: {
        freVal= drawerCpp.retrieveValue('Oscillation Frequency')
        aptVal= drawerCpp.retrieveValue('Oscillation Amplitude')
        inspFlowVal= drawerCpp.retrieveValue('Insp. Flow')
        triggerFlowVal= drawerCpp.retrieveValue('Insp. Trigger Sensitivity')
    }

    onIdHolderChanged: {
        if(idHolder!==''){
            drawerCpp.insertOrUpdateData('Oscillation Frequency',frequencyId.textValue)
            drawerCpp.insertOrUpdateData('Oscillation Amplitude',amplitudeId.textValue)
            drawerCpp.insertOrUpdateData('Insp. Flow',flowId.textValue)
            drawerCpp.insertOrUpdateData('Insp. Trigger Sensitivity',triggerId.textValue)
        }
    }
    function fromFooter(){
        settingsDrawer.open()
        mainDrawerId.visible=true
        buttonRowId.visible=true
        deviceSettingInsiderId.visible=false
        drawerId.enabled=true
        frequencyId.rectColorFlag=true
        amplitudeId.rectColorFlag=true
        flowId.rectColorFlag=true
        triggerId.rectColorFlag=true
        idHolder=''
        drawerCpp.insertOrUpdateData('Oscillation Frequency',frequencyId.textValue)
        drawerCpp.insertOrUpdateData('Oscillation Amplitude',amplitudeId.textValue)
        drawerCpp.insertOrUpdateData('Insp. Flow',flowId.textValue)
        drawerCpp.insertOrUpdateData('Insp. Trigger Sensitivity',triggerId.textValue)
    }
    signal toNav()
    function fromNav(index){
        if(index!==0){
            removeId.opacity=1
            removeId.enabled=true
        }else{
            removeId.opacity=0.2
            removeId.enabled=false
        }
        frequencyId.rectColorFlag=true
        amplitudeId.rectColorFlag=true
        flowId.rectColorFlag=true
        triggerId.rectColorFlag=true
        idHolder=''
        drawerCpp.insertOrUpdateData('Oscillation Frequency',frequencyId.textValue)
        drawerCpp.insertOrUpdateData('Oscillation Amplitude',amplitudeId.textValue)
        drawerCpp.insertOrUpdateData('Insp. Flow',flowId.textValue)
        drawerCpp.insertOrUpdateData('Insp. Trigger Sensitivity',triggerId.textValue)
    }
    function fromPassword(){
        settingsDrawer.open()
        adminId.visible=true
        frequencyId.rectColorFlag=true
        amplitudeId.rectColorFlag=true
        flowId.rectColorFlag=true
        triggerId.rectColorFlag=true
        idHolder=''
        drawerCpp.insertOrUpdateData('Oscillation Frequency',frequencyId.textValue)
        drawerCpp.insertOrUpdateData('Oscillation Amplitude',amplitudeId.textValue)
        drawerCpp.insertOrUpdateData('Insp. Flow',flowId.textValue)
        drawerCpp.insertOrUpdateData('Insp. Trigger Sensitivity',triggerId.textValue)
    }
    function fromDLog(){
        settingsDrawer.visible=true
        frequencyId.rectColorFlag=true
        amplitudeId.rectColorFlag=true
        flowId.rectColorFlag=true
        triggerId.rectColorFlag=true
        idHolder=''
        drawerCpp.insertOrUpdateData('Oscillation Frequency',frequencyId.textValue)
        drawerCpp.insertOrUpdateData('Oscillation Amplitude',amplitudeId.textValue)
        drawerCpp.insertOrUpdateData('Insp. Flow',flowId.textValue)
        drawerCpp.insertOrUpdateData('Insp. Trigger Sensitivity',triggerId.textValue)
    }

    signal toProfile()
    signal toDeviceLog()
    property var idHolder: ""
    property var pre_val: 0
    enabled: false

    Drawer {
        id: settingsDrawer
        width: parent.width * 0.75
        height: parent.height
        Rectangle {
            anchors.fill: parent
            color: "black"
        }
        Rectangle{
            id: mainDrawerId
            x: parent.width*0.05
            y:parent.height*0.02
            width: parent.width*0.9
            height: parent.height*0.82
            color: "#636677"
            Rect_Drawer{
                id: frequencyId
                y: parent.height*0.1
                g:"Oscillation\nFrequency"
                textValue: freVal
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        frequencyId.rectColorFlag=(frequencyId.rectColorFlag)?false:true
                        amplitudeId.rectColorFlag=true
                        flowId.rectColorFlag=true
                        triggerId.rectColorFlag=true
                        idHolder=frequencyId
                        pre_val=idHolder.textValue
                    }
                }
            }
            Rect_Drawer{
                id: amplitudeId
                y: parent.height*0.3
                g:"Oscillation\nAmplitude"
                textValue: aptVal
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        frequencyId.rectColorFlag=true
                        amplitudeId.rectColorFlag=(amplitudeId.rectColorFlag)?false:true
                        flowId.rectColorFlag=true
                        triggerId.rectColorFlag=true
                        idHolder=amplitudeId
                        pre_val=idHolder.textValue
                    }
                }
            }
            Rect_Drawer{
                id:flowId
                y: parent.height*0.5
                g:"Insp. Flow"
                textValue: inspFlowVal
                textSize: parent.width*0.045
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        frequencyId.rectColorFlag=true
                        amplitudeId.rectColorFlag=true
                        flowId.rectColorFlag=(flowId.rectColorFlag)?false:true
                        triggerId.rectColorFlag=true
                        idHolder=flowId
                        pre_val=idHolder.textValue
                    }
                }
            }
            Rect_Drawer{
                id: triggerId
                y: parent.height*0.7
                textValue: triggerFlowVal
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        frequencyId.rectColorFlag=true
                        amplitudeId.rectColorFlag=true
                        flowId.rectColorFlag=true
                        triggerId.rectColorFlag=(triggerId.rectColorFlag)?false:true
                        idHolder=triggerId
                        pre_val=idHolder.textValue
                    }
                }
            }
            Rectangle{
                x: parent.width*0.8
                y:parent.height*0.23
                width: parent.width*0.1
                height: parent.height*0.125
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
                        }else if(idHolder===flowId){
                            if(idHolder.textValue==="Low"){
                                idHolder.textValue="Medium"
                            }else{
                                idHolder.textValue="High"
                            }
                        }else if(idHolder===triggerId&&idHolder.textValue<10){
                            idHolder.textValue+=1
                        }else{}
                    }
                    onPressed: {
                        timerIncr.start()
                        imageNameUp="upkey-black"
                        parent.color="white"
                    }
                    onReleased: {
                        timerIncr.stop()
                        imageNameUp="upkey"
                        parent.color="#7296c4"
                    }
                    Timer{
                        id: timerIncr
                        // running: true
                        repeat: true
                        interval: 500
                        onTriggered: {
                            if(idHolder===frequencyId&&idHolder.textValue<20){
                                idHolder.textValue+=1
                            }else if(idHolder===amplitudeId&&idHolder.textValue<5){
                                idHolder.textValue+=1
                            }else if(idHolder===flowId){
                                if(idHolder.textValue==="Low"){
                                    idHolder.textValue="Medium"
                                }else{
                                    idHolder.textValue="High"
                                }
                            }else if(idHolder===triggerId&&idHolder.textValue<10){
                                idHolder.textValue+=1
                            }else{}
                        }
                    }
                }
            }
            Rectangle{
                x: parent.width*0.8
                y:parent.height*0.4
                width: parent.width*0.1
                height: parent.height*0.12
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
                        }else if(idHolder===flowId){
                            if(idHolder.textValue==="High"){
                                idHolder.textValue="Medium"
                            }else{
                                idHolder.textValue="Low"
                            }
                        }else if(idHolder===triggerId&&idHolder.textValue>1){
                            idHolder.textValue-=1
                        }else{}
                    }

                    onPressed: {
                        timerDecr.start()
                        imageNameDown="downkey-black"
                        parent.color="white"
                    }
                    onReleased: {
                        timerDecr.stop()
                        imageNameDown="downkey"
                        parent.color="#7296c4"
                    }
                    Timer{
                        id: timerDecr
                        repeat: true
                        interval: 500
                        onTriggered: {
                            if(idHolder===frequencyId&&idHolder.textValue>5){
                                idHolder.textValue-=1
                            }else if(idHolder===amplitudeId&&idHolder.textValue>1){
                                idHolder.textValue-=1
                            }else if(idHolder===flowId){
                                if(idHolder.textValue==="High"){
                                    idHolder.textValue="Medium"
                                }else{
                                    idHolder.textValue="Low"
                                }
                            }else if(idHolder===triggerId&&idHolder.textValue>1){
                                idHolder.textValue-=1
                            }else{}
                        }
                    }
                }
            }
            Rectangle{
                x: parent.width*0.8
                y:parent.height*0.57
                width: parent.width*0.1
                height: parent.height*0.12
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
                        idHolder.textValue=pre_val
                        imageNameReset="reset-black"
                        parent.color="white"
                    }
                    onReleased: {
                        imageNameReset="reset"
                        parent.color="#7296c4"
                    }
                }
            }
            Tooglebar{
                x: parent.width*0.81
                y: parent.height*0.915
                darkMode: false
            }
            Text {
                x: parent.width*0.63
                y: parent.height*0.92
                text: qsTr("Insp. Trigger")
                font.bold: true
                font.pixelSize: parent.width*0.025
                color: "white"
            }
        }
        Row{
            id: buttonRowId
            width: parent.width
            height: parent.height
            x:parent.width*0.07
            y:parent.height*0.88
            spacing: parent.width*0.12
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.07
                color: "#757a7f"
                radius: parent.width*0.01
                Text {
                    text: qsTr("SAVE AS PROFILE")
                    font.pixelSize: parent.width*0.08
                    anchors.centerIn: parent
                    font.bold: true
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        toProfile()
                        settingsDrawer.close()
                    }
                }
            }
            Rectangle{
                id: removeId
                width: parent.width*0.2
                height: parent.height*0.07
                color: "#757a7f"
                radius: parent.width*0.01
                opacity: 0.2
                enabled: false
                Text {
                    text: qsTr("REMOVE THIS PROFILE")
                    font.pixelSize: parent.width*0.08
                    anchors.centerIn: parent
                    font.bold: true
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        settingsDrawer.close()
                        toConfirm()
                    }
                }
            }
            Rectangle{
                width: parent.width*0.2
                height: parent.height*0.07
                color: "#757a7f"
                radius: parent.width*0.01
                Text {
                    text: qsTr("DEVICE SETTINGS")
                    font.pixelSize: parent.width*0.08
                    anchors.centerIn: parent
                    font.bold: true
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        deviceSettingInsiderId.visible=true
                        mainDrawerId.visible=false
                        buttonRowId.visible=false
                        diviseId.visible=true
                        diviseLogId.visible=false
                        administrationId.visible=false
                        deviceTextId.font.bold=true
                        deviceLogTextId.font.bold=false
                        administrationTextId.font.bold=false
                        deviceInfoId.visible=true
                        adminId.visible=false
                    }
                }
            }
        }
        Rectangle{
            id: deviceSettingInsiderId
            anchors.fill: parent
            visible: false
            Rectangle{
                width: parent.width
                height: parent.height*0.1
                color: "#57578f"
                // visible: false
            }
            Rectangle{
                width: parent.width
                height: parent.height*0.09
                color: "black"
                // visible: false
                Row{
                    spacing: parent.width*0.11
                    x: parent.width*0.03
                    anchors.verticalCenter: parent.verticalCenter
                    Image {
                        width: parent.width*0.05
                        height: parent.height
                        source: "images/backarrow-removebg-preview.png"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                deviceSettingInsiderId.visible=false
                                mainDrawerId.visible=true
                                buttonRowId.visible=true
                            }
                        }
                    }
                    Text {
                        id: deviceTextId
                        text: qsTr("DEVICE INFO")
                        font.bold: true
                        color: "white"
                        font.pixelSize: parent.width*0.025
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                diviseId.visible=true
                                diviseLogId.visible=false
                                administrationId.visible=false
                                deviceTextId.font.bold=true
                                deviceLogTextId.font.bold=false
                                administrationTextId.font.bold=false
                                deviceInfoId.visible=true
                                adminId.visible=false
                            }
                        }
                    }
                    Text {
                        id: deviceLogTextId
                        text: qsTr("DEVICE LOGS")
                        color: "white"
                        font.pixelSize: parent.width*0.025
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                dLogId.visible=true
                                systemLogId.visible=true
                                systemLogId.updateDat()
                                settingsDrawer.visible=false
                            }
                        }
                    }
                    Text {
                        id: administrationTextId
                        text: qsTr("ADMINISTRATION")
                        // font.bold: true
                        color: "white"
                        font.pixelSize: parent.width*0.025
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                diviseId.visible=false
                                diviseLogId.visible=false
                                administrationId.visible=true
                                deviceTextId.font.bold=false
                                deviceLogTextId.font.bold=false
                                administrationTextId.font.bold=true
                                deviceInfoId.visible=false
                                toPassword()
                                settingsDrawer.close()
                                adminId.visible=true
                            }
                        }
                    }
                }
            }
            Rectangle{
                id: diviseId
                x: parent.width*0.15
                y: parent.height*0.09
                width: parent.width*0.2
                height: parent.height*0.01
                color: "blue"
            }
            Rectangle{
                id: diviseLogId
                x: parent.width*0.37
                y: parent.height*0.09
                width: parent.width*0.2
                height: parent.height*0.01
                visible: false
                color: "blue"
            }
            Rectangle{
                id: administrationId
                x: parent.width*0.6
                y: parent.height*0.09
                width: parent.width*0.23
                height: parent.height*0.01
                visible: false
                color: "blue"
            }
            Device_Info{
                id: deviceInfoId
            }
            Device_log{
                id:deviceLogId
            }
            Admin{
                id: adminId
                visible: false
            }
        }
    }
}

