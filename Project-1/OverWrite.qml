import QtQuick 2.15

Item {
    width: windowId.width
    height: windowId.height
    property string userName: ''
    property var value: []
    function fromProfile(name,val){
        userName=name
        value=val
    }
    Rectangle{
        width: parent.width*0.4
        height: parent.height*0.25
        anchors.centerIn: parent
        radius: parent.width*0.025
        color: "#8992a5"
        Text {
            x: parent.width*0.05
            y:parent.height*0.05
            text: qsTr(" Do you want to overwrite the existing\n profile?")
            font.pixelSize: parent.width*0.05
            color: "white"
        }
        Rectangle{
            width: parent.width*0.35
            height: parent.height*0.3
            color: "green"
            x:parent.width*0.08
            y:parent.height*0.6
            radius: parent.width*0.02
            Image {
                anchors.centerIn: parent
                width: parent.width*0.2
                height: parent.height*0.8
                source: "images/tick-removebg-preview.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    overId.visible=false
                    bodyId.opacity=1
                    navId.opacity=1
                    footerId.opacity=1
                    user.updateUserInfo(userName,value)
                }
            }
        }
        Rectangle{
            width: parent.width*0.35
            height: parent.height*0.3
            color: "#7296c4"
            x:parent.width*0.6
            y:parent.height*0.6
            radius: parent.width*0.02
            Image {
                anchors.centerIn: parent
                width: parent.width*0.2
                height: parent.height*0.7
                source: "images/output-onlinepngtools-removebg-preview.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    bodyId.opacity=1;
                    navId.opacity=1;
                    footerId.opacity=1;
                    overId.visible=false
                    vtId.fromFooter();
                }
            }
        }
    }
}
