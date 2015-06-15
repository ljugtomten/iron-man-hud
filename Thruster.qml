import QtQuick 2.0

Item{
    id:root
    property alias title: titleLabel.text
    //property alias value: valueLabel.text

    property real value: 50
    property real maxValue:100
    property bool active:false
    property bool pinned:false
    property color color: "lightgray"
    property int fullWidth: 300
    property int fullHeight: 50

    width: active ? fullWidth : fullWidth/3
    height: active ? fullHeight : fullHeight/2
    Behavior on value {NumberAnimation{easing.type: Easing.InOutQuad }}

    MouseArea{

        hoverEnabled: true
        onEntered: pinned ? active = active: active=true
        onExited: pinned ? active = active:  active= false

        anchors.fill:parent
        onClicked:{
            pinned ? pinned = false : pinned = true
        }
    }

    Rectangle{
        id:area
        color:"transparent"
        width:  parent.width
        height: parent.height
        //width: active ? parent.width : parent.width/3
        //height: active ? parent.height : 0
        //height: active ? parent.height :parent.height/2

        Behavior on width {NumberAnimation{ easing.type: Easing.InOutQuad ; duration: 400}}
        Behavior on height {NumberAnimation{}}

        Rectangle{
            id:border
            anchors.fill: parent
            color:"transparent"
            border.color: root.color
            border.width: 1
            //opacity: active
            Behavior on opacity {NumberAnimation{}}
        }

        Rectangle{
            id:marginRectangle
            anchors.fill:parent
            anchors.margins: 4
            color:"transparent"
        }

        Rectangle{
            id:valueBar
            anchors.top: marginRectangle.top
            anchors.bottom: marginRectangle.bottom
            anchors.right: marginRectangle.right
            width: (value /maxValue ) * marginRectangle.width
            z:5
            //opacity: active
            Behavior on opacity {NumberAnimation{}}

            color:Qt.darker(root.color)
            /*gradient:  Gradient {
                GradientStop {
                    position: 0.0;
                    color :  Qt.darker ( valueBar.color, 0.6 )
                }
                GradientStop {
                    position: 0.2;
                    color: valueBar.color;
                    Behavior on position {NumberAnimation{duration: animationDuration} }
                }
                GradientStop {
                    position: 0.8;
                    color: valueBar.color;
                    Behavior on position {NumberAnimation{duration: animationDuration} }
                }
                GradientStop {
                    position: 1.0;
                    color:  Qt.lighter ( valueBar.color, 0.6 )
                }
            }*/
        }

        Tickmarks {
            id: tickmarks
            anchors.left: marginRectangle.left
            anchors.right: marginRectangle.right
            anchors.bottom: marginRectangle.bottom
            z:7
            opacity: active
            Behavior on opacity {NumberAnimation{}}
        }

        Text {
            id: valueLabel
            anchors.margins: 15
            anchors.verticalCenter: parent.verticalCenter
            anchors.right:parent.right
            z:10
            opacity: active

            text: Math.round(root.value)
            color: root.color
            font.pixelSize: parent.height/2
            Behavior on opacity {NumberAnimation{}}
        }
    }

    Text {
        id: titleLabel
        anchors.topMargin: 5
        anchors.leftMargin: 8
        anchors.top:parent.top
        anchors.left:parent.left
        text: "LABEL"
        color: root.color
        font.pixelSize:  fullHeight/4
    }
}
