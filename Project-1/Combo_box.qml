import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Item {
    anchors.fill: parent
    property alias combodata: comboBoxId.model
    property alias x_axis: comboBoxId.x
    property alias y_axis: comboBoxId.y
    property alias cwidth: comboBoxId.width
    property alias cheight: comboBoxId.height
    property bool vis: true
    property alias cur: comboBoxId.currentIndex
    ComboBox {
        id: comboBoxId
        width: parent.width * 0.15
        x: parent.width * 0.58
        y: 0
        height: parent.height
        model: ListModel {
            ListElement { text: "Auto"}
        }
        currentIndex: 0
        style: ComboBoxStyle {
            textColor: "black"
            background: Rectangle {
                color: "white"
            }
        }
        Image {
            visible: vis
            anchors.right: parent.right
            width: parent.width * 0.3
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            source: "images/arrow-removebg-preview.png"
        }
    }
}
