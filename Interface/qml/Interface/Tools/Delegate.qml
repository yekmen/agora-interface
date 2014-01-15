import QtQuick 1.1
Component
{
    Rectangle{
                id: mainRect
                width: 500
                height: 150
                anchors.right: parent.right
                anchors.left: parent.left
                color: "black"
                z:0
                Rectangle{
                    id: rectangle_title
                    height: 20
                    color: "#6668db"
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 1
                    opacity: 0.6
                    Text {
                        id: title
                        color: "#ffffff"
                        text: titre
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 15
                        font.bold: true
                        font.family: myFont.name
                        Component.onCompleted: {

                        }
                        onTextChanged: {

                            console.debug("Test changed : " + text.length + " : " + text)
                        }
                    }
                    Text {
                        id: info
                        x: 292
                        text: pubDate
                        visible: false
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 14
                        font.family: myFont.name
                    }
                }
                Text {
                    id: contentText
                    color: "#ffffff"
                    text: description
                    wrapMode: Text.WordWrap
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    verticalAlignment: Text.AlignVCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: rectangle_title.bottom
                    anchors.topMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 14
                    font.family: myFont.name
                }

                Text {
                    id: authorText
                    x: 227
                    y: 136
                    color: "#ffffff"
                    text: author
                    horizontalAlignment: Text.AlignRight
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    font.pixelSize: 12
                }
    }
}
