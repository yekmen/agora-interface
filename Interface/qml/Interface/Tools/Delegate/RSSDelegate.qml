import QtQuick 1.1
Rectangle{
    id: mainRect
//    width: 300
    anchors.right: parent.right
    anchors.left: parent.left
    height: 100
    color: "black"
    z:-100
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
            color: "black"
        }
        Text {
            id: info
            x: 292
            visible: false
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

    Text {
        id: contenu
        text: detail
        wrapMode: Text.WordWrap
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectangle_title.bottom
        anchors.topMargin: 0
        textFormat: Text.RichText
        color: "white"
        onTextChanged: {
            var lenght = text.length;

            if(lenght < 700)
                mainRect.height = 200
            else if(lenght > 700 && lenght < 900)
                mainRect.height = 300
            else if(lenght > 900 && lenght < 1000)
                mainRect.height = 320
            else if(lenght > 1000 && lenght < 1200)
                mainRect.height = 330
            else if(lenght > 1200 && lenght < 1500)
                mainRect.height = 380
            else
                mainRect.height = 500
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
//                console.debug("Taille !! " + contenu.text.length)
                console.debug("Taille !! " + mainRect.height)
            }
        }

    }
}
