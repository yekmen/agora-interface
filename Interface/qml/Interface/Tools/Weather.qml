import QtQuick 1.1
import "../JSON"
import "Delegate"
Rectangle {
    id: rectangle1
    width: 600
    height: 200
    color: "black"
//    Timer{
//        id: timer
//        interval: 1000; running: true; repeat: true;
//        onTriggered: {
////            prt();
//        }
//    }
    function update(){
        console.debug("Update Weather ..." + jsonModel.model.get(0).JSON.dt)
        jsonModel.updateJSONModel()
    }

    JSONListModel{
        id: jsonModel
        source: "http://api.openweathermap.org/data/2.5/forecast/daily?q=Paris&mode=json&units=metric&cnt=3"
        query: "$.list[*]"
        onLoadingFinished: {
            console.debug("Weather date getting OK ! " + jsonModel.model.get(0).JSON.dt)
            today.iconID = jsonModel.model.get(0).iconID
            today.tempMin = jsonModel.model.get(0).tempMin
            today.tempMax = jsonModel.model.get(0).tempMax
            today.timestamp = jsonModel.model.get(0).JSON.dt

            dayPlus1.iconID = jsonModel.model.get(1).iconID
            dayPlus1.tempMin = jsonModel.model.get(1).tempMin
            dayPlus1.tempMax = jsonModel.model.get(1).tempMax
            dayPlus1.timestamp = jsonModel.model.get(1).JSON.dt

            dayPlus2.iconID = jsonModel.model.get(2).iconID
            dayPlus2.tempMin = jsonModel.model.get(2).tempMin
            dayPlus2.tempMax = jsonModel.model.get(2).tempMax
            dayPlus2.timestamp = jsonModel.model.get(2).JSON.dt
        }
    }

    WeatherDelegate{
        id: today
        width: 200
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }
    WeatherDelegate{
        id: dayPlus1
        width: 200
//        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: today.right
        anchors.leftMargin: 0
    }
    WeatherDelegate{
        id: dayPlus2
        width: 200
//        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: dayPlus1.right
        anchors.leftMargin: 0
    }
}
