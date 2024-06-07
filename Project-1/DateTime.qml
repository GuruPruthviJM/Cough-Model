import QtQuick 2.15

Item {
    id: dateTimeId
    width: windowId.width
    height: windowId.height
    property var idHold: ""
    property int  date: 2
    property string month: "Mar"
    property int year: 2024
    property var months: ["Jan", "Feb", "Mar", "Apr", "May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    property var dates: [31,28,31,30,31,30,31,30,31,31,30,31]
    property int  date1: 2
    property string month1: "Mar"
    property int  year1: 2024
    property int index: 2
    property int  hour: 1
    property int min: 2
    property int  hour1: 1
    property int min1: 2
    property string ampm: "AM"
    Rectangle{
        id: mainRectId
        width: parent.width*0.8
        height: parent.height*0.8
        y:parent.height*0.09
        color: "black"
        border.width: parent.width*0.001
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "white"

        radius: parent.width*0.02
        Text {
            text: qsTr("Date & Time")
            font.pixelSize: parent.width*0.038
            color: "white"
            x:parent.width*0.05
            y:parent.height*0.06
            font.bold: true
        }
        Image {
            width: parent.width*0.04
            height: parent.height*0.06
            y:parent.height*0.085
            anchors.right: parent.right
            anchors.rightMargin: parent.height*0.1
            source: "images/close_white-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    dateTimeId.visible=false
                    navId.opacity=1
                    bodyId.opacity=1
                    footerId.opacity=1
                    navId.enabled=true
                    bodyId.enabled=true
                    footerId.enabled=true
                }
            }
        }
        Rectangle{
            width: parent.width
            height: parent.height*0.002
            color: "white"
            y:parent.height*0.2
        }
        Text {
            text: qsTr("Date\n"+((date1<10)?"0"+date1:date1)+" "+month1 +" "+ year1)
            font.pixelSize: parent.width*0.02
            x:parent.width*0.11
            y:parent.height*0.23
            color: "white"
            font.bold: true
        }
        Rectangle{
            width: parent.width
            height: parent.height*0.002
            color: "white"
            y:parent.height*0.35
        }
        Text {
            text: qsTr("Time\n") + (hour1 < 10 ? "0" + hour1 : hour1) + ":" + (min1 < 10 ? "0" + min1 : min1) + " " + ampm
            font.pixelSize: parent.width*0.02
            x:parent.width*0.11
            y:parent.height*0.37
            color: "white"
            font.bold: true
        }
        Rectangle{
            width: parent.width

            height: parent.height*0.002
            color: "white"
            y:parent.height*0.49
        }
        Image {
            width: parent.width*0.05
            height: parent.height*0.05
            x:parent.width*0.88
            y:parent.height*0.25
            source: "images/play_DateTime-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mainRectId.visible=false
                    dateRectId.visible=true
                    date=date1
                    month=month1
                    year=year1
                }
            }
        }
        Image {
            width: parent.width*0.05
            height: parent.height*0.05
            x:parent.width*0.88
            y:parent.height*0.4
            source: "images/play_DateTime-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timeRectId.visible=true
                    mainRectId.visible=false
                    hour=hour1
                    min=min1
                }
            }
        }
    }
    Rectangle{
        id: dateRectId
        width: parent.width*0.8
        height: parent.height*0.8
        y:parent.height*0.09
        color: "black"
        border.width: parent.width*0.001
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "white"
        visible: false
        Image {
            width: parent.width*0.04
            height: parent.height*0.06
            y:parent.height*0.085
            anchors.right: parent.right
            anchors.rightMargin: parent.height*0.1
            source: "images/close_white-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mainRectId.visible=true
                    dateRectId.visible=false
                }
            }
        }
        Rectangle{
            x: parent.width*0.08
            y:parent.height*0.33
            width: parent.width*0.07
            height: parent.height*0.11
            radius: parent.width*0.07/2
            color: "#7296c4"
            Image {
                anchors.centerIn: parent
                width: parent.width*0.35
                height: parent.height*0.5
                source: "images/upkey-removebg-preview-removebg-preview (1).png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if((year%4===0 && year%100!==0)||(year%400===0)){
                        dates[1]=29
                    }else{
                        dates[1]=28
                    }
                    if(dateId.color=="#5fffff"){
                        if(date<dates[index]){
                            date+=1
                        }else if(date>dates[index]){
                            date=dates[index]
                        }
                    }else if(monthId.color=="#5fffff"){
                        index++
                        if(index>11){
                            index=0
                            month=months[index]
                        }else{
                            month=months[index]
                        }
                    }else if(yearId.color=="#5fffff"){
                        if(year<2037){
                            year+=1
                        }else{}
                    }else{}

                }
            }
        }
        Rectangle{
            x: parent.width*0.08
            y:parent.height*0.52
            width: parent.width*0.07
            height: parent.height*0.11
            radius: parent.width*0.07/2
            color: "#7296c4"
            Image {
                anchors.centerIn: parent
                width: parent.width*0.35
                height: parent.height*0.5
                source: "images/downkey-removebg-preview-removebg-preview (1).png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(dateId.color=="#5fffff"){
                        if(date>0){
                            date-=1
                        }else{}
                    }else if(monthId.color=="#5fffff"){
                        if(index>0){
                            index--
                            month=months[index]
                        }else{
                            index=11
                            month=months[index]
                        }
                    }else if(yearId.color=="#5fffff"){
                        if(year>2021){
                            year-=1
                        }else{}
                    }
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*0.23
            color: "black"
            anchors.verticalCenter: parent.verticalCenter
            x:parent.width*0.2
            border.width: parent.width*0.001
            border.color: "#6481c7"
            Rectangle{
                anchors.centerIn: parent
                width: parent.width*0.88
                height: parent.height*0.88
                color: "#6481c7"
                Text {
                    id: dateId
                    text: ((date<10)?("0"+date):date)
                    color: "white"
                    font.pixelSize: parent.width*0.3
                    anchors.centerIn: parent
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    dateId.color="#5fffff"
                    monthId.color="white"
                    yearId.color="white"
                    idHold=dateId
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*0.23
            color: "black"
            anchors.verticalCenter: parent.verticalCenter
            x:parent.width*0.425
            border.width: parent.width*0.001
            border.color: "#6481c7"
            Rectangle{
                anchors.centerIn: parent
                width: parent.width*0.88
                height: parent.height*0.88
                color: "#6481c7"
                Text {
                    id: monthId
                    text: month
                    color: "white"
                    font.pixelSize: parent.width*0.3
                    anchors.centerIn: parent
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    monthId.color="#5fffff"
                    dateId.color="white"
                    yearId.color="white"
                    idHold=monthId
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*0.23
            color: "black"
            anchors.verticalCenter: parent.verticalCenter
            x:parent.width*0.65
            border.width: parent.width*0.001
            border.color: "#6481c7"
            Rectangle{
                anchors.centerIn: parent
                width: parent.width*0.88
                height: parent.height*0.88
                color: "#6481c7"
                Text {
                    id: yearId
                    text: year
                    color: "white"
                    font.pixelSize: parent.width*0.3
                    anchors.centerIn: parent
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    yearId.color="#5fffff"
                    dateId.color="white"
                    monthId.color="white"
                    idHold=yearId
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*.1
            color: "#51d100"
            anchors.horizontalCenter: parent.horizontalCenter
            y:parent.height*0.82
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
                    dateRectId.visible=false
                    mainRectId.visible=true
                    date1=date
                    month1=month
                    year1=year
                }
            }
        }
        Text{
            text: "Day"
            font.pixelSize: parent.width*0.04
            x:parent.width*0.26
            y:parent.height*0.27
            color: "white"
        }
        Text{
            text: "Month"
            font.pixelSize: parent.width*0.04
            x:parent.width*0.47
            y:parent.height*0.27
            color: "white"
        }
        Text{
            text: "Year"
            font.pixelSize: parent.width*0.04
            x:parent.width*0.71
            y:parent.height*0.27
            color: "white"
        }
    }
    Rectangle{
        id: timeRectId
        width: parent.width*0.8
        height: parent.height*0.8
        y:parent.height*0.09
        color: "black"
        border.width: parent.width*0.001
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "white"
        visible: false
        Text{
            text: "Hour"
            font.pixelSize: parent.width*0.04
            x:parent.width*0.26
            y:parent.height*0.27
            color: "white"
        }
        Text{
            text: "Minute"
            font.pixelSize: parent.width*0.04
            x:parent.width*0.47
            y:parent.height*0.27
            color: "white"
        }
        Text {
            text: qsTr(":")
            font.pixelSize: parent.width*0.15
            y:parent.height*0.315
            x:parent.width*0.385
            color: "white"
        }
        Image {
            width: parent.width*0.04
            height: parent.height*0.06
            y:parent.height*0.085
            anchors.right: parent.right
            anchors.rightMargin: parent.height*0.1
            source: "images/close_white-removebg-preview.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mainRectId.visible=true
                    timeRectId.visible=false
                }
            }
        }
        Rectangle{
            x: parent.width*0.08
            y:parent.height*0.33
            width: parent.width*0.07
            height: parent.height*0.11
            radius: parent.width*0.07/2
            color: "#7296c4"
            Image {
                anchors.centerIn: parent
                width: parent.width*0.35
                height: parent.height*0.5
                source: "images/upkey-removebg-preview-removebg-preview (1).png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    // console.log(t24Id.color)
                    if(t24Id.color!="#008000"){
                        if(timeHourId.color=="#5fffff"){
                            if(hour<12){
                                hour+=1
                            }else if(hour===12){
                                hour=1
                            }else{}
                        }else{
                            if(min<59){
                                min+=1
                            }else if(min===59){
                                min=0
                            }else{}
                        }
                    }else{
                        if(timeHourId.color=="#5fffff"){
                            if(hour<23){
                                hour+=1
                            }else if(hour===23){
                                hour=0
                            }else{}
                        }else{
                            if(min<59){
                                min+=1
                            }else if(min===59){
                                min=0
                            }else{}
                        }
                    }
                }
            }
        }
        Rectangle{
            x: parent.width*0.08
            y:parent.height*0.52
            width: parent.width*0.07
            height: parent.height*0.11
            radius: parent.width*0.07/2
            color: "#7296c4"
            Image {
                anchors.centerIn: parent
                width: parent.width*0.35
                height: parent.height*0.5
                source: "images/downkey-removebg-preview-removebg-preview (1).png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(t24Id.color!="#008000"){
                        if(timeHourId.color=="#5fffff"){
                            if(hour>1){
                                hour-=1
                            }else if(hour===1){
                                hour=12
                            }else{}
                        }else{
                            if(min>0){
                                min-=1
                            }else if(min===0){
                                min=59
                            }else{}
                        }
                    }else{
                        if(timeHourId.color=="#5fffff"){
                            if(hour>0){
                                hour-=1
                            }else if(hour===0){
                                hour=23
                            }
                        }else{
                            if(min>0){
                                min-=1
                            }else if(min===0){
                                min=59
                            }else{}
                        }
                    }
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*0.23
            color: "black"
            anchors.verticalCenter: parent.verticalCenter
            x:parent.width*0.2
            border.width: parent.width*0.001
            border.color: "#6481c7"
            Rectangle{
                anchors.centerIn: parent
                width: parent.width*0.88
                height: parent.height*0.88
                color: "#6481c7"
                Text {
                    id: timeHourId
                    text: ((hour<10)?"0"+hour:hour)
                    color: "#5fffff"
                    font.pixelSize: parent.width*0.3
                    anchors.centerIn: parent
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timeHourId.color="#5fffff"
                    timeMinuteId.color="white"
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*0.23
            color: "black"
            anchors.verticalCenter: parent.verticalCenter
            x:parent.width*0.425
            border.width: parent.width*0.001
            border.color: "#6481c7"
            Rectangle{
                anchors.centerIn: parent
                width: parent.width*0.88
                height: parent.height*0.88
                color: "#6481c7"
                Text {
                    id: timeMinuteId
                    text: ((min<10)?"0"+min:min)
                    color: "white"
                    font.pixelSize: parent.width*0.3
                    anchors.centerIn: parent
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timeMinuteId.color="#5fffff"
                    timeHourId.color="white"
                }
            }
        }
        Rectangle{
            id: ampmId
            width: parent.width*0.2
            height: parent.height*0.08
            x:parent.width*0.7
            y:parent.height*0.4
            radius: parent.width*0.02
            color: "black"
            Rectangle{
                id: amId
                width: parent.width*0.45
                height: parent.height
                radius: parent.width*0.02
                color: "green"
                Text {
                    id: amTextId
                    text: qsTr("AM")
                    anchors.centerIn: parent
                    font.pixelSize: parent.width*0.3
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        amId.color="green"
                        amTextId.color="white"
                        pmId.color="white"
                        pmTextId.color="black"
                        ampm="AM"
                    }
                }
            }
            Rectangle{
                id: pmId
                width: parent.width*0.45
                height: parent.height
                radius: parent.width*0.02
                x:parent.width*0.46
                Text {
                    id: pmTextId
                    text: qsTr("PM")
                    anchors.centerIn: parent
                    font.pixelSize: parent.width*0.3
                    // color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        amId.color="white"
                        amTextId.color="black"
                        pmId.color="green"
                        pmTextId.color="white"
                        ampm="PM"
                    }
                }
            }
        }
        Rectangle{
            width: parent.width*0.2
            height: parent.height*0.08
            x:parent.width*0.7
            y:parent.height*0.52
            radius: parent.width*0.02
            color: "black"
            Rectangle{
                id: t12Id
                width: parent.width*0.45
                height: parent.height
                radius: parent.width*0.02
                color: "green"
                Text {
                    id: t12TextId
                    text: qsTr("12hrs")
                    anchors.centerIn: parent
                    font.pixelSize: parent.width*0.3
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        t12Id.color="green"
                        t12TextId.color="white"
                        t24Id.color="white"
                        t24TextId.color="black"
                        amId.color="green"
                        amTextId.color="white"
                        pmId.color="white"
                        pmTextId.color="black"
                        ampmId.enabled=true
                        ampmId.opacity=1
                        hour=11
                    }
                }
            }
            Rectangle{
                id: t24Id
                width: parent.width*0.45
                height: parent.height
                radius: parent.width*0.02
                x:parent.width*0.46
                Text {
                    id: t24TextId
                    text: qsTr("24hrs")
                    anchors.centerIn: parent
                    font.pixelSize: parent.width*0.3
                    color: "black"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        t12Id.color="white"
                        t12TextId.color="black"
                        t24Id.color="green"
                        t24TextId.color="white"
                        amId.color="white"
                        amTextId.color="black"
                        pmId.color="white"
                        pmTextId.color="black"
                        ampmId.enabled=false
                        ampmId.opacity=0.2
                        ampm=""
                    }
                }
            }

        }

        Rectangle{
            width: parent.width*0.2
            height: parent.height*.1
            color: "#51d100"
            anchors.horizontalCenter: parent.horizontalCenter
            y:parent.height*0.82
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
                    timeRectId.visible=false
                    mainRectId.visible=true
                    hour1=hour
                    min1=min
                }
            }
        }
    }

}
