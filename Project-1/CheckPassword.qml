import QtQuick 2.15

Item {
    id: checkPasswordItemId
    width: windowId.width
    height: windowId.height
    signal toPassword()
    property string str: "Please check your password"
    property string fromWhere: "Password"
    signal toProfile()
    function fromProfile(){
        str="Feild can't be empty"
        fromWhere="Profile"
        checkPasswordItemId.visible=true
    }
    Rectangle{
        id: textRectId
        width: parent.width*0.4
        height: parent.height*0.2
        anchors.centerIn: parent
        color: "grey"
        radius: parent.width*0.009
        Image {
            width: parent.width*0.1
            height: parent.height*0.25
            x:parent.width*0.05
            y:parent.height*0.1
            source: "images/cation-removebg-preview.png"
        }
        Text {
            text: str
            font.pixelSize: parent.width*0.05
            x:parent.width*0.2
            y:parent.height*0.13
            color: "white"
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*.25
            color: "#51d100"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height*0.55
            radius: parent.width*0.008
            Image {
                anchors.centerIn: parent
                width: parent.width*0.4
                height: parent.height*0.8
                source: "images/tick-removebg-preview.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(fromWhere==="Profile"){
                        toProfile()
                        checkPasswordItemId.visible=false
                    }else{
                        toPassword()
                        checkPasswordItemId.visible=false
                    }
                }
            }
        }
    }
}
