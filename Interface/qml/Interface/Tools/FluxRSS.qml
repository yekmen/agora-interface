// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "Delegate"
Rectangle{
    id: mainRect
    property string titleName
    property bool isHide: true
    property int currentIndex: 0
    property int timeOfSlide: 10000
    property string sourceOfRSS
    function slide(){
        listView.currentIndex = currentIndex;
        if(listView.count > currentIndex)
            currentIndex++;
        else
            currentIndex = 0;
    }
    width: 400
    height: 300
    radius: 10
    color: "black"
    border.color: "gray"
    border.width: 2
    z:10
    onSourceOfRSSChanged: {
        xmlModel.reload();
    }
    Component.onCompleted: {
        xmlModel.reload()
    }
    Rectangle{
        id: titleRect
        height: 30
        anchors.top: parent.top
        anchors.topMargin: -30
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        color: "black"
        z:50
        Text {
            id: title
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            color: "white"
            text: titleName
            opacity: 0.6
        }
    }
    Rectangle {
        id: fluxRect
        color: "black"
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.fill: parent
        XmlListModel{
            id: xmlModel
            source: sourceOfRSS
            query: "/rss/channel/item"
            namespaceDeclarations: "declare namespace content=\"http://purl.org/rss/1.0/modules/content/\";"
            XmlRole { name: "pubDate"; query: "pubDate/string()" }
            XmlRole { name: "titre"; query: "title/string()" }
            XmlRole { name: "description"; query: "description/string()" }
            XmlRole { name: "detail"; query: "content:encoded/string()" }
            onProgressChanged: {
                console.debug("[Acceuil] Progression ... " + progress)
            }
        }
        Timer{
            id: timer
            interval: 2000; running: true; repeat: true;
            onTriggered: {
                slide();
            }
        }

        ListView{
            id: listView
            anchors.fill: parent
            model: xmlModel
            z:0
            focus: true
            delegate: RSSDelegate{
            }
        }

    }
}


