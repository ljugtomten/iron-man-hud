import QtQuick 2.0

Item{
    id:root
    property int diameter:400
    property int value: 0
    property int barWidth:30
    property color color: "darkgray"
    property color backColor: "red"
    property real innerFactor: 0.95
    property int animationDuration: 1500
    property int radius:diameter/2
    width: diameter
    height: diameter
    Behavior on diameter {NumberAnimation{duration: animationDuration}}


    Rectangle{
        antialiasing:true
        anchors.centerIn: parent
        color:"transparent"//root.backColor
        border.color: root.backColor
        border.width: root.barWidth
        width: diameter*0.96
        height: diameter*0.96
        radius: root.radius
    }
    Repeater {
        model: 10
        Item
        {
            y:root.radius
            Rectangle {
                id:minorTick
                antialiasing:true                
                width: root.diameter
                height: 1
                color:root.color
                rotation: 45 -index*10
            }
        }
    }

    Rectangle {
        id:innerBorder
        antialiasing:true
        anchors.centerIn: parent
        width: diameter*innerFactor*0.95
        height: diameter*innerFactor*0.95
        color: "transparent"
        border.color: root.backColor
        border.width: 2
        radius: root.radius
    }

    Rectangle {
        id:outerborder
        antialiasing:true
        anchors.centerIn: parent
        width: diameter
        height: diameter
        color: "transparent"
        border.color: root.backColor
        border.width: 2
        radius: root.radius
    }

    Rectangle{
        id:upperLeft
        antialiasing:true
        width: root.radius
        height: root.radius
        //rotation: -root.value
        Behavior on rotation {NumberAnimation{}}
        transformOrigin: Item.BottomRight
        color:"black"
    }

    Rectangle{
        id:lowerLeft
        antialiasing:true
        width: root.radius
        height: root.radius
        y:root.radius
        rotation: -root.value
        Behavior on rotation {NumberAnimation{}}
        transformOrigin: Item.TopRight
        color:"black"
    }

    Rectangle{
        id:lowerRight
        antialiasing:true
        width: root.radius
        height: root.radius
        x:root.radius
        y:root.radius
        rotation: -root.value
        Behavior on rotation {NumberAnimation{}}
        transformOrigin: Item.TopLeft
        color:"black"
    }

    Rectangle{
        id:upperRight
        antialiasing:true
        width: root.radius
        height: root.radius
        x:root.radius
        //rotation: -root.value
        Behavior on rotation {NumberAnimation{}}
        transformOrigin: Item.BottomLeft
        color:"black"
    }
}
