// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "Delegate"
Rectangle {
    id: fluxRect
    color: "white"
    width: 300
    height: 300
    z:1
    property bool isHide: true
    property int currentIndex: 0
    property int timeOfSlide: 10000
    property string sourceOfRSS
    onSourceOfRSSChanged: {
        xmlModel.reload();
    }

    Component.onCompleted: {
        xmlModel.reload()
    }

    function slide(){
        listView.currentIndex = currentIndex;
        if(listView.count > currentIndex)
            currentIndex++;
        else
            currentIndex = 0;
    }

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
        delegate: RSSDelegate{

        }
    }

}
