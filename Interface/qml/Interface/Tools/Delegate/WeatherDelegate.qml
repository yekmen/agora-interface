import QtQuick 1.1

Item{
    id: delegateRect
//    anchors.fill: parent
    property string iconID
    property string tempMin
    property string tempMax
    property string timestamp
    width: 200
    height: 200
    onIconIDChanged: {
        console.debug("IconID changed : " + iconID)
        icon.source = iconChecker(iconID)
    }
    onTempMaxChanged: txtMax.text = "Maximal : " + Math.round(tempMax) + "°C"
    onTempMinChanged: txtMin.text = "Minimal : " + Math.round(tempMin) + "°C"
    onTimestampChanged: {
        txtDate.text = timestampConverter(timestamp)
    }

    function iconChecker(iconID){
        var ret;
        switch(iconID){
        case "01d": //soleil
            ret = "qrc:/soleil"
            break;
        case "02d": //soleil + nuage
            ret = "qrc:/soleilCloud"
            break;
        case "03d": //nuage
            ret = "qrc:/nuage"
            break;
        case "04d": //nuage
            ret = "qrc:/nuage"
            break;
        case "09d": //pluie
            ret = "qrc:/pluie"
            break;
        case "10d": //pluie
            ret = "qrc:/pluie"
            break;
        case "11d": //orage
            ret = "qrc:/orage"
            break;
        case "13d": //neige
            ret = "qrc:/neige"
            break;
        case "50d":     //brouillard
            ret = "qrc:/fog"
            break;
        default:
//            console.debug("Inconnu : " + iconID)
            break;
        }
        console.debug("RET : " + ret);
        return ret;

    }
    Text{
        id: txtDate
        height: 25
        color: "white"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        opacity: 0.5
    }

    Image {
        id: icon
        height: 100
        anchors.top: txtDate.bottom
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit

        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
    }
    Text{
        id: txtMin
        text: tempMin
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 18
        font.bold: true
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: icon.bottom
        anchors.topMargin: 10
        color: "white"
        opacity: 0.5
    }
    Text {
        id: txtMax
        text: tempMax
        font.bold: true
        font.pointSize: 18
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: txtMin.bottom
        anchors.topMargin: 10
        color: "white"
        opacity: 0.5
    }
}
