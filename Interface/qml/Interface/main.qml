// import QtQuick 1.0 // to target Maemo 5
import QtQuick 1.1
import "Tools"
import ImageSearcher 1.0

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

//        console.debug("GetTime = " + horloge.getTime())
        if(!str1.localeCompare( str2 )){
            //If time get 00:00:00 update date
            date.setDate();
        }
    }
    function timestampConverter(time){
        var ret;
        var date = new Date(time*1000);
        // hours part from the timestamp
        var hours = date.getHours();
        // minutes part from the timestamp
        var minutes = date.getMinutes();
        // seconds part from the timestamp
        var seconds = date.getSeconds();
        //------------------- JOUR -------------------------//
        var day;
        switch(date.getDay()){
        case 1:
            day = "Lundi";
            break;
        case 2:
            day = "Mardi";
            break;
        case 3:
            day = "Mercredi";
            break;
        case 4:
            day = "Jeudi";
            break;
        case 5:
            day = "Vendredi";
            break;
        case 6:
            day = "Samedi";
            break;
        case 0:
            day = "Dimanche";
            break;
        default:
            console.debug("Day inconnu : " + date.getDay())
            break;
        }
        //------------------- MOIS -------------------------//
        var month;
        switch(date.getMonth()+1){
        case 1:
            month = "Janvier";
            break;
        case 2:
            month = "Février";
            break;
        case 3:
            month = "Mars";
            break;
        case 4:
            month = "Avril";
            break;
        case 5:
            month = "Mai";
            break;
        case 6:
            month = "Juin";
            break;
        case 7:
            month = "Juillet";
            break;
        case 8:
            month = "Août";
            break;
        case 9:
            month = "Septembre";
            break;
        case 10:
            month = "Octobre";
            break;
        case 11:
            month = "Novembre";
            break;
        case 12:
            month = "Décembre";
            break;
        default:
            console.debug("Mois inconnu : "+ date.getMonth())
            break;
        }

        var num = date.getDate();
        var year = date.getFullYear();
        // will display time in 10:30:23 format
        var formattedTime = hours + ':' + minutes + ':' + seconds;
        var formattedDate = day + " " + num + " " +month + " " + year;
        console.debug("Time : " + formattedTime + " " + formattedDate);

        return formattedDate;
    }

    function setTime(){
        checkDate();
        horloge.nowTime = horloge.getTime();
    }
    ImageSearcher{
        id: imageSearcher
    }

    Weather{
        id: weather
//        width: 200
//        height: 200
//        color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }

    Horloge{
        id: horloge
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 0
        width: 600
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
        width: 500
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 200
        z:0
    }

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            if(fluxRss.isHide)
//                fluxRss.show()
//            else
//                fluxRss.hide()
//        }
//    }
    Timer{
        id: timer
//        interval: 60000; running: true; repeat: true;
        interval: 1000; running: true; repeat: true;
        onTriggered: {
            setTime();
        }
    }
}
