import QtQuick 2.15

Item {
    id: pleaseItemId
    width: windowId.width
    height: windowId.height
    function fromNav(){
        timer.start()
        pleaseItemId.visible=true
        bodyId.enabled=false
        navId.enabled=false
        footerId.enabled=false
        bodyId.opacity=0.2
        navId.opacity=0.2
    }

    Rectangle{
        width: parent.width*0.2
        height: parent.height*0.1
        anchors.centerIn: parent
        radius: parent.width*0.02
        color: "#8992a5"
        Text {
            text: qsTr("Please Wait...")
            anchors.centerIn: parent
            font.pixelSize: parent.width*0.1
            color: "white"
        }
    }
    Timer{
        id: timer
        interval: 2000
        running: true
        onTriggered: {
            pleaseItemId.visible=false
            navId.opacity=1
            footerId.opacity=1
            bodyId.opacity=1
            navId.enabled=true
            footerId.enabled=true
            bodyId.enabled=true
        }
    }
}
