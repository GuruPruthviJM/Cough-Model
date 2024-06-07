import QtQuick 2.15

Item {
    id: bodyItemId
    width: windowId.width
    height: windowId.height
    // opacity: 0.5
    // property string idHolder: ""
    property int mVal: 7
    property real slideval: 2.5
    property string idHolder: ""
    property var idHo: ""
    property bool visi: true
    property string p: "value"
    signal toZommer(int mVal, real sVal, real xaxis,string rect_color,string text_col,bool visi,string idhold)
    function retriveData(selectedName){
        var userInfo = user.retrieveUserInfo(selectedName);
        pauseId.mainValue = parseFloat(userInfo['Pause_Pressure_Main_Value']);
        pauseId.sliderVal = parseFloat(userInfo['Pause_Pressure_Slider_Value']);
        pressureId.mainValue = parseFloat(userInfo['Insp_Pressure_Main_Value']);
        pressureId.sliderVal = parseFloat(userInfo['Insp_Pressure_Slider_Value']);
        expId.mainValue = parseFloat(userInfo['Exp_Pressure_Main_Value']);
        expId.sliderVal = parseFloat(userInfo['Exp_Pressure_Slider_Value']);
    }
    function fromZoomer(texVal,slidevalue){
        idHo.mainValue=texVal
        idHo.sliderVal=slidevalue
    }
    function fromNav(){
        visi=!visi
    }
    property var val_holder: []
    function retrivingDataToProfile(){
        val_holder=[]
        val_holder.push(pauseId.mainValue, pauseId.sliderVal.toFixed(1), pressureId.mainValue, pressureId.sliderVal.toFixed(1), expId.mainValue, expId.sliderVal.toFixed(1));
        return val_holder;
    }
    Rect_home{
        id: pauseId
        mainValue: mVal
        typeName: "Pause Pressure"
        rectCol: "green"
        textCol: "#a8fdc2"
        sliderVal: slideval
        fromVal: 0
        toVal: 5
        slideId.visible: visi
        MouseArea{
            anchors.fill: pauseId
            onClicked: {
                bodyItemId.opacity=0.2
                idHolder="pauseId"
                idHo=pauseId
                toZommer(pauseId.mainValue,pauseId.sliderVal,0,"green","#a8fdc2",visi,idHolder)
            }
        }
    }
    Rect_home{
        id:pressureId
        x: parent.width*0.34
        mainValue: 30
        typeName: "Insp. Pressure"
        sliderVal: slideval
        rectCol: "#436eba"
        textCol: "#2ae4f2"
        fromVal: 0
        toVal: 5
        slideId.visible: visi
        pUni: "cm H20"
        MouseArea{
            anchors.fill: pressureId
            onClicked: {
                bodyItemId.opacity=0.2
                idHolder="pressureId"
                idHo=pressureId
                toZommer(pressureId.mainValue,pressureId.sliderVal,parent.width*0.75,"#436eba","#2ae4f2",visi,idHolder)
            }
        }
    }
    Rect_home{
        id: expId
        x: parent.width*0.68
        mainValue: -33
        typeName: "Exp. Pressure"
        rectCol: "#947659"
        textCol: "#fbf700"
        sliderVal: slideval
        fromVal: 0
        toVal: 5
        slideId.visible: visi
        pUni: "cm H20"
        MouseArea{
            anchors.fill: expId
            onClicked: {
                bodyItemId.opacity=0.2
                idHolder="expId"
                idHo=expId
                toZommer(expId.mainValue,expId.sliderVal,parent.width*1.5,"#947659","#fbf700",visi,idHolder)
            }
        }
    }
}
