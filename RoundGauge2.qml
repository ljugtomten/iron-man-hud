import QtQuick 2.0

Item{
    id:root
    property bool coverRect:true
    property int diameter:400
    property int value: 0
    property color color: "darkgray"
    property color backColor: "red"
    property real innerFactor: 0.95
    property int animationDuration: 1500

    width: diameter
    height: width
    Behavior on diameter {NumberAnimation{duration: animationDuration}}

    Rectangle{
        antialiasing:true
        anchors.centerIn: parent
        color:root.backColor
        width: diameter*0.96
        height: diameter*0.96
        radius: width * 0.5
    }
    Repeater {
        model: 10
        Item
        {
            y:diameter/2
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
    Rectangle{
        antialiasing:true
        anchors.centerIn: parent
        color:"black"
        width: diameter*innerFactor
        height: diameter*innerFactor
        radius: width * 0.5
    }

    Rectangle {
        id:circle
        antialiasing:true
        width: diameter
        height: diameter
        color: "transparent"
        border.color: root.color
        border.width: 1
        radius: width * 0.5
    }
    Rectangle{
        width: parent.width/2
        height: parent.height
        anchors.left : parent.left
        color:"black"
    }
    Rectangle{
        id:cover1
        width: parent.width
        height: parent.height/2
        anchors.bottom : parent.bottom
        color:"black"
    }

    Rectangle{
        antialiasing:true
        width: parent.width/2
        height: parent.height/2
        x:parent.width/2
        rotation: -root.value
        Behavior on rotation {NumberAnimation{}}
        transformOrigin: Item.BottomLeft
        color:"black"
    }

    Rectangle{
        visible: root.coverRect
        width: parent.width*0.9
        height: parent.height
        anchors.centerIn: parent
        color:"black"
    }
    Text{
        //Outline{}
        anchors.right: cover1.right
        anchors.top:cover1.top
        transformOrigin: Item.TopLeft
        rotation:90
        //text:"hegfdgdfgfdgj"
        color:"red"
    }
}



