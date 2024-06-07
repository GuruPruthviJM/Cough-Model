import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: windowId.width * 0.05
    height: windowId.height * 0.035
    x: parent.width*0.5
    y:parent.height*0.5
    property bool darkMode: false

    Rectangle {
        id: toggleRectID
        width: parent.width*0.8
        height: parent.height
        radius: parent.width * 0.25
        color: darkMode ? "green" : "#ffffff"
    }

    Rectangle {
        id: toggleCircleId
        width: parent.width * 0.4
        height: parent.height
        radius: toggleCircleId.width * 0.5
        border.width: parent.width * 0.025
        color: darkMode ? "green" : "#ffffff"
        border.color: darkMode ? "white" : "green"
        Behavior on x {
            NumberAnimation {
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                toggleCircleId.x = toggleCircleId.x === 0 ? toggleRectID.width - toggleCircleId.width : 0;
                darkMode = !darkMode;
            }
        }
    }
    MouseArea {
        anchors.fill: toggleRectID
        onClicked: {
            toggleCircleId.x = toggleCircleId.x === 0 ? toggleRectID.width - toggleCircleId.width : 0;
            darkMode = !darkMode;
        }
    }
}
