import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item {
    width: windowId.width
    height: windowId.height
    property bool caps: false
    property bool numeric: false
    property string fromWhere: "value"
    property int maxLen: 13
    property int  len: 0
    signal toCheck()
    signal toPlease()
    property var userData: []
    property string userName: ''
    signal toOverWrite(string name,var val)
    function fromCheck(){
        textRectId.visible=true
        drawer.visible=true
        animator.running=true
        bodyId.opacity=0.2
        navId.opacity=0.2
        navId.enabled=false
        bodyId.enabled=false
        footerId.enabled=false
        if(fromWhere==="Navigation"){
            lengthId.visible=false
        }else{
            lengthId.visible=true
        }
    }

    function fromNavigation(pName){
        textRectId.visible=true
        fromWhere="Navigation"
        drawer.visible=true
        animator.running=true
        bodyId.opacity=0.2
        navId.opacity=0.2
        navId.enabled=false
        bodyId.enabled=false
        footerId.enabled=false
        profileTextId.text=pName
        lengthId.visible=false
    }

    function fromFooter(){
        fromWhere="Footer"
        textRectId.visible=true
        drawer.visible=true
        animator.running=true
        bodyId.opacity=0.2
        navId.opacity=0.2
        navId.enabled=false
        bodyId.enabled=false
        profileTextId.text=""
        lengthId.visible=true
        userData=bodyId.retrivingDataToProfile()
        userData.push(footerId.mVal)
        userData.push(footerId.greenStratPointerWidth)
        userData.push(footerId.greenPointerHeight)
        userData.push(footerId.greenEndPointerWidth)
        userData.push(footerId.yellowStratPointerWidth)
        userData.push(footerId.yellowPointerHeight)
        userData.push(footerId.yellowEndPointerWidth)
        userData.push(footerId.blueStratPointerWidth)
        userData.push(footerId.bluePointerHeight)
        userData.push(footerId.blueEndPointerWidth)
    }

    signal toNavigation(string pName, string toWhere)

    Rectangle{
        id: textRectId
        width: parent.width*0.4
        height: parent.height*0.3
        anchors.horizontalCenter: parent.horizontalCenter
        color: "grey"
        radius: parent.width*0.009
        y:parent.height*0.08
        visible: false
        Text{
            text: qsTr("Profile Name")
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.pixelSize: parent.width*0.05
            font.bold: true
            y:parent.height*0.05
        }
        TextField{
            id: profileTextId
            width: parent.width*0.8
            height: parent.height*0.2
            anchors.horizontalCenter: parent.horizontalCenter
            y:parent.height*0.3
            maximumLength: 13
            onTextChanged: {
                len=profileTextId.text.length
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
                    if(fromWhere!="Navigation"){
                        if(len>0){
                            toNavigation(profileTextId.text,fromWhere)
                            textRectId.visible=false
                            animatorClose.running=true
                            animator.running=false
                            bodyId.enabled=true
                            navId.enabled=true
                            bodyId.opacity=1
                            navId.opacity=1
                            maxLen=14
                            footerId.enabled=true
                            systemLog.insertData(windowId.getCurrentDateTime(),'DEVICE','PROFILE_SAVED')
                            console.log(userData)
                            if(navId.autoOrManual){
                                userName='A-'+profileTextId.text
                            }else{
                                userName='M-'+profileTextId.text
                            }
                            if(user.isUserNamePresent(userName)){
                                console.log("h")
                                overId.visible=true
                                toOverWrite(userName,userData)
                                textRectId.visible=false
                                animatorClose.running=true
                                animator.running=false
                            }else{
                                toPlease()
                                user.insertUserInfo(userName,userData)
                                navId.updateDat()
                            }
                        }else{
                            toCheck()
                            textRectId.visible=false
                            animatorClose.running=true
                            animator.running=false
                        }
                    }else{
                        toNavigation(profileTextId.text,fromWhere)
                        textRectId.visible=false
                        animatorClose.running=true
                        animator.running=false
                        bodyId.enabled=true
                        navId.enabled=true
                        bodyId.opacity=1
                        navId.opacity=1
                        maxLen=14
                        footerId.enabled=true
                    }
                }
            }
        }
        Text {
            id: lengthId
            text: qsTr("Remaining Characters: "+(maxLen-len))
            font.pixelSize: parent.width*0.05
            color: "red"
            anchors.left: profileTextId.left
            y:parent.height*0.5
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
                    textRectId.visible=false
                    animatorClose.running=true
                    animator.running=false
                    bodyId.enabled=true
                    navId.enabled=true
                    bodyId.opacity=1
                    navId.opacity=1
                    footerId.enabled=true
                }
            }
        }
    }
    Rectangle {
        id: drawer
        height: parent.height*0.6
        width: parent.width
        color: "black"
        visible: false
        anchors.bottom: parent.bottom
        Item{
            id: alphaKeysId
            anchors.fill: parent
            visible: true
            Row{
                id:firstRowId
                width: parent.width
                height: parent.height*0.15
                spacing: parent.width*0.01
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.1
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.02
                KeyBoardButton{
                    charName: (caps)?"Q":"q"
                }
                KeyBoardButton{
                    charName: (caps)?"W":"w"
                }
                KeyBoardButton{
                    charName: (caps)?"E":"e"
                }
                KeyBoardButton{
                    charName: (caps)?"R":"r"
                }
                KeyBoardButton{
                    charName: (caps)?"T":"t"
                }
                KeyBoardButton{
                    charName: (caps)?"Y":"y"
                }
                KeyBoardButton{
                    charName: (caps)?"U":"u"
                }
                KeyBoardButton{
                    charName: (caps)?"I":"i"
                }
                KeyBoardButton{
                    charName: (caps)?"O":"o"
                }
                KeyBoardButton{
                    charName: (caps)?"P":"p"
                }
                KeyBoardButton {
                    Image {
                        anchors.centerIn: parent
                        width: parent.width * 0.6
                        height: parent.height * 0.6
                        source: "images/output-onlinepngtools (1).png"
                    }
                    col: "#8992a5"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (profileTextId.text.length > 0) {
                                profileTextId.text = profileTextId.text.slice(0, -1)
                            }
                        }
                    }
                }

            }
            Row{
                id:secountdRowId
                width: parent.width
                height: parent.height*0.15
                spacing: parent.width*0.01
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.29
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.05
                KeyBoardButton{
                    charName: (caps)?"A":"a"
                }
                KeyBoardButton{
                    charName: (caps)?"S":"s"
                }
                KeyBoardButton{
                    charName: (caps)?"D":"d"
                }
                KeyBoardButton{
                    charName: (caps)?"F":"f"
                }
                KeyBoardButton{
                    charName: (caps)?"G":"g"
                }
                KeyBoardButton{
                    charName: (caps)?"H":"h"
                }
                KeyBoardButton{
                    charName: (caps)?"J":"j"
                }
                KeyBoardButton{
                    charName: (caps)?"K":"k"
                }
                KeyBoardButton{
                    charName: (caps)?"L":"l"
                }
                KeyBoardButton{
                    width: parent.width*0.1
                    Image {
                        anchors.centerIn: parent
                        width: parent.width*0.6
                        height: parent.height*0.6
                        source: "images/enterKey-removebg-preview.png"
                    }
                    col: "#8992a5"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            passwordTextId.text += "\n"
                        }
                    }
                }
            }
            Row{
                id:thirdRowId
                width: parent.width
                height: parent.height*0.15
                spacing: parent.width*0.01
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.49
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.02
                KeyBoardButton{
                    col: "#8992a5"
                    Image {
                        anchors.centerIn: parent
                        width: parent.width*0.4
                        height: parent.height*0.6
                        source: "images/output-onlinepngtools (2).png"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            caps=(caps)?false:true
                        }
                    }
                }
                KeyBoardButton{
                    charName: (caps)?"Z":"z"
                }
                KeyBoardButton{
                    charName: (caps)?"X":"x"
                }
                KeyBoardButton{
                    charName: (caps)?"C":"c"
                }
                KeyBoardButton{
                    charName: (caps)?"J":"v"
                }
                KeyBoardButton{
                    charName: (caps)?"B":"b"
                }
                KeyBoardButton{
                    charName: (caps)?"N":"n"
                }
                KeyBoardButton{
                    charName: (caps)?"M":"m"
                }
                KeyBoardButton{
                    charName: ","
                }
                KeyBoardButton{
                    charName: "."
                }
                KeyBoardButton{
                    col: "#8992a5"
                    Image {
                        anchors.centerIn: parent
                        width: parent.width*0.4
                        height: parent.height*0.6
                        source: "images/output-onlinepngtools (2).png"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            caps=(caps)?false:true
                        }
                    }
                }
            }
            Row{
                id:fourthRowId
                width: parent.width
                height: parent.height*0.15
                spacing: parent.width*0.01
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.7
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.02
                KeyBoardButton{
                    charName: "&123"
                    col: "#8992a5"
                    width: parent.width*0.08
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            alphaKeysId.visible=false
                            numberKeysId.visible=true
                        }
                    }
                }
                KeyBoardButton{
                    charName: "@"
                }
                KeyBoardButton{
                    charName: " "
                    width: parent.width*0.4
                }
                KeyBoardButton{
                    charName: "'"
                }
                KeyBoardButton{
                    charName: ":"
                }
                KeyBoardButton{
                    charName: "/"
                }
                KeyBoardButton{
                    charName: "!"
                }
            }
        }
        Item{
            id: numberKeysId
            anchors.fill: parent
            visible: false
            Row{
                id:firstnRowId
                width: parent.width
                height: parent.height*0.15
                spacing: parent.width*0.01
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.1
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.02

                KeyBoardButton{
                    charName: "1"
                }
                KeyBoardButton{
                    charName: "2"
                }
                KeyBoardButton{
                    charName: "3"
                }
                KeyBoardButton{
                    charName: "4"
                }
                KeyBoardButton{
                    charName: "5"
                }
                KeyBoardButton{
                    charName: "6"
                }
                KeyBoardButton{
                    charName: "7"
                }
                KeyBoardButton{
                    charName: "8"
                }
                KeyBoardButton{
                    charName: "9"
                }
                KeyBoardButton{
                    charName: "0"
                }
                KeyBoardButton {
                    Image {
                        anchors.centerIn: parent
                        width: parent.width * 0.6
                        height: parent.height * 0.6
                        source: "images/output-onlinepngtools (1).png"
                    }
                    col: "#8992a5"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (passwordTextId.text.length > 0) {
                                passwordTextId.text = passwordTextId.text.slice(0, -1)
                            }
                        }
                    }
                }

            }
            Row{
                id:secountdnRowId
                width: parent.width
                height: parent.height*0.15
                spacing: parent.width*0.01
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.29
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.05
                KeyBoardButton{
                    charName: "@"
                }
                KeyBoardButton{
                    charName: "#"
                }
                KeyBoardButton{
                    charName: "%"
                }
                KeyBoardButton{
                    charName: "&"
                }
                KeyBoardButton{
                    charName: "*"
                }
                KeyBoardButton{
                    charName: "-"
                }
                KeyBoardButton{
                    charName: "+"
                }
                KeyBoardButton{
                    charName: "("
                }
                KeyBoardButton{
                    charName: ")"
                }
                KeyBoardButton{
                    width: parent.width*0.1
                    Image {
                        anchors.centerIn: parent
                        width: parent.width*0.6
                        height: parent.height*0.6
                        source: "images/enterKey-removebg-preview.png"
                    }
                    col: "#8992a5"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            passwordTextId.text += "\n"
                        }
                    }
                }
            }
            Row{
                id:thirdnRowId
                width: parent.width
                height: parent.height*0.15
                spacing: parent.width*0.01
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.49
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.02
                KeyBoardButton{
                    charName: "1/2"
                }
                KeyBoardButton{
                    charName: "!"
                }
                KeyBoardButton{
                    charName: '"'
                }
                KeyBoardButton{
                    charName: "<"
                }
                KeyBoardButton{
                    charName: ">"
                }
                KeyBoardButton{
                    charName: "'"
                }
                KeyBoardButton{
                    charName: ":"
                }
                KeyBoardButton{
                    charName: ";"
                }
                KeyBoardButton{
                    charName: "/"
                }
                KeyBoardButton{
                    charName: "?"
                }
                KeyBoardButton{
                    charName: "1/2"
                }
            }
            Row{
                id:fourthnRowId
                width: parent.width
                height: parent.height*0.15
                spacing: parent.width*0.01
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.7
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.02
                KeyBoardButton{
                    charName: "ABC"
                    col: "#8992a5"
                    width: parent.width*0.1
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            alphaKeysId.visible=true
                            numberKeysId.visible=false
                        }
                    }
                }
                KeyBoardButton{
                    charName: " "
                    width: parent.width*0.6
                }
                KeyBoardButton{
                    charName: "."
                }
                KeyBoardButton{
                    charName: ".."
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
