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
                onClicked: timeZone.cambioFusoOrario(index)
            }

        }
        interactive: false
        model: ListModel{

          ListElement{city:"Roma"}
          ListElement{city:"Tokyo"}
          ListElement{city:"Lisbona"}
          ListElement{city:"Roma"}
          ListElement{city:"Roma"}
          ListElement{city:"Roma"}
          ListElement{city:"Roma"}
          ListElement{city:"Roma"}

        }
    }

    Connections{

      target: timeZone
      onDateTimeChanged: {

          print (dataFusoOrario)


      }

    }


}
