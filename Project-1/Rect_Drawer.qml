import QtQuick 2.15

Item {
    width: windowId.width*0.38
    height: windowId.height*0.12
    x:parent.width*0.1
    property string g: "Insp. Trigger\nSesitivity"
    property var textValue: 0
    property real textSize: parent.width*0.08
    property bool rectColorFlag: true
    Rectangle{
        id: rectId
        width: parent.width*0.65
        height: parent.height
        // x:parent.width*0.08
        color: (rectColorFlag)?"#72809d":"#57ab2e"
        Text {
            x: parent.width*0.25
            font.bold: true
            text: g
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: parent.width*0.08
            color: "white"
        }
    }
    Rectangle{
        id: rectTextId
        width: parent.width*0.35
        height: parent.height
        anchors.left: rectId.right
        color: (rectColorFlag)?"black":"#2cef00"
        Text {
            id: textId
            anchors.centerIn: parent
            text: textValue
            font.pixelSize: textSize
            font.bold: true
            color: (rectColorFlag)?"#2ae4f2":"#f4fff5"
        }
    }

}
