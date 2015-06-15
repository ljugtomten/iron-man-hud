import QtQuick 2.0

Item{
    id:root
    property int x1: 0
    property int y1: 0
    property int x2: 100
    property int y2: 100

    property color color: "white"

    Rectangle{
        x: root.x1
        y: root.y1
        antialiasing:true
        color:root.color
        transformOrigin: Item.Bottom
        rotation:0
        width: 2
        height: diameter/2
    }
}
