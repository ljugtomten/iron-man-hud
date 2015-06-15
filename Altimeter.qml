import QtQuick 2.0

Item{
    id:root
    width: 100
    height:1000
    property int value: 300
    property int maxValue: 5000
    property int majorTickInterval:100
    property int minorTickInterval:20
    property color color: "lightgray"

    //Behavior on value {NumberAnimation{}}
    Item{
        id: main

        width: parent.width
        height: parent.height*5

        Rectangle{
            id:tickmarks
            width: 1
            color:root.color
            anchors.top:parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            id: minorTicks
            anchors.horizontalCenter: parent.horizontalCenter
            property int nrOfElements: maxValue/minorTickInterval
            Repeater {
                model: minorTicks.nrOfElements
                Item
                {
                    Rectangle {
                        id:minorTick
                        y: (tickmarks.height/minorTicks.nrOfElements)*index
                        width: 5; height: 1
                        color:Qt.darker(root.color)
                    }
                }
            }
        }
        Column {
            id: majorTicks
            anchors.horizontalCenter: parent.horizontalCenter
            property int nrOfElements: maxValue/majorTickInterval
            Repeater {
                model: majorTicks.nrOfElements
                Item
                {
                    Rectangle {
                        id:majorTick
                        color:root.color
                        y: (tickmarks.height/majorTicks.nrOfElements)*index
                        width: 10; height: 2
                    }
                    Text {
                        anchors.verticalCenter: majorTick.verticalCenter
                        anchors.left:majorTick.right
                        anchors.leftMargin: majorTick.width/2
                        text: index*majorTickInterval
                        font.pixelSize: majorTick.width * 1.2
                        color:root.color
                    }
                }
            }
        }

        Rectangle{
            id:currentValue
            x: root.width/3
            y: (value/maxValue)*tickmarks.height -height/2
            Behavior on y{NumberAnimation{easing.type: Easing.InOutQuad }}

            width: root.width*0.8
            height: root.width/5
            color:"black"
            border.width: 2
            border.color: root.color

            Text{
                anchors.centerIn: parent
                text: value
                font.pixelSize: parent.height
                color:Qt.lighter(root.color)
            }

            Rectangle{
                width: parent.width*0.35
                height: parent.height*10
                anchors.verticalCenter:  parent.verticalCenter
                x:3
                border.color:"#404040"
                border.width: 2
                color:"transparent"
                radius: 5
                z:-10
            }
        }
    }
    Rectangle{
        id:verticalFog
        width:parent.width
        height:parent.height*5
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        gradient:  Gradient {
            GradientStop {position: 0.4; color: "black"}
            GradientStop {position: 0.5; color: "transparent"}
            GradientStop {position: 0.6; color: "black"}
        }
    }
}
