// import QtQuick 1.0 // to target Maemo 5
import QtQuick 1.1
import "Tools"

Rectangle {
    id: rectangle1
    width: 1024
    height: 768
    //On charge la police
    color: "black"

    function checkDate(){
        //Check date evry day
        //cmp var
        var str1 = new String(horloge.getTime());
        var str2 = new String( "00:00:00" );

        console.debug("GetTime = " + horloge.getTime())
        if(!str1.localeCompare( str2 )){
            //If time get 00:00:00 update date
            date.setDate();
        }
    }
    function setTime(){
        checkDate();
        horloge.nowTime = horloge.getTime();
    }
    Weather{
        id: weather
        x: 0
        y: 568
        width: 400
        height: 200
        color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }

    Horloge{
        id: horloge
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        fontSize: 100
        nowTime: getTime()
        z:1
    }
    Date{
        id: date
        width: 600
        height: 100
        anchors.horizontalCenter: horloge.horizontalCenter
        anchors.top: horloge.bottom
        anchors.topMargin: 0
        fontSize: 40
        nowDate: getDate()
        z:1
    }
//    FluxRSS{
//        id: fluxRss
//        width: 300
//        height: 300
//        anchors.left: parent.left
//        anchors.leftMargin: 0
//    }
    FluxIngesup{
        id: fluxInge
        x: 350
        y: 200
        width: 500
        z:0
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(fluxRss.isHide)
                fluxRss.show()
            else
                fluxRss.hide()
        }
    }
    Timer{
        id: timer
//        interval: 60000; running: true; repeat: true;
        interval: 1000; running: true; repeat: true;
        onTriggered: {
            setTime();
        }
    }
}
