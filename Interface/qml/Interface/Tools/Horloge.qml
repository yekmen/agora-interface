// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    property int fontSize: 50
    property string nowTime: "12:10"
    width: 300
    height: 300
    color: "black"
    function getTime(){
            return Qt.formatTime(new Date(), "hh:mm:ss")
    }
    function setTime(){
        txtHorloge.text = getTime();
    }
    FontLoader {
        id: myFont
        source: "../Font/Neou-Thin.otf"
    }
    Text {
        id: txtHorloge
        anchors.centerIn: parent
        text: nowTime
        font.family: myFont.name
        font.pixelSize: fontSize
        color: "white"
    }
}
