import QtQuick 2.0

Item{
    id:root
    width:25
    height:300

    property color color: "white"
    property color fromColor: "red"
    property color toColor: "yellow"
    property string title: "title"
    property real value: 100
    property real maxValue:100

    Rectangle{
         anchors.fill:parent
         border.width: 1
         border.color:root.color
         color:"transparent"
    }

    Item{
        id:outerbar
        anchors.fill:parent
        anchors.margins: 4

        Rectangle{
            id:bar
            anchors.fill:parent
            //anchors.margins: 10
            gradient:  Gradient {
                GradientStop {position: 0.0; color: fromColor}
                GradientStop {position: 1.0; color: toColor}
            }
        }
        Rectangle{
            id:bl
            anchors.left: parent.left
            anchors.right:parent.right
            anchors.top:parent.top
            height:parent.height -(parent.height/maxValue)*value
            color:"black"
            Behavior on height {NumberAnimation{}}
        }
        Column {
            id: minorTicks
            anchors.horizontalCenter: parent.horizontalCenter
            property int nrOfElements: 15
            Repeater {
                model: minorTicks.nrOfElements
                Item
                {
                    Rectangle {
                        id:minorTick
                        y: (bar.height/minorTicks.nrOfElements)*index
                        x: -width/2
                        width: bar.width; height: 4
                        color:"black"
                    }
                }
            }
        }
    }

    Rectangle{
        anchors.left: outerbar.right
        anchors.bottom: outerbar.top
        anchors.leftMargin: 5
        transformOrigin: Item.BottomLeft
        rotation:90
        width: 100
        height:20
        color:"transparent"
        Text{
            text: root.title
            color: root.color
            font.pixelSize: 15
        }
    }
}
