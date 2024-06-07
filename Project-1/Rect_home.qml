import QtQuick 2.15
import QtQuick.Controls 2.14
import QtQuick.Controls.Styles 1.4
Item {
    width: windowId.width*0.32
    height: windowId.height*0.2
    y: parent.height*0.1
    property int mainValue: 0
    property string typeName: "value"
    property string rectCol: "#ffffff"
    property string textCol: "#ffffff"
    property alias  sliderVal: mySlider.value
    property alias  slideId: mySlider
    property int fromVal: 0
    property int toVal: 0
    property string pUni: "cm H2O"

    Rectangle{
        width: parent.width
        height: parent.height
        color: "#757a8f"
        Text {
            x:parent.width*0.13
            y:parent.height*0.9
            text: typeName
            transform: Rotation {
                angle: 270
            }
            color: "white"
            font.bold: true
            font.pixelSize: parent.height*0.1
        }
        Text {
            x:parent.width*0.18
            y:parent.height*0.7
            text: pUni
            transform: Rotation {
                angle: 270
            }
            color: "white"
            font.pixelSize: parent.height*0.1
        }
        Rectangle{
            width: parent.width*0.5
            height: parent.height*0.7
            anchors.centerIn: parent
            color: "black"
            Rectangle{
                width: parent.width*0.95
                height: parent.height*0.9
                anchors.centerIn: parent
                color: rectCol  //"green"
                Text {
                    anchors.centerIn: parent
                    text: mainValue
                    font.pixelSize: parent.width*0.5
                    font.bold: true
                    color: textCol //"#a8fdc2"
                }
            }
        }
        Slider {
            id: mySlider
            orientation: Qt.Vertical
            from: fromVal
            value: 0
            to: toVal
            width: parent.width*0.2
            height: parent.height * 0.8
            x: parent.width * 0.8
            y: parent.height * 0.1
            visible: false
            enabled: false
            background: Rectangle {
                x: mySlider.leftPadding + mySlider.availableWidth / 2 - width / 2
                y: mySlider.topPadding
                implicitWidth: 4
                implicitHeight: 6
                width: parent.width*0.022
                height: mySlider.availableHeight
                radius: 2
                color: "white"
                Rectangle {
                    width: parent.width
                    height: mySlider.visualPosition * parent.height
                    color: "grey"
                    radius: 2
                }
            }
            handle: Rectangle {
                x: mySlider.leftPadding + mySlider.availableWidth / 2 - width / 2
                y: mySlider.topPadding + mySlider.visualPosition * (mySlider.availableHeight - height)
                implicitWidth: 26
                implicitHeight: 26
                radius: 13
                color: textCol
                border.color: "#bdbebf"
            }
        }
        Text {
            visible: mySlider.visible
            text: mySlider.value.toFixed(1)
            color: textCol
            x: parent.width*0.78
            y:parent.height*0.85
            font.pixelSize: parent.width*0.05
            font.bold: true
        }
        Text {
            visible: mySlider.visible
            text: qsTr("s")
            color: "#ffffff"
            x: parent.width*0.88
            y:parent.height*0.85
            font.pixelSize: parent.width*0.05
        }
    }

}
