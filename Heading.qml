import QtQuick 2.0



Item{
    id:root
    width: 500
    height: 50
    property int  heading: 176
    property color color: "lightgray"

    Item{
        width: parent.width *2
        height: parent.height
        x: -(width/360 * heading -parent.width/2)
        Behavior on x {NumberAnimation{easing.type: Easing.InOutQuad }}

        Rectangle{
            id:tickmarks
            height: 1
            color:root.color
            anchors.left:parent.left
            anchors.right: parent.right
            anchors.verticalCenter:  parent.verticalCenter
        }

        Column {
            id: minorTicks
            anchors.verticalCenter:  parent.verticalCenter
            property int nrOfElements: 360
            Repeater {
                model: minorTicks.nrOfElements
                Item
                {
                    Rectangle {
                        id:minorTick
                        x: (tickmarks.width/minorTicks.nrOfElements)*index
                        y:-height*1.5
                        width: 1; height: 5
                        color:Qt.darker(root.color)
                    }
                }
            }
        }

        Column {
            id: majorTicks
            anchors.verticalCenter:  parent.verticalCenter
            property int nrOfElements: 36
            Repeater {
                model: majorTicks.nrOfElements
                Item
                {
                    Rectangle {
                        id:majorTick
                        color:root.color
                        x: (tickmarks.width/majorTicks.nrOfElements)*index
                        y: -height
                        width: 2; height: 10
                    }
                    Text {
                        anchors.horizontalCenter: majorTick.horizontalCenter
                        anchors.bottom:majorTick.top
                        anchors.bottomMargin: majorTick.width/2
                        text: index*10
                        font.pixelSize: majorTick.height * 1.2
                        color:root.color
                    }
                }
            }
        }
    }
    Rectangle{
        id:currentValue
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        width: height*3
        height: root.height*0.4
        color:"black"
        border.width: 2
        border.color: root.color

        Text{
            anchors.centerIn: parent
            text: heading
            font.pixelSize: parent.height
            color:Qt.lighter(root.color)
        }
    }
    Rectangle{
        id:horizontalFog
        rotation: 90
        anchors.centerIn: parent
        height:parent.width
        width:parent.height
        gradient:  Gradient {
            GradientStop {position: 0.05; color: "black"}
            GradientStop {position: 0.3; color: "transparent"}
            GradientStop {position: 0.7; color: "transparent"}
            GradientStop {position: 0.95; color: "black"}
        }
    }
}
