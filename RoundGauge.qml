import QtQuick 2.0

Item{
    id:root
    property bool coverRect:true
    property int diameter:400
    property color color: "darkgray"
    property real innerFactor: 0.95
    property int animationDuration: 1500

    width: diameter
    height: width
    Behavior on diameter {NumberAnimation{duration: animationDuration}}

    Repeater {
        model: 10
        Item
        {
            y:diameter/2
            Rectangle {
                antialiasing:true
                id:minorTick
                width: root.diameter
                height: 1
                color:root.color
                rotation: 45 -index*10
            }
        }
    }
    Rectangle{
        anchors.centerIn: parent
        color:"black"
        width: diameter*innerFactor
        height: diameter*innerFactor
        radius: width * 0.5
    }

    Rectangle {
        antialiasing:true
        id:circle
        width: diameter
        height: diameter
        color: "transparent"
        border.color: root.color
        border.width: 1
        radius: width * 0.5
    }
    Rectangle{
        visible: root.coverRect
        width: parent.width*0.9
        height: parent.height
        anchors.centerIn: parent
        color:"black"
    }
}
