import QtQuick 2.0


Item{
    id:root
    property int roll: 10
    property int pitch: 50
    property color color: "lightgray"
    width:250
    height:150
    Rectangle{
        rotation:root.roll
        Behavior on rotation {NumberAnimation{}}
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.verticalCenter: parent.verticalCenter
        height:3
        color:"transparent"

        Rectangle{
            antialiasing:true
            height:2
            width:parent.width*0.3
            anchors.left: parent.left
            color:root.color
        }
        Rectangle{
            antialiasing:true
            height:2
            width:parent.width*0.3
            anchors.right: parent.right
            color:root.color
        }

        Rectangle{
            id:currentRollLabel
            height:root.height/15
            width:root.width/10
            y:-height*2
            //anchors.verticalCenter:  parent.verticalCenter
            anchors.left: parent.left
            color:"transparent"
            border.width: 1
            border.color:root.color
            Rectangle{
                id:rollLabel
                anchors.fill:parent
                anchors.margins: 3
                color:Qt.darker(root.color)
                Text{
                    anchors.centerIn: parent
                    color:root.color
                    text:root.roll
                    font.pixelSize: parent.height*0.9
                }
            }
        }

        Item{
            id:pitch            
            width:root.width/5
            height:root.height
            anchors.centerIn:parent

            Item{
                y:  +(parent.height/180) * root.pitch
                Behavior on y {NumberAnimation{}}
                anchors.horizontalCenter: parent.horizontalCenter
                Column {
                    id: majorTicks
                    anchors.horizontalCenter: parent.horizontalCenter
                    property int nrOfElements: 18
                    Repeater {
                        model: majorTicks.nrOfElements
                        Item
                        {
                            Rectangle {
                                id:majorTick
                                color:root.color
                                y: (pitch.height/majorTicks.nrOfElements)*index
                                x:-width/2
                                width: pitch.width/2; height: 2
                            }
                            Text {
                                anchors.verticalCenter: majorTick.verticalCenter
                                anchors.left:majorTick.right
                                anchors.leftMargin: majorTick.width/4
                                text: 90 - index*10
                                font.pixelSize: majorTick.height * 5
                                color:root.color
                            }
                        }
                    }
                }
            }

            Rectangle{
                id:currentPitchLabel
                height:parent.width/4
                width:parent.width/2
                Rectangle{
                    anchors.fill:parent
                    anchors.margins: 3
                    color:Qt.darker(root.color)
                    Text{
                        anchors.centerIn: parent
                        color:root.color
                        text:root.pitch
                        font.pixelSize: parent.height*0.9
                    }
                }

                anchors.verticalCenter:  parent.verticalCenter
                anchors.left: parent.left
                color:"transparent"
                border.width: 1
                border.color:root.color
            }
            Rectangle{
                id:verticalFog           
                width: parent.width
                height:parent.height*1.3
                anchors.centerIn: parent
                gradient:  Gradient {
                    GradientStop {position: 0.1; color: "black"}
                    GradientStop {position: 0.5; color: "transparent"}
                    GradientStop {position: 0.9; color: "black"}
                }
            }
        }

        Rectangle{
            id:horizontalFog
            rotation: 90
            anchors.centerIn: parent
            height:parent.width
            width:parent.height
            gradient:  Gradient {
                GradientStop {position: 0.0; color: "black"}
                GradientStop {position: 0.1; color: "transparent"}
                GradientStop {position: 0.9; color: "transparent"}
                GradientStop {position: 1.0; color: "black"}
            }
        }
    }
}

