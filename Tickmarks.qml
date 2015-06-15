import QtQuick 2.0


Rectangle{
    id:tickmarks
    width: 300
    height: 1
    
    Row {        
        Repeater {
            model: 11
            Rectangle {
                x: (index != 10) ? (tickmarks.width/10)*index : (tickmarks.width/10)*index -1
                y:-height
                width: 1; height: 4
            }
        }
    }
}
