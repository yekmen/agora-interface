import QtQuick 1.1

Rectangle {
    width: 100
    height: 62
    function prt(){
        console.debug(xmlModel.get(0).temp)
    }
    Timer{
        id: timer
        interval: 1000; running: true; repeat: true;
        onTriggered: {
//            prt();
        }
    }

    XmlListModel{
        id: xmlModel
        source: "http://weather.yahooapis.com/forecastrss?u=c&q=Paris&language=fr-FR"
        query: "/rss/channel"
        XmlRole { name: "url"; query: "image/url/string()" }
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "temp"; query: "yweather/@temp/string()" }
    }
    ListView{
        id: listView
        anchors.fill: parent
        model: xmlModel
//        delegate: fluxDelegate
        delegate: Rectangle{
            id: mainRect
            width: 100
            height: 100
            anchors.right: parent.right
            anchors.left: parent.left
            color: "transparent"
            Image {
                id: icon
                height: 80
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                source: url
            }
            Text {
                id: info
                text: temp
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                verticalAlignment: Text.AlignVCenter
                anchors.top: icon.bottom
                anchors.topMargin: 0
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 14
                color: "white"
            }
        }
    }
}
