import QtQuick 1.1
Rectangle{
    id: mainRect
    z:50
    color: "black"
    width: 500
    height: 310
    border.color: "gray"
    radius: 10
    property int currentIndex: 0
    property string titleName
    function slide(){
        listView.currentIndex = currentIndex;
        if(listView.count > currentIndex)
            currentIndex++;
        else
            currentIndex = 0;
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
            text: titleName
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            color: "white"
            opacity: 0.6
        }
    }

    Rectangle {
        id: fluxRect
        color: "black"
        anchors.bottomMargin: 10
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.topMargin: 10
        anchors.fill: parent
//        width: parent.width -10
//        height: parent.height -10
        z:1


        Component.onCompleted: {
            xmlModel.reload()
        }

        XmlListModel{
            id: xmlModel
            source: "http://www.ingesup.com/ecole/news/?format=feed&amp;type=rss"
            query: "/rss/channel/item"
            XmlRole { name: "image/url"; query: "url/string()" }
            XmlRole { name: "titre"; query: "title/string()" }
            XmlRole { name: "description"; query: "description/string()" }
            XmlRole { name: "pubDate"; query: "pubDate/string()" }
            XmlRole { name: "author"; query: "author/string()" }

        }
        Timer{
            id: timer
            interval: 1000; running: true; repeat: true;
            onTriggered: {
                slide();
            }
        }
        ListView{
            id: listView
            snapMode: ListView.SnapOneItem
            anchors.fill: parent
            model: xmlModel
            z:0
            delegate: Delegate{
                id: delegate
            }
        }


    }
}
