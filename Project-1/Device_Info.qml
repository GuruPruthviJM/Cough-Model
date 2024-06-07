import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent
    Rectangle{
        width: parent.width
        height: parent.height*0.9
        anchors.bottom: parent.bottom
        color: "black"
        Text {
            id: brightnessTextId
            text: "Brightness"
            font.pixelSize: parent.width*0.025
            x: parent.width*0.04
            y: parent.height*0.055
            font.bold: true
            color: "white"
        }
        Combo_box{
            id:brightnessComboId
            cwidth: parent.width*0.21
            cheight: parent.height*0.05
            x_axis: parent.width*0.25
            y_axis: parent.height*0.05
            combodata: ListModel{
                ListElement { text: "100%" }
                ListElement { text: "75%" }
                ListElement { text: "50%" }
                ListElement { text: "25%" }
            }
        }
        Text {
            text: qsTr("Serial Number:")
            font.pixelSize: parent.width*0.025
            color: "white"
            x: parent.width*0.50
            y:parent.height*0.055
        }
        Text {
            text: qsTr("CNB19A012")
            font.pixelSize: parent.width*0.025
            font.bold: true
            color: "white"
            x: parent.width*0.75
            y:parent.height*0.055
        }

        Text {
            text: "Language"
            font.pixelSize: parent.width*0.025
            x: parent.width*0.04
            y: parent.height*0.15
            font.bold: true
            color: "white"
        }
        Combo_box{
            id:languageComboId
            cwidth: parent.width*0.21
            cheight: parent.height*0.05
            x_axis: parent.width*0.25
            y_axis: parent.height*0.148
            combodata: ListModel{
                ListElement { text: "English" }
                ListElement { text: "Kannada" }
                ListElement { text: "Telugu" }
                ListElement { text: "Hindi" }
            }
        }
        Text {
            text: qsTr("FW Ver MCB/Stepper:")
            font.pixelSize: parent.width*0.025
            color: "white"
            x: parent.width*0.50
            y:parent.height*0.15
        }
        Text {
            text: qsTr("1.95.5/1.20.0")
            font.pixelSize: parent.width*0.025
            font.bold: true
            color: "white"
            x: parent.width*0.75
            y:parent.height*0.15
        }
        Text {
            text: "Pressure Units"
            font.pixelSize: parent.width*0.025
            x: parent.width*0.04
            y: parent.height*0.265
            font.bold: true
            color: "white"
        }
        Combo_box{
            id:pressureComboId
            cwidth: parent.width*0.21
            cheight: parent.height*0.05
            x_axis: parent.width*0.25
            y_axis: parent.height*0.263
            combodata: ListModel{
                ListElement { text: "cm H20" }
                ListElement { text: "hPa" }
                ListElement { text: "mbar" }
            }
        }
        Text {
            text: qsTr("Software Version:")
            font.pixelSize: parent.width*0.025
            color: "white"
            x: parent.width*0.50
            y:parent.height*0.265
        }
        Text {
            text: qsTr("1.14.0")
            font.pixelSize: parent.width*0.025
            font.bold: true
            color: "white"
            x: parent.width*0.75
            y:parent.height*0.265
        }
        Text {
            text: "Time Zone"
            font.pixelSize: parent.width*0.025
            x: parent.width*0.04
            y: parent.height*0.375
            font.bold: true
            color: "white"
        }
        Combo_box{
            id:timeComboId
            cwidth: parent.width*0.21
            cheight: parent.height*0.05
            x_axis: parent.width*0.25
            y_axis: parent.height*0.373
            combodata: ListModel{
                ListElement { text: "Asia/India" }
                ListElement { text: "Asia/China" }
                ListElement { text: "Asia/Pakisthan" }
            }
        }
        Text {
            text: qsTr("Hour Meter Reading:")
            font.pixelSize: parent.width*0.025
            color: "white"
            x: parent.width*0.50
            y:parent.height*0.375
        }
        Text {
            text: qsTr("00:33:14")
            font.pixelSize: parent.width*0.025
            font.bold: true
            color: "white"
            x: parent.width*0.75
            y:parent.height*0.375
        }
        Rectangle{
            width: parent.width
            height: parent.height*0.005
            anchors.centerIn: parent
            color: "white"
        }
        Text {
            text: qsTr("Rotate Screen")
            x: parent.width*0.12
            y: parent.height*0.54
            font.pixelSize: parent.width*0.02
            font.bold: true
            color: "white"
        }
        Tooglebar {
            id: rotateToggle
            x: parent.width*0.28
            y: parent.height*0.535
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    windowId.rotateScreen()
                    onToggle.visible=(onToggle.visible)?false:true
                }
            }
        }
        Text {
            text: qsTr("Mute Audio")
            x: parent.width*0.52
            y: parent.height*0.54
            font.pixelSize: parent.width*0.02
            font.bold: true
            color: "white"
        }
        Tooglebar {
            x: parent.width*0.66
            y: parent.height*0.535
        }
        Image {
            id: onToggle
            visible: false
            source: "images/toogle.png"
            anchors.fill: rotateToggle
            x:parent.width*0.12
            y:parent.height*0.54
        }
    }
}
