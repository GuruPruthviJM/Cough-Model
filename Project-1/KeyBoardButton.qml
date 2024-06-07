import QtQuick 2.15

Item {
    width: parent.width * 0.08
    height: parent.height
    property string charName: ""
    property string col: "#7296c4"
    Rectangle{
        width: parent.width
        height: parent.height
        color: col
        radius: parent.width * 0.05
        Text {
            text: charName
            anchors.centerIn: parent
            font.pixelSize: parent.width * 0.3
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                profileTextId.text += charName
            }
        }
    }
}


