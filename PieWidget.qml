import QtQuick 2.0

Item{
    id:root
    property int diameter:300
    property int value: 90
    property int barWidth:30
    property color color: "darkgray"
    property color backColor: "white"
    property real innerFactor: 0.95
    property int animationDuration: 1500
    property int radius:diameter/2

    property color transparentColor: "transparent"
    property color coverColor: "transparent"
    width: diameter
    height: diameter
    Behavior on diameter {NumberAnimation{duration: animationDuration}}

    rotation: 45


    Rectangle{
        id:innerborder
        antialiasing:true
        anchors.centerIn: parent
        color:transparentColor//root.backColor
        border.color: root.backColor
        border.width: 2
        width: diameter*0.3
        height: width
        radius: root.radius
    }

    PolarLine {
        originX: root.radius
        originY: root.radius
        radius: root.radius
        angle: 180
    }

    PolarLine {
        originX: root.radius
        originY: root.radius
        radius: root.radius
        angle: 270
    }

    Rectangle {
        id:outerborder
        antialiasing:true
        anchors.centerIn: parent
        width: diameter
        height: diameter
        color: transparentColor
        border.color: root.backColor
        border.width: 2
        radius: root.radius
    }

    Rectangle{
        id:innerCover
        antialiasing:true
        anchors.centerIn: parent
        color:root.coverColor
        width: diameter*0.29
        height: width
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
        color:coverColor
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
        color:coverColor
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
        color:coverColor
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
        color:coverColor
    }




}
