import QtQuick 2.15

Item {
    id: infoId
    width: windowId.width
    height: windowId.height
    property int countCycle: 0
    property string type1: "Auto"
    property string formattedDateTime: getCurrentDateTime()

    function getCurrentDateTime() {
        var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        var days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        var currentDate = new Date();
        var dayOfWeek = days[currentDate.getDay()];
        var month = months[currentDate.getMonth()];
        var day = currentDate.getDate();
        var year = currentDate.getFullYear();
        var hours = currentDate.getHours();
        var minutes = currentDate.getMinutes();
        var ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12;
        minutes = minutes < 10 ? '0' + minutes : minutes;
        return day + ' ' + month + ' ' + year + ' at ' + hours + ':' + minutes + ' ' + ampm;
    }

    Rectangle{
        id: yellowRectId
        width: parent.width*0.85
        height: parent.height*0.1
        y:parent.height*0.4
        color: "#f8cc00"
        Image {
            width: parent.width*0.07
            height: parent.height*0.7
            anchors.verticalCenter: parent.verticalCenter
            source: "images/close-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    infoId.visible=false
                    footerId.enabled=true
                    bodyId.enabled=true
                    navId.enabled=true
                    detailedId.visible=false
                }
            }
        }
        Image {
            width: parent.width*0.08
            height: parent.height*0.7
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            source: "images/info-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(detailedId.visible){
                        detailedId.visible=false
                    }else{
                        detailedId.visible=true
                    }
                }
            }
        }
        Text {
            text: qsTr("Therapy Complete")
            anchors.centerIn: parent
            font.pixelSize: parent.width*0.025
        }
    }
    Rectangle{
        id: detailedId
        width: parent.width*0.85
        height: parent.height*0.11
        visible: false
        anchors.top: yellowRectId.bottom
        color: "white"
        Text {
            y:parent.width*0.01
            text: qsTr("Last therapy completed on "+formattedDateTime+"\nMode: "+type1+"\tNumber of Completed Cycles: "+countCycle)
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: parent.width*0.025
        }
    }
}
