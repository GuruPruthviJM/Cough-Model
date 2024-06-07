import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
Window {
    id: windowId
    width: 1000
    height: 620
    visible: true
    title: qsTr("Hello World")
    color: "black"
    property int pCycleValue: 0
    property int rotationAngle: 0
    function getCurrentDateTime() {
        var currentDateTime = new Date();
        var year = currentDateTime.getFullYear();
        var month = ("0" + (currentDateTime.getMonth() + 1)).slice(-2);
        var day = ("0" + currentDateTime.getDate()).slice(-2);
        var hours = ("0" + currentDateTime.getHours()).slice(-2);
        var minutes = ("0" + currentDateTime.getMinutes()).slice(-2);
        var seconds = ("0" + currentDateTime.getSeconds()).slice(-2);
        var ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12;
        return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds + " " + ampm;
    }
    function rotateScreen() {
        rotationAngle += 180
        if (rotationAngle >= 360)
            rotationAngle = 0
        windowId.contentItem.rotation = rotationAngle
    }
    Device_Info{
        visible: false
    }
    Navigation{
        id: navId
        opacity: 0.2
        enabled: false
        onToPasswordDrawer: {
            passwordDrawerId.fromNavigation()
            bodyId.opacity=0.2
            bodyId.enabled=false
            navId.enabled=false
            footerId.enabled=false
        }
        onToDateTime: {
            dateId.visible=true
            navId.opacity=0.2
            bodyId.opacity=0.2
            footerId.opacity=0.2
            navId.enabled=false
            bodyId.enabled=false
            footerId.enabled=false
        }
        onToProfile: {
            vtId.fromNavigation(g)
        }
        onToFooter: {
            footerId.fromNav()
            pleaseId.fromNav()
            navId.opacity=0.2
            bodyId.opacity=0.2
            footerId.opacity=0.2
        }
        onToDrawer: {
            drawerId.fromNav(index)
        }
        onToPlease: {
            bodyId.opacity=0.2
            navId.opacity=0.2
            footerId.opacity=0.2
            pleaseId.fromNav()
            bodyId.enabled=false
            navId.enabled=false
            footerId.enabled=false
        }
        onToBody: {
            bodyId.fromNav()
        }
        onToPopUp: {
            popId.type1=(popId.type1==="Auto")?"Manual":"Auto"
        }
    }
    Body{
        id: bodyId
        opacity: 0.2
        enabled: false
        onToZommer: {
            zoomerId.fromBody(mVal,sVal,xaxis,rect_color,text_col,visi,idhold)
            bodyId.enabled=false
            footerId.enabled=false
            navId.enabled=false
            footerId.opacity=0.2
        }
    }
    Footer{
        id: footerId
        opacity: 0.2
        enabled: false
        onToDrawer: {
            drawerId.fromFooter()
        }
        onToBodyZoom: {
            navId.opacity=0.2
            bodyId.opacity=0.2
            bodyId.enabled=false
            navId.enabled=false
        }
        onToBodyFinal: {
            navId.opacity=1
            bodyId.opacity=1
            footerId.opacity=1
            bodyId.enabled=true
            footerId.enabled=true
            navId.enabled=true
        }
        onToResume_play: {
            resumeId.visible=true
            navId.opacity=0.2
            footerId.opacity=0.2
            bodyId.opacity=0.2
            navId.enabled=false
            footerId.enabled=false
            bodyId.enabled=false
            resumeId.fromFooter()
        }
        onToPopUp: {
            popId.formattedDateTime=  popId.getCurrentDateTime()
        }
    }
    Tooglebar{
        id: togId
        visible: false
    }

    Drawer_Custom{
        id: drawerId
        onToDeviceLog: {
            dLogId.visible=true
            systemLogId.visible=true
            // systemLogId.updat()
        }
        onToProfile: {
            vtId.fromFooter()
        }
        onToConfirm:{
            confirmId.fromDrawer()
        }

        onToPassword: {
            passwordDrawerId.fromDrawer()
        }
    }
    Zoomer{
        id: zoomerId
        onToBody: {
            bodyId.fromZoomer(textVal,slidevalue)
        }
        onToBodyFinal: {
            bodyId.opacity=1
            bodyId.enabled=true
            footerId.enabled=true
            navId.enabled=true
            footerId.opacity=1
        }
        onToFooterSliderVal: {
            // console.log("guru")
            footerId.fromZoomerSlideVal(slideValue,idholder,decrOrIncr)
        }
        onToFooterMainVal: {
            footerId.fromZoomerMainVal(textValue,idholder,decrOrIncr)
        }
    }
    PopUp{
        id: popId
        visible: false
        countCycle: pCycleValue
    }
    DateTime{
        id:dateId
        visible: false
    }
    Resume_Play{
        id:resumeId
        visible: false
        onToPopUp: {
            popId.visible=true
            navId.opacity=1
            footerId.opacity=1
            bodyId.opacity=1
            footerId.fromResumeCancel()
            systemLog.insertData(windowId.getCurrentDateTime(),'THERAPY', 'THERAPY_COMPLETE')
        }
        onToFooter: {
            footerId.fromResumeResume()
        }
        onToFooterEnd: {
            popId.countCycle=footerId.cycleCount
            console.log(pCycleValue)
            footerId.cycleCount=0
            footerId.sec=0.0
        }
    }
    PasswordDrawer{
        id: passwordDrawerId
        onToDrawer: {
            drawerId.fromPassword()
        }
        onToCheck: {
            checkPasswordId.visible=true
            bodyId.opacity=0.2
            navId.opacity-0.2
            footerId.opacity=0.2
        }
        onToNav: {
            navId.fromPassword()
        }
        onToNavCancel: {
            navId.fromPasswordCancel()
        }
    }
    ProfileSaver{
        id: vtId
        onToNavigation: {
            navId.fromProfile(pName,fromWhere)
        }
        onToCheck: {
            checkPasswordId.fromProfile()
        }
        onToPlease: {
            pleaseId.fromNav()
        }
        onToOverWrite: {
            bodyId.opacity=0.2
            navId.opacity=0.2
            footerId.opacity=0.2
            overId.fromProfile(name,val)
        }
    }
    OverWrite{
        id: overId
        visible: false
    }

    PleaseWait{
        id: pleaseId
        // visible: false
    }
    Confirmation{
        id: confirmId
        onToNav: {
            navId.fromDrawer()
        }
    }
    CheckPassword{
        id: checkPasswordId
        visible: false
        onToPassword: {
            passwordDrawerId.fromCheck()
        }
        onToProfile: {
            vtId.fromCheck()
        }
    }
    Device_log{
        id: dLogId
        visible: false
    }
    System_log{
        id: systemLogId
        onToDrawer: {
            drawerId.fromDLog()
            dLogId.visible=false
            systemLogId.visible=false
        }
    }
    Monitor_log{
        id: monitorLogId
    }
    Tech_log{
        id: techLogId
    }

    Component.onCompleted: {
        systemLog.initializeDatabase();
        var date=getCurrentDateTime();
        systemLog.insertData(date,'DEVICE', 'DEVICE_POWER_ON');
        drawerCpp.createTable();
        user.createUserInfoTable();
    }
}
