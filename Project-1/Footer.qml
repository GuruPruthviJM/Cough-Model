import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15
Item {
    width: windowId.width
    height: windowId.height
    signal toDrawer()
    signal toZoomer(int mval,real x_axis,string rect_col,string text_col)
    property int  mVal: 1
    property int  pVal: 0
    signal toBodyZoom()
    signal toBodyFinal()
    property int cycleCount: 0
    property int millisecondsValue: 0
    property int secondsValue: 0
    property string image: "play"
    property real sec: 0.0
    signal toResume_play()
    signal toPopUp()
    property real pointerX: parent.width * 0.25
    property real pointerY: parent.height * 0.63
    property real pointerRadius: parent.width * 0.005
    property string imageNameUp: "upkey"
    property string imageNameDown: "downkey"
    property string imageNameReset: "reset"
    property bool movedToNext: false
    property bool valueChanged: false
    property int repeatCounter: 0
    property real greenStratPointerWidth: parent.width * 0.25
    property real greenPointerHeight: parent.height * 0.63
    property real greenEndPointerWidth: parent.width * 0.42
    property real yellowStratPointerWidth: parent.width * 0.55
    property real yellowPointerHeight: parent.height * 0.7
    property real yellowEndPointerWidth: parent.width * 0.7
    property real blueStratPointerWidth: parent.width * 0.42
    property real bluePointerHeight: parent.height * 0.6
    property real blueEndPointerWidth: parent.width * 0.55
    function fromZoomerMainVal(mainVal,idhol,incrOrDecri){
        pointerX= greenStratPointerWidth
        pointerY= greenPointerHeight
        if(incrOrDecri==='incr'){
            if(idhol==="pauseId"){
                greenPointerHeight-=parent.height*0.0011
            }else if(idhol==="pressureId"){
                bluePointerHeight-=parent.height*0.002
            }else{
                yellowPointerHeight-=parent.height*0.001
            }
        }else{
            if(idhol==="pauseId"){
                greenPointerHeight+=parent.height*0.0011
            }else if(idhol==="pressureId"){
                bluePointerHeight+=parent.height*0.002
            }else{
                yellowPointerHeight+=parent.height*0.001
            }
        }
        canvasid.requestPaint();
    }

    function fromZoomerSlideVal(sliderVal,idhol,incrOrDecri){
        pointerX= greenStratPointerWidth
        pointerY= greenPointerHeight
        if(incrOrDecri==='incr'){
            if(idhol==="pauseId"){
                if(sliderVal===0.5){
                    greenEndPointerWidth+=parent.width*0.025
                    blueEndPointerWidth+=parent.width*0.025/2
                    blueStratPointerWidth=greenEndPointerWidth
                    yellowStratPointerWidth+=parent.width*0.025/2
                }else{
                    greenEndPointerWidth+=parent.width*0.008
                    blueEndPointerWidth+=parent.width*0.005
                    blueStratPointerWidth=greenEndPointerWidth
                    yellowStratPointerWidth+=parent.width*0.005
                }
            }else if(idhol==="pressureId"){
                if(sliderVal===0.5){
                    blueEndPointerWidth+=parent.width*0.01
                    greenEndPointerWidth-=parent.width*0.01
                    blueStratPointerWidth=greenEndPointerWidth
                    yellowStratPointerWidth=blueEndPointerWidth
                }else{
                    blueEndPointerWidth+=parent.width*0.001
                    blueStratPointerWidth=greenEndPointerWidth
                    greenEndPointerWidth-=parent.width*0.001
                    yellowStratPointerWidth=blueEndPointerWidth
                }
            }else{
                if(sliderVal===0.5){
                    blueEndPointerWidth-=parent.width*0.015
                    greenEndPointerWidth-=parent.width*0.015
                    yellowStratPointerWidth=blueEndPointerWidth
                    blueStratPointerWidth=greenEndPointerWidth
                }else{
                    blueEndPointerWidth-=parent.width*0.0035
                    yellowStratPointerWidth=blueEndPointerWidth
                    greenEndPointerWidth-=parent.width*0.005/2
                    blueStratPointerWidth=greenEndPointerWidth
                }
            }
        }else{
            if(idhol==="pauseId"){
                if(sliderVal===0){
                    greenEndPointerWidth=greenStratPointerWidth
                    blueEndPointerWidth-=parent.width*0.025/2
                    blueStratPointerWidth=greenEndPointerWidth
                    yellowStratPointerWidth-=parent.width*0.025/2
                }else{
                    greenEndPointerWidth-=parent.width*0.005
                    blueEndPointerWidth-=parent.width*0.005/2
                    blueStratPointerWidth=greenEndPointerWidth
                    yellowStratPointerWidth-=parent.width*0.005/2
                }
            }else if(idhol==="pressureId"){
                if(sliderVal===0){
                    blueEndPointerWidth=greenEndPointerWidth
                    // greenEndPointerWidth+=parent.width*0.01
                    // blueStratPointerWidth=greenEndPointerWidth
                    yellowStratPointerWidth=greenEndPointerWidth
                }else{
                    blueEndPointerWidth-=parent.width*0.001
                    blueStratPointerWidth=greenEndPointerWidth
                    greenEndPointerWidth+=parent.width*0.001
                    yellowStratPointerWidth=blueEndPointerWidth
                }
            }else{
                if(sliderVal===0){
                    blueEndPointerWidth+=parent.width*0.015
                    greenEndPointerWidth+=parent.width*0.015
                    yellowStratPointerWidth=yellowEndPointerWidth
                    blueStratPointerWidth=greenEndPointerWidth
                }else{
                    blueEndPointerWidth+=parent.width*0.0035
                    yellowStratPointerWidth=blueEndPointerWidth
                    greenEndPointerWidth+=parent.width*0.005/2
                    blueStratPointerWidth=greenEndPointerWidth
                }
            }
        }
        canvasid.requestPaint();
    }

    function fromResumeCancel(){
        itemTextId.visible=false
    }
    function fromResumeResume(){
        if(!autoRectCycleId.visible){
            timer.running=true
            addRectId.enabled=true
            subRectId.enabled=true
            itemTextId.visible=true
            autoTextId.text=mVal
        }else{
            movementTimer.start()
            bodyId.opacity=1
            navId.opacity=1
            footerId.opacity=1
        }
    }
    function retriveData(selectedName){
        var userInfo = user.retrieveUserInfo(selectedName);
        mVal=parseFloat(userInfo['Cycle_val'])
        greenEndPointerWidth = parseFloat(userInfo['greenEndPointerWidth']);
        greenPointerHeight = parseFloat(userInfo['greenPointerHeight']);
        greenStratPointerWidth = parseFloat(userInfo['greenStratPointerWidth']);
        blueStratPointerWidth = parseFloat(userInfo['blueStratPointerWidth']);
        bluePointerHeight = parseFloat(userInfo['bluePointerHeight']);
        blueEndPointerWidth = parseFloat(userInfo['blueEndPointerWidth']);
        yellowStratPointerWidth = parseFloat(userInfo['yellowStratPointerWidth']);
        yellowPointerHeight = parseFloat(userInfo['yellowPointerHeight']);
        yellowEndPointerWidth = parseFloat(userInfo['yellowEndPointerWidth']);
        canvasid.requestPaint()
    }
    function fromNav(){
        if(canvasid.visible){
            canvasid.visible=false
            autoRectCycleId.visible=false
            cycleTextId.visible=false
            addRectId.visible=true
            subRectId.visible=true
        }else{
            canvasid.visible=true
            autoRectCycleId.visible=true
            cycleTextId.visible=true
            addRectId.visible=false
            subRectId.visible=false
        }
    }
    Item{
        id: mainItemId
        anchors.fill: parent
        Canvas {
            id: canvasid
            anchors.fill: parent
            Timer {
                id: movementTimer
                interval: 50
                repeat: true
                onTriggered: {
                    if(pointerX<greenEndPointerWidth){
                        pointerX += 5;
                    }else if(pointerY>bluePointerHeight&&!movedToNext&&bluePointerHeight<greenPointerHeight){
                        pointerY-=5
                    }else if(bluePointerHeight>greenPointerHeight&&!movedToNext&&pointerY<bluePointerHeight){
                        pointerY+=5
                    }else if(pointerX<blueEndPointerWidth){
                        pointerX+=5
                    }else if(pointerY<yellowPointerHeight){
                        movedToNext=true
                        pointerY+=5
                    }else if(pointerX<yellowEndPointerWidth){
                        pointerX+=5
                    }else{
                        pointerX= greenStratPointerWidth
                        pointerY= greenPointerHeight
                        movedToNext=false
                        repeatCounter++;
                        if(repeatCounter===mVal){
                            popId.countCycle=repeatCounter
                            toPopUp()
                            popId.visible=true
                            image="play"
                            repeatCounter=0;
                            autoTextId.text=mVal
                            movementTimer.stop()
                        }else{
                            autoTextId.text=mVal-repeatCounter;
                        }
                    }
                    canvasid.requestPaint();
                }
            }
            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, parent.width, parent.height);
                ctx.strokeStyle = "#ffffff";
                ctx.lineWidth = 2;
                ctx.lineCap = "round";
                ctx.beginPath();
                ctx.moveTo(parent.width * 0.25, parent.height * 0.45);
                ctx.lineTo(parent.width * 0.25, parent.height * 0.8);
                ctx.moveTo(parent.width * 0.7, parent.height * 0.45);
                ctx.lineTo(parent.width * 0.7, parent.height * 0.8);
                ctx.stroke();
                ctx.strokeStyle = "#bdf17b";
                ctx.lineWidth = 5;
                ctx.beginPath();
                ctx.moveTo(/*parent.width * 0.25, parent.height * 0.63*/greenStratPointerWidth,greenPointerHeight);
                ctx.lineTo(/*parent.width * 0.42, parent.height * 0.63*/greenEndPointerWidth,greenPointerHeight);
                ctx.stroke();

                ctx.beginPath();
                ctx.arc(pointerX, pointerY, pointerRadius, 0, 2 * Math.PI);
                ctx.fillStyle = "yellow";
                ctx.fill();
                ctx.stroke();

                ctx.strokeStyle = "#F9FF3B"; //yellow hline
                ctx.beginPath();
                ctx.moveTo(/*parent.width * 0.55, parent.height * 0.7*/yellowStratPointerWidth,yellowPointerHeight);
                ctx.lineTo(/*parent.width * 0.7, parent.height * 0.7*/yellowEndPointerWidth,yellowPointerHeight);
                ctx.stroke();

                ctx.strokeStyle = "#60F6FB"; //blue hline
                ctx.beginPath();
                ctx.moveTo(/*parent.width * 0.42, parent.height * 0.6*/blueStratPointerWidth,bluePointerHeight);
                ctx.lineTo(/*parent.width * 0.55, parent.height * 0.6*/blueEndPointerWidth,bluePointerHeight);
                ctx.stroke();
                ctx.beginPath();
                ctx.moveTo(/*parent.width * 0.42, parent.height * 0.625*/greenEndPointerWidth, greenPointerHeight);
                ctx.lineTo(/*parent.width * 0.42, parent.height * 0.6*/greenEndPointerWidth, bluePointerHeight);
                ctx.stroke();
                ctx.beginPath();
                ctx.moveTo(/*parent.width * 0.55, parent.height * 0.6*/blueEndPointerWidth,bluePointerHeight);
                ctx.lineTo(/*parent.width * 0.55, parent.height * 0.625*/blueEndPointerWidth,greenPointerHeight);
                ctx.stroke();

                ctx.strokeStyle = "#F9FF3B";
                ctx.beginPath();
                ctx.moveTo(/*parent.width * 0.55, parent.height * 0.625*/blueEndPointerWidth,greenPointerHeight);
                ctx.lineTo(/*parent.width * 0.55, parent.height * 0.7*/blueEndPointerWidth,yellowPointerHeight);
                ctx.stroke();
            }
        }

        Text {
            text: qsTr("◄")
            font.pixelSize: parent.width*0.02
            x:parent.width*0.22
            color: "#f4fe46"
            y:parent.height*0.61
        }

        Gauge {
            id: myGauge
            x: parent.width * 0.19
            y: parent.height * 0.45
            height: parent.height * 0.36
            minimumValue: -70
            value: 0
            maximumValue: 70
            style: GaugeStyle {
                valueBar: Rectangle {
                    color: "black"
                }
                minorTickmark: Item {
                    Rectangle {
                        color: "#cccccc"
                        anchors.fill: parent
                        anchors.leftMargin: 2
                        anchors.rightMargin: 4
                    }
                }
                tickmark: Item {
                    implicitWidth: 18
                    implicitHeight: 3
                    Rectangle {
                        color: "#c8c8c8"
                        anchors.fill: parent
                        anchors.leftMargin: 3
                        anchors.rightMargin: 3
                    }
                }
                tickmarkLabel: Component {
                    Text {
                        id: valueTextId
                        text: styleData.value
                        font.bold: false
                    }
                }
            }
        }

        Text {
            x:parent.width*0.19
            y:parent.height*0.62
            text: "0"
            color: "#eaf9ff"
            font.pixelSize: parent.width*0.015
        }
        Text {
            x:parent.width*0.185
            y:parent.height*0.45
            text: "70"
            color: "#eaf9ff"
            font.pixelSize: parent.width*0.015
        }
        Text {
            x:parent.width*0.18
            y:parent.height*0.78
            text: "-70"
            color: "#eaf9ff"
            font.pixelSize: parent.width*0.015
        }
        Text {
            x:parent.width*0.18
            y:parent.height*0.81
            text: "cm H2O"
            color: "#eaf9ff"
            font.bold: true
            font.pixelSize: parent.width*0.015
        }
        Text{
            x:parent.width*0.01
            y:parent.height*0.45
            text: "SpO2"
            color: "grey"
            font.pixelSize: parent.width*0.02
        }
        Text{
            x:parent.width*0.01
            y:parent.height*0.62
            text: "Peak Exp. Flow"
            color: "white"
            font.pixelSize: parent.width*0.018
            font.bold: true
        }
        Text{
            x:parent.width*0.01
            y:parent.height*0.655
            text: "0 lpm"
            color: "#F9FF3B"
            font.pixelSize: parent.width*0.015
        }
        Text{
            x:parent.width*0.01
            y:parent.height*0.78
            text: "Exp. Volume"
            color: "white"
            font.pixelSize: parent.width*0.018
            font.bold: true
        }
        Text{
            x:parent.width*0.01
            y:parent.height*0.82
            text: "0 ml"
            color: "#F9FF3B"
            font.pixelSize: parent.width*0.015
        }
        Image {
            id: settingImageId
            x:-parent.width*0.045
            y: parent.height*0.87
            width: parent.width*0.15
            height: parent.height*0.15
            source: "images/setting (1).png"
            MouseArea {
                anchors.fill: settingImageId
                onClicked: {
                    toDrawer()
                }
            }
        }
        Image {
            id: playImageId
            x:parent.width*0.45
            y: parent.height*0.82
            width: parent.width*0.1
            height: parent.height*0.2
            // visible: false
            source: "images/"+image+"-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(!autoRectCycleId.visible){
                        if(image==="play"){
                            image="pause"
                            timer.running=true
                            addRectId.enabled=true
                            subRectId.enabled=true
                            bodyId.opacity=0.2
                            bodyId.enabled=false
                            navId.enabled=false
                            itemTextId.visible=true
                            autoRectCycleId.enabled=false
                            toggleId.enabled=false
                            settingImageId.enabled=false
                            systemLog.insertData(windowId.getCurrentDateTime(),'THERAPY', 'THERAPY_START')
                            toPopUp()
                        }
                        else{
                            image="play"
                            timer.running=false
                            addRectId.enabled=false
                            subRectId.enabled=false
                            itemTextId.visible=false
                            autoRectCycleId.enabled=true
                            toggleId.enabled=true
                            settingImageId.enabled=true
                            systemLog.insertData(windowId.getCurrentDateTime(),'THERAPY', 'THERAPY_PAUSE')
                            systemLog.insertDataToMonitorLog(windowId.getCurrentDateTime(),'MONITOR', 'CYCLE_MEASUREMENT')
                            toResume_play()
                        }
                    }else{
                        if(image==="play"){
                            image="pause"
                            bodyId.enabled=false
                            navId.enabled=false
                            autoRectCycleId.enabled=false
                            toggleId.enabled=false
                            settingImageId.enabled=false
                            movementTimer.start()
                            systemLog.insertData(windowId.getCurrentDateTime(),'THERAPY', 'THERAPY_START')
                            toPopUp()
                        }
                        else{
                            image="play"
                            timer.running=false
                            addRectId.enabled=false
                            subRectId.enabled=false
                            cycleCount=mVal
                            autoRectCycleId.enabled=true
                            toggleId.enabled=true
                            settingImageId.enabled=true
                            movementTimer.stop()
                            systemLog.insertData(windowId.getCurrentDateTime(),'THERAPY', 'THERAPY_PAUSE')
                            systemLog.insertDataToMonitorLog(windowId.getCurrentDateTime(),'MONITOR', 'CYCLE_MEASUREMENT')
                            popId.countCycle=repeatCounter
                            toResume_play()
                        }
                    }
                }
            }
        }
        Tooglebar {
            id: toggleId
            x: parent.width*0.91
            y: parent.height*0.915
        }
        Text{
            x: parent.width*0.805
            y: parent.height*0.92
            text: "Oscillations"
            font.pixelSize: parent.width*0.015
            font.bold: true
            color: "white"
        }
        Rectangle{
            id: autoRectCycleId
            width: parent.width*0.15
            height: parent.height*0.2
            // visible: false
            y: parent.height*0.5
            x: parent.width*0.75
            color: "#757a8f"
            Text {
                id: autoTextId
                anchors.centerIn: parent
                text: mVal
                font.pixelSize: parent.width*0.5
                font.bold: true
                color: "#5af0f9"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    itemZoomId.visible=true
                    pVal=mVal
                    toBodyZoom()
                    itemZoomId.enabled=true
                    mainItemId.opacity=0.2
                    mainItemId.enabled=false
                }
            }
        }
        Text {
            id:cycleTextId
            y: parent.height*0.7
            x: parent.width*0.79
            // visible: false
            text: "Cycles"
            color: "white"
            font.pixelSize: parent.width*0.02
        }
        Rectangle{
            id: addRectId
            width: parent.width*0.25
            height: parent.height*0.3
            color: "transparent"
            x:parent.width*0.35
            y:parent.height*0.45
            visible: false
            enabled: false
            Rectangle{
                width: parent.width*0.7
                height: parent.width*0.7
                radius: parent.width*0.8/2
                anchors.centerIn: parent
                color: "black"
                border.width: parent.width*0.01
                border.color: "#59aa38"
                Image {
                    source: "images/plus.png"
                    width: parent.width*0.9
                    height: parent.height*0.9
                    anchors.centerIn: parent
                }
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    addRectId.color="#65b967"
                    cycleCount+=1
                    secondsValue=0
                    millisecondsValue=0
                    cycleSecoundTextId.color="#2ae4f2"
                }
                onReleased: {
                    addRectId.color="transparent"
                    secondsValue=0
                    millisecondsValue=0
                    cycleSecoundTextId.color="#a8fdc2"
                }
            }
        }
        Rectangle{
            id: subRectId
            width: parent.width*0.25
            height: parent.height*0.3
            color: "transparent"
            x:parent.width*0.7
            y:parent.height*0.45
            visible: false
            enabled: false
            Rectangle{
                width: parent.width*0.7
                height: parent.width*0.7
                radius: parent.width*0.8/2
                anchors.centerIn: parent
                color: "black"
                border.width: parent.width*0.01
                border.color: "#59aa38"
                Image {
                    source: "images/minus.png"
                    width: parent.width*0.9
                    height: parent.height*0.9
                    anchors.centerIn: parent
                }
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    subRectId.color="#65b967"
                    cycleCount+=1
                    secondsValue=0
                    millisecondsValue=0
                    cycleSecoundTextId.color="#fbf700"
                }
                onReleased: {
                    subRectId.color="transparent"
                    secondsValue=0
                    millisecondsValue=0
                    cycleSecoundTextId.color="#a8fdc2"
                }
            }
        }
        Item{
            id: itemTextId
            anchors.fill: parent
            visible: false
            Text {
                id: textId1
                // visible: false
                text: qsTr("Cycles")
                font.pixelSize: parent.width*0.045
                x:parent.width*0.25
                y:parent.height*0.3
                color: "white"
            }
            Text {
                id: textId2
                text: qsTr("Seconds")
                // visible: false
                font.pixelSize: parent.width*0.045
                x:parent.width*0.5
                y:parent.height*0.3
                color: "white"
            }
            Text {
                id: cycleCountTextId
                text: cycleCount
                // visible: false
                font.pixelSize: parent.width*0.07
                x:parent.width*0.3
                y:parent.height*0.15
                color: "white"
            }
            Text {
                id: cycleSecoundTextId
                text: sec
                // visible: false
                font.pixelSize: parent.width*0.07
                x:parent.width*0.53
                y:parent.height*0.15
                color: "#a8fdc2"
            }
        }
        Timer {
            id: timer
            interval: 100
            running: false
            repeat: true
            onTriggered: {
                millisecondsValue += 100
                if (millisecondsValue >= 1000) {
                    millisecondsValue = 0
                    secondsValue++
                }
                cycleSecoundTextId.text = secondsValue + ":" + ("00" + millisecondsValue).slice(-3,-2)
            }
        }
    }
    Item{
        id: itemZoomId
        visible: false
        anchors.fill: parent
        Rectangle{
            width: parent.width*0.21
            height: parent.height*0.31
            color: "black"
            border.width: parent.width*0.001
            border.color: "white"
            x:parent.width*0.6
            y:parent.height*0.38
            Rectangle{
                anchors.centerIn: parent
                width: parent.width*0.9
                height: parent.height*0.9
                color: "#757a8f"
                Text {
                    id: textId
                    anchors.centerIn: parent
                    text: mVal
                    font.bold: true
                    font.pixelSize: parent.width*0.5
                    color: "#5af0f9"
                }
            }
        }
        Rectangle{
            x: parent.width*0.5
            y:parent.height*0.35
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
                    if (mVal < 20){
                        mVal=mVal + 1
                    }else{
                    }
                }

                onPressed: {
                    valueChanged=true
                    timerIncr.start()
                    imageNameUp="upkey-black"
                    parent.color="white"
                }
                onReleased: {
                    timerIncr.stop()
                    imageNameUp="upkey"
                    parent.color="#7296c4"
                }
                Timer{
                    id: timerIncr
                    repeat: true
                    interval: 500
                    onTriggered: {
                        if (mVal < 20){
                            mVal=mVal + 1
                        }else{
                        }
                    }
                }
            }
        }
        Rectangle{
            x: parent.width*0.5
            y:parent.height*0.5
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
                    if (mVal > 1){
                        mVal=mVal - 1
                    }else{
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
                Timer{
                    id: timerDecr
                    repeat: true
                    interval: 500
                    onTriggered: {
                        if (mVal > 1){
                            mVal=mVal - 1
                        }else{
                        }
                    }
                }
            }
        }
        Rectangle{
            x: parent.width*0.5
            y:parent.height*0.64
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
                    valueChanged=false
                    mVal=pVal
                    imageNameReset="reset-black"
                    parent.color="white"
                }
                onReleased: {
                    valueChanged=false
                    imageNameReset="reset"
                    parent.color="#7296c4"
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*.1
            color: "#51d100"
            x: parent.width*.6
            y:parent.height*0.73
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
                    itemZoomId.visible=false
                    toBodyFinal()
                    mainItemId.opacity=1
                    mainItemId.enabled=true
                    if(valueChanged){
                        valueChanged=false
                        systemLog.insertData(windowId.getCurrentDateTime(),'DEVICE','CYCLE_CHANGED')
                    }
                }
            }
        }
    }
}
