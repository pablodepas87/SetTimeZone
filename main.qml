import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0


Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        id: text1
        x: 226
        y: 90
        width: 188
        height: 41
        text: qsTr("")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 50

    }

    GridView {
        id: gridView
        anchors.horizontalCenter: parent.horizontalCenter
        width: 500
        height: 200
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        cellWidth: 125
        cellHeight: 100
        delegate: Item {
            width: gridView.cellWidth
            height: gridView.cellHeight
            Button{

                anchors.centerIn: parent
                width:parent.width-5
                height: 95
                text: city
                onClicked: timeZone.cambioFusoOrario(fuso)
            }

        }
        interactive: false
        model: ListModel{

          ListElement{city:"Roma"; fuso:2}
          ListElement{city:"Tokyo";fuso: 9}
          ListElement{city:"Lisbona"; fuso:1}
          ListElement{city:"Madrid"; fuso:2}
          ListElement{city:"Buenos Aires";fuso:-3}
          ListElement{city:"Los Angeles";fuso:-7}
          ListElement{city:"Shangai";fuso:8}
          ListElement{city:"Mumbasa";fuso:3}

        }
    }

    Connections{

      target: timeZone
      onDateTimeChanged: {

         text1.text=Qt.formatTime(dataFusoOrario,"hh:mm:ss")



      }

    }


}
