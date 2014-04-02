// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 600
    height: horloge.height + date.height
    function setTime(){
        checkDate();
        horloge.nowTime = horloge.getTime();
    }
    function checkDate(){
        //Check date evry day
        var str1 = new String(horloge.getTime());
        var str2 = new String( "00:00:00" );

        //------------ NEW DAY ----------------//
        if(!str1.localeCompare( str2 )){
            //If time get 00:00:00 update date
            date.setDate();
            weather.update();
        }
    }
    Horloge{
        id: horloge
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 0
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        fontSize: 100
        nowTime: getTime()
        z:100
    }
    Date{
        id: date
        width: parent.width
        height: 100
        anchors.horizontalCenter: horloge.horizontalCenter
        anchors.top: horloge.bottom
        anchors.topMargin: 0
        fontSize: 40
        nowDate: getDate()
        z:100
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
