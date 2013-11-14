// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: fluxRect
    color: "white"
    width: 300
    height: 300
    state: "hide"
    property bool isHide: true
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
        console.debug(xmlModel.get(0).title)
    }

    XmlListModel{
         id: xmlModel
//         source: "http://feeds2.feedburner.com/LeJournalduGeek"
         source: "http://weather.yahooapis.com/forecastrss?u=c&q=Paris&language=fr-FR"
//         query: "/rss/channel/item/"
         query: "/rss/channel"
         XmlRole { name: "image/url"; query: "url/string()" }
         XmlRole { name: "title"; query: "title/string()" }
//         XmlRole { name: "description"; query: "description/string()" }
         onProgressChanged: {
             console.debug("[Acceuil] Progression ... " + progress)
         }
     }
    Timer{
        id: timer
        interval: 1000; running: true; repeat: true;
        onTriggered: {
//            prt();
        }
    }

    ListView{
        id: listView
        anchors.fill: parent
        model: xmlModel
//        delegate: fluxDelegate
        delegate: Rectangle{
            id: mainRect
            anchors.right: parent.right
            anchors.left: parent.left
            color: "transparent"
            Rectangle{
                id: rectangle_title
                height: 22
                color: "#db667c"
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 1
                opacity: 0.6
                Text {
                    id: title
                    text: titre
                    font.pixelSize: 15
                    font.bold: true
                }
                Text {
                    id: info
                    x: 292
                    text: pubDate
                    verticalAlignment: Text.AlignVCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 14
                }
                MouseArea{
                    id: mouse
                    anchors.fill: parent
                    onClicked: console.debug("toto")
                }
            }
        }
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
