import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
Item {
    id: zoomerItemId
    width: windowId.width
    height: windowId.height
    visible: false
    property string rectCol: "white"
    property string textCol: "#a8fdc2"
    property string sliderHandleCol: "#9ad93d"
    property int minValue: 0
    property int maxValue: 15
    property string idHolder: ""
    property string col: "#51d100"
    property var textVal: 0
    property int preVal: 0
    property int preSlideVal: 0
    property real slidevalue: 0
    property real x_axis: 0
    property bool vis: true
    property string idhol: "value"
    signal toBodyFinal()
    property string imageNameUp: "upkey"
    property string imageNameDown: "downkey"
    property string imageNameReset: "reset"
    property bool valueChanged: false
    property real curPrevVal: preSlideVal
    signal toBody(int textValue,int slideValue)
    signal toFooterMainVal(int textValue, var idholder, string decrOrIncr)
    signal toFooterSliderVal(real slideValue, var idholder, string decrOrIncr)
    onTextValChanged: {
        if(curPrevVal>textVal){
            toFooterMainVal(textVal,idhol,'decr')
        }else{
            toFooterMainVal(textVal,idhol,'incr')
        }
        curPrevVal=textVal
    }
    onSlidevalueChanged: {
        // console.log(mySlider.value)
        if(curPrevVal>mySlider.value){
            toFooterSliderVal(slidevalue.toFixed(1),idhol,'decr')
        }else{
            toFooterSliderVal(slidevalue.toFixed(1),idhol, 'incr')
        }
        curPrevVal=mySlider.value
    }
    function fromBody(mVal,sVal,X_axis,rect_col,text_col,visi,idholding){
        zoomerItemId.visible=true
        textVal=mVal
        preVal=mVal
        mySlider.value=sVal
        preSlideVal=sVal
        x_axis=X_axis
        rectCol=rect_col
        textCol=text_col
        col=text_col
        sliderHandleCol=textCol
        vis=visi
        idhol=idholding
    }
    x:x_axis
    Rectangle{
        width: parent.width*0.21
        height: parent.height*0.31
        color: "black"
        border.width: parent.width*0.001
        border.color: "white"
        x:parent.width*0.17
        y:parent.height*0.2
        Rectangle{
            anchors.centerIn: parent
            width: parent.width*0.9
            height: parent.height*0.9
            color: rectCol
            Text {
                id: textId
                anchors.centerIn: parent
                text: textVal
                font.bold: true
                font.pixelSize: parent.width*0.5
                color: "#a8fdc2"
            }
        }
    }
    Rectangle{
        x: parent.width*0.08
        y:parent.height*0.13
        width: parent.width*0.07
        height: parent.height*0.11
        radius: parent.width*0.07/2
        color: "#7296c4"
        Image {
            anchors.centerIn: parent
            width: parent.width*0.35
            height: parent.height*0.5
            source: "images/"+imageNameUp+"-removebg-preview-removebg-preview (1).png"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                valueChanged=true
                if(idhol==="pauseId"){
                    if(textVal<15){
                        textVal+=1
                        toBody(textVal,slidevalue)
                    }else{}
                }else if(idhol==="pressureId"){
                    if(textVal<70){
                        textVal+=1
                        toBody(textVal,slidevalue)
                    }else{}
                }else{
                    if(textVal<0){
                        textVal+=1
                        toBody(textVal,slidevalue)
                    }else{}
                }
            }

            onPressed: {
                valueChanged=true
                imageNameUp="upkey-black"
                timerIncr.start()
                parent.color="white"
            }
            onReleased: {
                imageNameUp="upkey"
                timerIncr.stop()
                parent.color="#7296c4"
            }

            Timer {
                id: timerIncr
                interval: 500
                repeat: true
                running: false
                onTriggered: {
                    if(idhol==="pauseId"){
                        if(textVal<15){
                            textVal+=1
                            toBody(textVal,slidevalue)
                        }else{}
                    }else if(idhol==="pressureId"){
                        if(textVal<70){
                            textVal+=1
                            toBody(textVal,slidevalue)
                        }else{}
                    }else{
                        if(textVal<0){
                            textVal+=1
                            toBody(textVal,slidevalue)
                        }else{}
                    }
                }
            }
        }
    }
    Rectangle{
        x: parent.width*0.08
        y:parent.height*0.28
        width: parent.width*0.07
        height: parent.height*0.11
        radius: parent.width*0.07/2
        color: "#7296c4"
        Image {
            anchors.centerIn: parent
            width: parent.width*0.35
            height: parent.height*0.5
            source: "images/"+imageNameDown+"-removebg-preview-removebg-preview (1).png"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                valueChanged=true
                if(idhol==="pauseId"){
                    if(textVal>0){
                        textVal-=1
                        toBody(textVal,slidevalue)
                    }else{}
                }else if(idhol==="pressureId"){
                    if(textVal>0){
                        textVal-=1
                        toBody(textVal,slidevalue)
                    }else{}
                }else{
                    if(textVal>-70){
                        textVal-=1
                        toBody(textVal,slidevalue)
                    }else{}
                }
            }

            onPressed: {
                valueChanged=true
                timerDecr.start()
                imageNameDown="downkey-black"
                parent.color="white"
            }
            onReleased: {
                timerDecr.stop()
                imageNameDown="downkey"
                parent.color="#7296c4"
            }

            Timer {
                id: timerDecr
                interval: 500
                repeat: true
                running: false
                onTriggered: {
                    if(idhol==="pauseId"){
                        if(textVal>0){
                            textVal-=1
                            toBody(textVal,slidevalue)
                        }else{}
                    }else if(idhol==="pressureId"){
                        if(textVal>0){
                            textVal-=1
                            toBody(textVal,slidevalue)
                        }else{}
                    }else{
                        if(textVal>-70){
                            textVal-=1
                            toBody(textVal,slidevalue)
                        }else{}
                    }
                }
            }
        }
    }
    Rectangle{
        x: parent.width*0.08
        y:parent.height*0.43
        width: parent.width*0.07
        height: parent.height*0.11
        radius: parent.width*0.07/2
        color: "#7296c4"
        Image {
            anchors.centerIn: parent
            width: parent.width*0.8
            height: parent.height*0.8
            source: "images/"+imageNameReset+"-removebg-preview.png"
        }
        MouseArea{
            anchors.fill: parent
            onPressed: {
                textVal=preVal
                slidevalue=preSlideVal
                mySlider.value=preSlideVal
                valueChanged=false
                toBody(textVal,slidevalue)
                imageNameReset="reset-black"
                parent.color="white"
            }
            onReleased: {
                imageNameReset="reset"
                parent.color="#7296c4"
            }
        }
    }
    Rectangle{
        width: parent.width*0.2
        height: parent.height*.1
        color: "#51d100"
        x: parent.width*.175
        y:parent.height*0.55
        radius: parent.width*0.008
        Image {
            anchors.centerIn: parent
            width: parent.width*0.2
            height: parent.height*0.8
            source: "images/tick-removebg-preview.png"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                zoomerItemId.visible=false
                toBodyFinal()
                var typeName=''
                if(idhol==="pauseId"){
                    typeName='PAUSE'
                }else if(idhol==="pressureId"){
                    typeName='INSP'
                }else{
                    typeName='EXP'
                }
                if(valueChanged){
                    valueChanged=false
                    systemLog.insertData(windowId.getCurrentDateTime(),'DEVICE',typeName+'_PRESS_CHANGED')
                }else{}
            }
        }
    }
    Slider {
        id: mySlider
        orientation: Qt.Vertical
        from: 0
        value: slidevalue
        to: 5
        width: parent.width*0.2
        height: parent.height*0.3
        x:parent.width*0.32
        y:parent.height*0.2
        visible: vis
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
            color: sliderHandleCol
            border.color: "#bdbebf"
        }
        onValueChanged: {
            slidevalue=mySlider.value
            toBody(textVal,mySlider.value)
        }
    }
    Text {
        id: increaseId
        x: parent.width * 0.4
        y: parent.height * 0.118
        text: "▲"
        visible: vis
        color: col
        font.pixelSize: parent.width*0.04
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (mySlider.value === 0) {
                    mySlider.value += 0.5;
                } else {
                    mySlider.value += 0.1;
                }
            }

            onPressed: {
                timer.start();
            }
            onReleased: {
                timer.stop();
            }
            Timer {
                id: timer
                interval: 500
                repeat: true
                running: false
                onTriggered: {
                    if (mySlider.value === 0) {
                        mySlider.value += 0.5;
                    } else {
                        mySlider.value += 0.1;
                    }
                }
            }
        }
    }

    Text {
        id: decreaseId
        x:parent.width*0.4
        y: parent.height*0.525
        text: "▼"
        visible: vis
        color: col
        font.pixelSize: parent.width*0.04
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (mySlider.value.toFixed(1) == 0.5) {
                    mySlider.value = 0;
                } else {
                    mySlider.value -= 0.1;
                }
            }

            onPressed: {
                timerId.start();
            }

            onReleased: {
                timerId.stop();
            }
            Timer {
                id: timerId
                interval: 500
                repeat: true
                running: false
                onTriggered: {
                    if (mySlider.value.toFixed(1) == 0.5) {
                        mySlider.value = 0;
                    } else {
                        mySlider.value -= 0.1;
                    }
                }
            }
        }
    }
    Text {
        id: sliderTextId
        visible: vis
        text: mySlider.value.toFixed(1)
        font.pixelSize: parent.width*0.018
        color: textCol
        x:parent.width*0.39
        y:parent.height*0.485
        font.bold: true
    }
    Text {
        id: sliderValueId
        text: "s"
        visible: vis
        font.pixelSize: parent.width*0.018
        color: "white"
        x:parent.width*0.422
        y:parent.height*0.485
        font.bold: true
    }
}
