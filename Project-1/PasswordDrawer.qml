import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item {
    id: passwordItemId
    width: parent.width
    height: parent.height
    visible: false
    property string eyeName: "eye-close"
    signal toDrawer()
    signal toCheck()
    signal toNav()
    signal toNavCancel()
    property string fromWhere: ""
    property string orginalPassword: "123"
    function fromCheck(){
        drawer.visible=true
        passwordItemId.visible=true
        textRectId.visible=true
        animator.running=true
        bodyId.enabled=false
        navId.enabled=false
        footerId.enabled=false
        bodyId.opacity=0.2
        navId.opacity=0.2
        passwordTextId.text=""
    }
    function fromNavigation(){
        drawer.visible=true
        passwordItemId.visible=true
        textRectId.visible=true
        animator.running=true
        bodyId.enabled=false
        navId.enabled=false
        footerId.enabled=false
        bodyId.opacity=0.2
        navId.opacity=0.2
        fromWhere="Navigation"
        passwordTextId.text=""
    }
    function fromDrawer(){
        drawer.visible=true
        passwordItemId.visible=true
        textRectId.visible=true
        animator.running=true
        bodyId.enabled=false
        navId.enabled=false
        footerId.enabled=false
        bodyId.opacity=0.2
        navId.opacity=0.2
        fromWhere="Drawer"
        passwordTextId.text=""
    }

    Rectangle{
        id: textRectId
        width: parent.width*0.4
        height: parent.height*0.3
        anchors.horizontalCenter: parent.horizontalCenter
        color: "grey"
        radius: parent.width*0.009
        y:parent.height*0.08
        Text {
            text: qsTr("Enter Password to Lock")
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.pixelSize: parent.width*0.05
            font.bold: true
            y:parent.height*0.05
        }
        TextField{
            id: passwordTextId
            width: parent.width*0.8
            height: parent.height*0.2
            x: parent.width*0.1
            y:parent.height*0.3
            echoMode: TextField.Password
            Image {
                width: parent.width*0.2
                height: parent.height
                anchors.right: parent.right
                anchors.rightMargin: parent.width*0.02
                source: "images/"+eyeName+"-removebg-preview.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        eyeName=(eyeName==="eye-close")?"eye":"eye-close"
                        passwordTextId.echoMode=(passwordTextId.echoMode===TextField.Password)?TextField.Normal:TextField.Password
                    }
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*0.15
            color: "green"
            x:parent.width*0.1
            y:parent.height*0.7
            radius: parent.width*0.02
            Image {
                anchors.centerIn: parent
                width: parent.width*0.3
                height: parent.height*0.8
                source: "images/tick-removebg-preview.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(passwordTextId.text===orginalPassword){
                        textRectId.visible=false
                        animatorClose.running=true
                        animator.running=false
                        navId.enabled=true
                        bodyId.opacity=1
                        navId.opacity=1
                        footerId.enabled=true
                        footerId.opacity=1
                        if(fromWhere==="Drawer"){
                            bodyId.enabled=true
                            footerId.enabled=true
                            toDrawer()
                        }else{
                            console.log("g")
                            toNav()
                        }
                    }else{
                        toCheck()
                        animatorClose.running=true
                        textRectId.visible=false
                        animator.running=false
                    }
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*0.15
            color: "#7296c4"
            x:parent.width*0.7
            y:parent.height*0.7
            radius: parent.width*0.02
            Image {
                anchors.centerIn: parent
                width: parent.width*0.3
                height: parent.height*0.7
                source: "images/output-onlinepngtools-removebg-preview.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(fromWhere==="Drawer"){
                        textRectId.visible=false
                        animatorClose.running=true
                        animator.running=false
                        bodyId.enabled=true
                        navId.enabled=true
                        bodyId.opacity=1
                        navId.opacity=1
                        footerId.enabled=true
                        footerId.opacity=1
                    }else{
                        bodyId.opacity=1
                        navId.opacity=1
                        footerId.enabled=true
                        footerId.opacity=1
                        textRectId.visible=false
                        animatorClose.running=true
                        animator.running=false
                        navId.enabled=true
                        toNavCancel()
                    }
                }
            }
        }
    }
    Rectangle {
        id: drawer
        height: parent.height*0.6
        width: parent.width
        color: "black"
        anchors.bottom: parent.bottom
        Grid {
            columns: 3
            spacing: parent.width*0.01
            width: parent.width
            height: parent.height
            x: parent.width*0.337
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.02
            ListModel {
                id: keyboardModel
                ListElement { key: "7" }
                ListElement { key: "8" }
                ListElement { key: "9" }
                ListElement { key: "4" }
                ListElement { key: "5" }
                ListElement { key: "6" }
                ListElement { key: "1" }
                ListElement { key: "2" }
                ListElement { key: "3" }
                ListElement { key: "." }
                ListElement { key: "0" }
            }
            Repeater {
                model: keyboardModel
                Rectangle{
                    width: parent.width*0.1
                    height: parent.height*0.2
                    color: "#7296c4"
                    radius: parent.width*0.005
                    Text {
                        text: model.key
                        anchors.centerIn: parent
                        font.pixelSize: parent.width*0.2
                        color: "white"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            passwordTextId.text += model.key
                        }
                    }
                }
            }
            Rectangle{
                width: parent.width*0.1
                height: parent.height*0.2
                color: "#7296c4"
                radius: parent.width*0.005
                Image {
                    anchors.centerIn: parent
                    width: parent.width*0.3
                    height: parent.height*0.6
                    source: "images/output-onlinepngtools (1).png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        passwordTextId.text=""
                    }
                }
            }
        }
        YAnimator {
            id: animator
            target: drawer;
            from: drawer.height+windowId.height;
            to: drawer.height;
            duration: 300
            running: true
        }
        YAnimator {
            id: animatorClose
            target: drawer;
            from: drawer.height;
            to: drawer.height+windowId.height;
            duration: 300
            running: true
            onFinished: {
                drawer.visible=false
            }
        }
    }
}
