// import QtQuick 1.0 // to target Maemo 5
import QtQuick 1.1
import "Tools"
//import ":/file/qml/Interface/Tools"

import ImageSearcher 1.0

Rectangle {
    id: rectangle1
//    width: 1920
//    height: 1080
    width: 1024
    height: 768
    color: "black"
    function checkDate(){
        //Check date evry day
        //cmp var
        var str1 = new String(horloge.getTime());
        var str2 = new String( "00:00:00" );

//        console.debug("GetTime = " + horloge.getTime())
        //------------ NEW DAY ----------------//
        if(!str1.localeCompare( str2 )){
            //If time get 00:00:00 update date
            date.setDate();
            weather.update();
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
        z:100
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
//        width: 600
        width: parent.width
        height: 100
        anchors.horizontalCenter: horloge.horizontalCenter
        anchors.top: horloge.bottom
        anchors.topMargin: 0
        fontSize: 40
        nowDate: getDate()
        z:100
    }

    FluxRSS{
        id: fluxRssRATP
        width: 400
        height: 310
        anchors.left: fluxInge.right
        anchors.leftMargin: 5
        anchors.top: date.bottom
        anchors.topMargin: 30
        titleName: "Info RATP"
//        sourceOfRSS: "http://feeds2.feedburner.com/LeJournalduGeek"
        sourceOfRSS: "http://vianavigo.com/fr/actualites-trafic/rss-vianavigo-vos-transports-en-commun-en-ile-de-france-optile-ratp-sncf/?type=102"
//        width: 300
//        height: 300
    }
//    FluxRSS{
//        id: fluxRssGeek
//        width: 300
//        height: 200
//        anchors.left: fluxInge.right
//        anchors.leftMargin: 0
//        anchors.top: fluxRssRATP.bottom
//        anchors.topMargin: 0
//        sourceOfRSS: "http://feeds2.feedburner.com/LeJournalduGeek"
////        sourceOfRSS: "http://vianavigo.com/fr/actualites-trafic/rss-vianavigo-vos-transports-en-commun-en-ile-de-france-optile-ratp-sncf/?type=102"
////        width: 300
////        height: 300
//    }
    FluxIngesup{
        id: fluxInge
        y: 200
        width: 500
        anchors.top: date.bottom
        anchors.topMargin: 30
        z:0
        titleName: "Info INGESUP"

//        Rectangle{
////            width: 200
//            height: 30
//            anchors.top: parent.top
//            anchors.topMargin: -30
//            anchors.left: parent.left
//            anchors.leftMargin: 0
//            anchors.right: parent.right
//            color: "black"
//            Text {
//                id: infoIngesup
//                anchors.fill: parent
//                text: qsTr("Information INGESUP")
//                font.family: fontIngesup.name
//                color: "white"
//            }
//            FontLoader {
//                id: fontIngesup
//                source: "Font/OldSansBlack.ttf"
//            }
//        }
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
