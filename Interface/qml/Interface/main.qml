// import QtQuick 1.0 // to target Maemo 5
import QtQuick 1.1
import "Tools"
//import ":/file/qml/Interface/Tools"

Rectangle {
    id: rectangle1
//    width: 1920
//    height: 1080
    width: 1024
    height: 768
    color: "black"
    state: "default"
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

    Weather{
        id: weather
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        z:100
    }

    DateTime{
        id: dateTime
        height: 200
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        z:100
    }

    FluxRSS{
        id: fluxRssRATP
        x: 501
        y: 200
        width: 400
        height: 310
        anchors.left: fluxInge.right
        anchors.leftMargin: 10
        anchors.top: dateTime.bottom
        anchors.topMargin: 30
        titleName: "Info RATP"
//        sourceOfRSS: "http://feeds2.feedburner.com/LeJournalduGeek"
        sourceOfRSS: "http://vianavigo.com/fr/actualites-trafic/rss-vianavigo-vos-transports-en-commun-en-ile-de-france-optile-ratp-sncf/?type=102"
    }

    FluxIngesup{
        id: fluxInge
        width: 500
        anchors.top: dateTime.bottom
        anchors.topMargin: 30
        z:0
        titleName: "Info INGESUP"
    }

    ImageViewer{
        id: imageViewer
        visible: false
    }

    states: [
        State {
            name: "image"
            PropertyChanges {
                target: weather
                opacity: 0
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
            }
            PropertyChanges {
                target: fluxRssRATP
                opacity: 1

            }
            PropertyChanges {
                target: fluxInge
                opacity: 0
            }
            PropertyChanges {
                target: imageViewer
                opacity: 0
                visible: true
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
            }
            PropertyChanges {
                target:dateTime
//                opacity: 0
                height: 200
                width: parent.width

                visible: true
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
                z:100
            }

        },
        State {
            name: "default"
            PropertyChanges {
                target: weather
                opacity: 1
            }
            PropertyChanges {
                target: fluxRssRATP
                opacity: 1
            }
            PropertyChanges {
                target: fluxInge
                opacity: 1
            }
            PropertyChanges {
                target: imageViewer
//                opacity: 1
                visible: false
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    ]


}
