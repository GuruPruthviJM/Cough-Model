import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
Item {
    width: windowId.width
    height: windowId.height
    // property bool autoFlag: false
    // property bool mannualFlag: false
    signal toPasswordDrawer()
    signal toDateTime()
    signal toProfile(string g)
    signal toFooter()
    signal toDrawer(int index)
    signal toPlease()
    signal toBody()
    signal toPopUp()
    property string profileName: ""
    property int inx: 0
    property bool autoOrManual: autoBlueId.visible
    property bool enabling: true 
    property string selectedName: ''
    function updateDat(){
        autoComboBox.combodata=user.getUserNamesAuto()
        manualComboBox.combodata=user.getUserNamesManual()
        autoComboBox.cur=autoComboBox.combodata.length-1
        manualComboBox.cur=manualComboBox.combodata.length-1
    }
    onSelectedNameChanged: {
        bodyId.retriveData(selectedName)
        footerId.retriveData(selectedName)
    }
    function fromPassword(){
        enabling=!enabling
        bodyId.enabled=enabling
        footerId.enabled=enabling
        personImageId.enabled=enabling
        autoRectId.enabled=enabling
        mannualBlueId.enabled=enabling
        autoComboBox.enabled=enabling
        manualComboBox.enabled=enabling
        dateRectId.enabled=enabling
        mannualRectId.enabled=enabling
    }
    function fromPasswordCancel(){
        bodyId.enabled=enabling
        footerId.enabled=enabling
        personImageId.enabled=enabling
        autoRectId.enabled=enabling
        mannualBlueId.enabled=enabling
        autoComboBox.enabled=enabling
        manualComboBox.enabled=enabling
        dateRectId.enabled=enabling
        mannualRectId.enabled=enabling
    }
    function fromProfile(pName,fromWhere){
        if(fromWhere==="Navigation"){
            profileNameId.text=pName
        }else{
        }
    }
    function fromDrawer(){
        console.log(selectedName)
        user.deleteUserInfo(selectedName)
        updateDat()
        if(autoBlueId.visible){
            autoComboBox.cur=0
        }else{
            manualComboBox.cur=0
        }
    }
    //left images
    Rectangle{
        width: parent.width
        height: parent.height*0.1
        color: "#57579f"
    }
    Rectangle{
        width: parent.width
        height: parent.height*0.09
        color: "black"
        Image {
            id:lockImageId
            width: parent.width*0.04
            height: parent.height*0.6
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.01
            anchors.verticalCenter: parent.verticalCenter
            source: "images/lock-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    toPasswordDrawer()
                }
            }
        }
        Image {
            id:personImageId
            anchors.left: lockImageId.right
            anchors.leftMargin: parent.width*0.02
            width: parent.width*0.07
            height: parent.height*0.65
            anchors.verticalCenter: parent.verticalCenter
            source: "images/person.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    toProfile(profileNameId.text)
                }
            }
        }
        Text {
            id: profileNameId
            text: profileName
            color: "white"
            x:parent.width*0.15
            anchors.verticalCenter: parent.verticalCenter
        }


        //right images
        Image {
            id:wifiImageId
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.13
            width: parent.width*0.03
            height: parent.height*0.7
            anchors.verticalCenter: parent.verticalCenter
            source: "images/wifi-removebg-preview.png"
        }
        Image {
            id:bluetoothImageId
            anchors.right: wifiImageId.left
            anchors.rightMargin: -parent.width*0.004
            width: parent.width*0.07
            height: parent.height*0.7
            anchors.verticalCenter: parent.verticalCenter
            source: "images/bluetooth-removebg-preview.png"
        }
        Image {
            id:batteryImageId
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.74
            width: parent.width*0.05
            height: parent.height*0.7
            anchors.verticalCenter: parent.verticalCenter
            source: "images/battery-removebg-preview (1).png"
        }
        Rectangle{
            id: dateRectId
            width: parent.width*0.1
            height: parent.height
            anchors.right: parent.right
            color: "black"
            Text {
                id: currentDateText
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: parent.width*0.1
                anchors.bottomMargin: parent.height*0.01
                font.pixelSize: parent.width*0.2
                color: "white"
                font.bold: true
                text: {
                    var currentDate = new Date();
                    var day = currentDate.getDate();
                    var month = currentDate.getMonth() + 1;
                    var year = currentDate.getFullYear();
                    return day + "-" + month + "-" + year;
                }
            }
            Text {
                id: currentTimeText
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: parent.width * 0.1
                anchors.topMargin: parent.height * 0.1
                font.pixelSize: parent.width * 0.2
                color: "white"
                font.bold: true
                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: {
                        var now = new Date();
                        var hours = now.getHours();
                        var minutes = now.getMinutes();
                        var seconds = now.getSeconds();
                        var meridiem = hours >= 12 ? "PM" : "AM";
                        hours = hours % 12;
                        hours = hours ? hours : 12;
                        currentTimeText.text = ("0" + hours).slice(-2) + ":" + ("0" + minutes).slice(-2) + " " + meridiem;
                    }
                }
                Component.onCompleted: {
                    var now = new Date();
                    var hours = now.getHours();
                    var minutes = now.getMinutes();
                    var seconds = now.getSeconds();
                    var meridiem = hours >= 12 ? "PM" : "AM";
                    hours = hours % 12;
                    hours = hours ? hours : 12;
                    currentTimeText.text = ("0" + hours).slice(-2) + ":" + ("0" + minutes).slice(-2) + " " + meridiem;
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    toDateTime()
                }
            }
        }

        Combo_box{
            id:autoComboBox
            combodata:  user.getUserNamesAuto()
            Component.onCompleted: {
                autoComboBox.combodata=user.getUserNamesAuto()
            }
            vis: false
            onCurChanged: {
                var currentIndex = autoComboBox.cur;
                autoTextId.text = autoComboBox.combodata[currentIndex]+"\t▼";
                toDrawer(currentIndex)
                // toFooter()
                selectedName=autoComboBox.combodata[currentIndex]
                toPlease()
            }
        }

        Combo_box{
            id: manualComboBox
            visible: false
            x_axis: parent.width*0.4
            vis: false
            combodata:  user.getUserNamesManual()
            Component.onCompleted: {
                manualComboBox.combodata=user.getUserNamesManual()
            }
            onCurChanged: {
                var currentIndex = manualComboBox.cur;
                manualTextId.text = manualComboBox.combodata[currentIndex]+"\t▼";
                toDrawer(currentIndex)
                selectedName=manualComboBox.combodata[currentIndex]
                toPlease()
            }
        }

        Rectangle{
            id: autoRectId
            width: parent.width*0.15
            height: parent.height
            x: parent.width*0.58
            visible: false
            enabled: false
            color: "black"
            Text {
                id: autoTextId
                text: qsTr(autoComboBox.combodata[autoComboBox.cur].text+"\t▼")
                Component.onCompleted: {
                    autoTextId.text=user.getUserNamesAuto()[0]+"\t▼"
                }
                anchors.centerIn: parent
                font.pixelSize: parent.width*0.1
                color: "white"
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mannualRectId.visible=true
                    mannualRectId.enabled=true
                    autoRectId.visible=false
                    autoRectId.enabled=false
                    autoBlueId.visible=true
                    mannualBlueId.visible=false
                    manualComboBox.visible=false
                    autoComboBox.visible=true
                    toPopUp()
                    inx=autoComboBox.cur
                    toBody()
                    toDrawer(inx)
                    toFooter()
                    bodyId.retriveData(autoComboBox.combodata[autoComboBox.cur])
                    footerId.retriveData(autoComboBox.combodata[autoComboBox.cur])
                }
            }
        }
        Rectangle{
            id: mannualRectId
            width: parent.width*0.15
            height: parent.height
            x: parent.width*0.4
            // visible: false
            color: "black"
            Text {
                id: manualTextId
                // text: qsTr(manualComboBox.combodata[0].text+"\t▼")
                Component.onCompleted: {
                    manualTextId.text=user.getUserNamesManual()[manualComboBox.cur]+"\t▼"
                }
                anchors.centerIn: parent
                font.pixelSize: parent.width*0.1
                color: "white"
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mannualRectId.visible=false
                    mannualRectId.enabled=false
                    autoRectId.visible=true
                    autoRectId.enabled=true
                    autoBlueId.visible=false
                    mannualBlueId.visible=true
                    manualComboBox.visible=true
                    toPopUp()
                    autoComboBox.visible=false
                    inx=manualComboBox.cur
                    toBody()
                    toDrawer(inx)
                    toFooter()
                    bodyId.retriveData(manualComboBox.combodata[manualComboBox.cur])
                    footerId.retriveData(manualComboBox.combodata[manualComboBox.cur])
                }
            }
        }
    }
    Rectangle{
        id: autoBlueId
        width: autoRectId.width
        height: parent.height*0.01
        y:parent.height*0.09
        x:autoRectId.x
        color: "blue"
        visible: true
        onVisibleChanged: {
            autoOrManual=autoBlueId.visible
        }
    }
    Rectangle{
        id: mannualBlueId
        width: mannualRectId.width
        height: parent.height*0.01
        y:parent.height*0.09
        x:mannualRectId.x
        color: "blue"
        visible: false
    }
}
