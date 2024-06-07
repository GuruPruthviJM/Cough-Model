import QtQuick 2.15

Item {
    id: confirmationId
    width: windowId.width
    height: windowId.height
    visible: false
    signal toNav()
    function fromDrawer(){
        confirmationId.visible=true
        bodyId.opacity=0.2
        navId.opacity=0.2
        footerId.opacity=0.2
    }
    Rectangle{
        width: parent.width*0.4
        height: parent.height*0.2
        anchors.centerIn: parent
        color: "#444860"
        radius: parent.width*0.02
        Text {
            text: qsTr("Confirm if you want to Delete the current Profile?")
            font.pixelSize: parent.width*0.04
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            y:parent.height*0.1
        }
        Rectangle{
            width: parent.width*0.3
            height: parent.height*0.3
            color: "green"
            x:parent.width*0.1
            y:parent.height*0.6
            radius: parent.width*0.02
            Image {
                anchors.centerIn: parent
                width: parent.width*0.3
                height: parent.height*0.8
                source: "images/tick-removebg-preview.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    bodyId.enabled=true
                    navId.enabled=true
                    bodyId.opacity=1
                    navId.opacity=1
                    footerId.enabled=true
                    confirmationId.visible=false
                    systemLog.insertData(windowId.getCurrentDateTime(),'DEVICE','PROFILE_REMOVED')
                    toNav()
                }
            }
        }
        Rectangle{
            width: parent.width*0.3
            height: parent.height*0.3
            color: "#7296c4"
            x:parent.width*0.6
            y:parent.height*0.6
            radius: parent.width*0.02
            Image{
                anchors.centerIn: parent
                width: parent.width*0.3
                height: parent.height*0.7
                source: "images/output-onlinepngtools-removebg-preview.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    bodyId.enabled=true
                    navId.enabled=true
                    bodyId.opacity=1
                    navId.opacity=1
                    footerId.enabled=true
                    confirmationId.visible=false
                }
            }
        }
    }
}
