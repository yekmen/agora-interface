import QtQuick 1.1
Rectangle {
    id: fluxRect
    color: "white"
    width: 300
    height: 300
    state: "hide"
    z:1
    property bool isHide: true
    property int currentIndex: 0
    Component.onCompleted: {
        xmlModel.reload()
    }
    function show(){
        fluxRect.state = "show"
        isHide = false;
    }
    function hide(){
        fluxRect.state = "hide"
        isHide = true;
    }
    function prt(){
//        console.debug(xmlModel.get(0).title)
        listView.currentIndex = currentIndex;
        if(listView.count > currentIndex)
            currentIndex++;
        else
            currentIndex = 0;
    }
    FontLoader {
        id: myFont
//        source: "../Font/minimal.otf"
    }

    XmlListModel{
         id: xmlModel
//         source: "http://feeds2.feedburner.com/LeJournalduGeek"
         source: "http://www.ingesup.com/ecole/news/?format=feed&amp;type=rss"
         query: "/rss/channel/item"
         XmlRole { name: "image/url"; query: "url/string()" }
         XmlRole { name: "titre"; query: "title/string()" }
         XmlRole { name: "description"; query: "description/string()" }
         XmlRole { name: "pubDate"; query: "pubDate/string()" }
         XmlRole { name: "author"; query: "author/string()" }
         onProgressChanged: {
             console.debug("[Acceuil] Progression ... " + progress)
         }
     }
    Timer{
        id: timer
        interval: 2000; running: true; repeat: true;
        onTriggered: {
            prt();
        }
    }
    Delegate{
        id: delegate
    }

    ListView{
        id: listView
        anchors.fill: parent
        model: xmlModel
        delegate: delegate
        z:0
    }

    //Déclaration des machines à états
    states: [
        State {
            name: "hide"
            PropertyChanges {
                target: fluxRect
                anchors.leftMargin: -fluxRect.width
            }
        },
        State {
            name: "show"
            PropertyChanges {
                target: fluxRect
                anchors.leftMargin: fluxRect.width
            }
        }

    ]
    transitions: [
        Transition {
            from: "*"
            to: "*"
            PropertyAnimation{properties: "anchors.leftMargin"; duration: 1000; easing.type: Easing.OutExpo}
        }
    ]
}
