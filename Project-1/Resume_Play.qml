import QtQuick 2.15

Item {
    id: resumeItemId
    width: windowId.width
    height: windowId.height
    property int timeLeft: 5 * 60
    signal toPopUp()
    signal toFooter()
    signal toFooterEnd()
    function fromFooter(){
        timer.running=true
        timeDisplay.text="05:00"
        timeLeft=5*60
    }

    Text {
        text: qsTr("Therapy Paused")
        font.pixelSize: parent.width*0.05
        font.bold: true
        x:parent.width*0.3
        y:parent.height*0.08
        color: "white"
    }
    Text {
        text: qsTr("Therapy ends automatically in")
        font.pixelSize: parent.width*0.03
        font.bold: true
        x:parent.width*0.28
        y:parent.height*0.4
        color: "white"
    }
    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: false
        onTriggered: {
            if (timeLeft > 0) {
                timeLeft -= 1;
                var minutes = Math.floor(timeLeft / 60);
                var seconds = timeLeft % 60;
                timeDisplay.text = ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2);
            } else {
                timer.stop();
                resumeItemId.visible=false
                toPopUp()
                toFooterEnd()
                timer.stop()
            }
        }
    }
    Text {
        id: timeDisplay
        font.pixelSize: parent.width*0.03
        anchors.horizontalCenter: parent.horizontalCenter
        y:parent.height*0.5
        text: "05:00"
        color: "white"
        font.bold: true
    }
    Rectangle{
        width: parent.width*0.2
        height: parent.height*0.08
        radius: parent.width*0.01
        x:parent.width*0.22
        y:parent.height*0.62
        color: "#2afe46"
        Text {
            text: qsTr("RESUME THERAPY")
            font.pixelSize: parent.width*0.08
            anchors.centerIn: parent
            font.bold: true
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                resumeItemId.visible=false
                footerId.opacity=1
                footerId.enabled=true
                footerId.image="pause"
                timeLeft=5*60
                timeDisplay.text="05:00"
                toFooter()
                systemLog.insertData(windowId.getCurrentDateTime(),'THERAPY', 'THERAPY_RESUME')
                timer.stop()
            }
        }
    }
    Rectangle{
        width: parent.width*0.2
        height: parent.height*0.08
        radius: parent.width*0.01
        x:parent.width*0.57
        y:parent.height*0.62
        color: "red"
        Text {
            text: qsTr("END THERAPY")
            font.pixelSize: parent.width*0.08
            anchors.centerIn: parent
            font.bold: true
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                resumeItemId.visible=false
                systemLog.insertData(windowId.getCurrentDateTime(),'THERAPY', 'THERAPY_TERMINATE')
                toPopUp()
                toFooterEnd()
                timer.stop()
            }
        }
    }
}
