// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    property int fontSize: 50
    property string nowDate: "Mercredi 23 Janvier 2013"
//    property int day
    width: 300
    height: 300
    color: "black"
    //86400000 = 1 jour

    function getDate(){
//        day =  Qt.formatDate(new Date(),"d");
//        console.debug("DAY : " + day)
        return Qt.formatDate(new Date(),"dddd d MMMM yyyy" );
    }
    function setDate(){
        txtDate.text = getDate();
    }
    FontLoader {
        id: myFont
        source: "../Font/Neou-Thin.otf"
    }
    Text {
        id: txtDate
        anchors.centerIn: parent
        text: nowDate
        font.family: myFont.name
        font.pixelSize: fontSize
        color: "white"
    }
}
