import QtQuick 2.0

Item{
    id:root
    property int originX: 0
    property int originY: 0
    property real angle: 0
    property int radius: 100
    property color color: "white"
    property int lineWidth: 2

    Rectangle{
        x: root.originX
        y: root.originY
        antialiasing:true
        color:root.color
        transformOrigin: Item.Left
        rotation:-root.angle
        width: root.radius
        height: lineWidth
    }
}
