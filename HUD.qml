import QtQuick 2.0

Rectangle {
    id:root
    width: 1024
    height: 640
    color:"black"
    property color baseColor:"white"// "cyan"

    MouseArea{
        anchors.fill: parent
        onClicked:{
            main.active ? main.active = false : main.active = true
        }
    }


    //PieWidget{
    //   diameter:250
    //}

    RoundGauge3
    {
        id:gaugenew
        innerFactor:    0.85
        color:"black"
        backColor:Qt.darker(baseColor)
        value: main.active? 180:45
        // Behavior on value {NumberAnimation{duration:500}}
        opacity: !main.active
        Behavior on opacity {NumberAnimation{duration:1000}}
        diameter: main.active ? 0: 500
        anchors.centerIn: main

        Rectangle{
            property int pulseInterval:450
            id:pulse
            property bool small:true
            property int diameter: small? parent.width/7 : parent.width/6.5
            Behavior on diameter {NumberAnimation{duration:pulse.pulseInterval;easing.type: Easing.OutQuad}}
            antialiasing:true
            anchors.centerIn: parent
            width:diameter
            height:diameter
            radius:width/2
            color: small? Qt.darker(baseColor) : root.baseColor
            Behavior on color {ColorAnimation{duration:pulse.pulseInterval;easing.type: Easing.OutQuad}}

            Timer {
                interval: pulse.pulseInterval*3; running: true; repeat: true
                onTriggered: {pulse.small=false}
            }
            Timer {
                interval: pulse.pulseInterval; running: true; repeat: true
                onTriggered: {pulse.small=true}
            }
        }

        Text {
            id: welcomLabel
            //text: qsTr("...")
            color: root.baseColor
            font.pixelSize: parent.height/10
            anchors.centerIn: parent
        }
    }

    Rectangle{
        id:main
        anchors.centerIn: parent
        opacity: active
        property bool active:false
        width: active ? root.width : 0
        height: active ? root.height : 0
        color: "transparent"
        property int animationSpeed:2
        Behavior on width{NumberAnimation{duration: 500*main.animationSpeed;easing.type: Easing.InOutQuad}}
        Behavior on height{NumberAnimation{duration: 1000*main.animationSpeed;easing.type: Easing.InOutQuad}}
        Behavior on opacity{NumberAnimation{duration: 500*main.animationSpeed;easing.type: Easing.InOutQuad}}

        RoundGauge2{
            id:gauge0
            innerFactor: 0.85
            color:"black"
            backColor:Qt.darker(baseColor)
            value: 30
            coverRect: false
            diameter: main.active ? 150 : 1
            anchors.centerIn: gauge
        }

        RoundGauge2{
            id:gauge2
            innerFactor: 0.85
            color:"black"
            backColor:root.baseColor
            value: 55

            coverRect: false
            diameter: main.active ? 125 : 1
            anchors.centerIn: gauge
        }
        RoundGauge{
            id:gauge
            innerFactor: 0.9
            color:root.baseColor
            coverRect: false
            diameter: main.active ? 100 : 1
            anchors.left:parent.left
            anchors.top:parent.top
            anchors.margins: parent.width/5
            Text{

                anchors.centerIn: parent
                text: gauge2.value + " %"

                color:root.baseColor
                font.pixelSize: parent.height/4
            }
        }

        Altimeter {
            id: altimeter
            color:root.baseColor
            anchors.top:parent.top
            anchors.bottom: parent.bottom
            anchors.right:parent.right
            anchors.rightMargin: width/3
        }

        Heading{
            id:heading
            color:root.baseColor
            anchors.top:parent.top
            anchors.right: parent.right
            anchors.left:parent.left
            anchors.topMargin: height/2
        }

        Item{
            id:temps
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:parent.left
            anchors.leftMargin: 50
            height: parent.height
            Column{
                anchors.verticalCenter: parent.verticalCenter
                HeatWidget {
                    transformOrigin: Item.TopRight
                    //rotation: -90
                    title: "CORE TEMP"
                    color:root.baseColor
                    id: heat1
                    height: temps.height*0.3
                    anchors.left:parent.left
                }
                HeatWidget {
                    //anchors.top:heat1.bottom
                    transformOrigin: Item.TopRight
                    //rotation: -90
                    title: "SURFACE TEMP"
                    color:root.baseColor
                    fromColor: "#5980A1"
                    toColor: "#093051"
                    id: heat2
                    height: temps.height*0.3
                }
            }
        }

        RoundGauge2{
            id:gauge3
            innerFactor: 0.92
            color:"black"
            backColor:root.baseColor
            value: 55
            coverRect: false
            diameter: main.active ? 700 : 1
            anchors.centerIn: roundGauge
            z:-10
        }

        RoundGauge2{
            id:gauge4
            innerFactor: 0.92
            color:"black"
            backColor:Qt.darker(baseColor)//"#205050"
            value: 55
            coverRect: false
            diameter: main.active ? 750 : 1
            anchors.centerIn: roundGauge
            z:-12
        }

        RoundGauge{
            id:roundGauge
            coverRect: true
            diameter: main.active ? 300 : 1
            color:root.baseColor
            anchors.centerIn: horizon
            Rectangle{
                anchors.centerIn: parent
                rotation: -45
                width: parent.width*1.05
                Thruster {
                    id: thruster1
                    y:active? -39:-15
                    Behavior on y{NumberAnimation{}}
                    //anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.right
                    title:"THRUSTER R"
                    color:root.baseColor
                    value: 53
                    maxValue: 100
                    transformOrigin: Item.Left
                }
                Thruster {
                    id: thruster2
                    y:15
                    //anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.right
                    //active:main.active
                    title:"THRUSTER L"
                    color:root.baseColor
                    value: 53
                    maxValue: 100
                    //rotation: -45
                    transformOrigin: Item.Left
                    //anchors.top: roundGauge.bottom
                    //anchors.margins: 50
                    //anchors.left:parent.left
                    //y: thruster1.height +3
                    //anchors.bottom: parent.bottom
                }
            }
        }

        Horizon {
            id: horizon
            color:root.baseColor
            width:parent.width*0.6
            height:parent.height*0.6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:parent.bottom
            anchors.bottomMargin: 0
        }

        Thruster {
            id:airbrake1
            fullWidth: parent.width/5
            fullHeight: parent.height/18
            active:true
            anchors.left:parent.left
            anchors.leftMargin: 50
            y:parent.height*0.84
            title:"AIRBRAKE R"
            color:root.baseColor
            value: 10
            maxValue: 100
        }

        Thruster {
            id:airbrake2
            fullWidth: parent.width/4
            fullHeight: parent.height/18
            active:true
            y:parent.height*0.9
            anchors.left:parent.left
            anchors.leftMargin: 50
            title:"AIRBRAKE L"
            color:root.baseColor
            value: 53
            maxValue: 100
        }
    }

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: {
            thruster1.value = 75 + Math.random()*thruster1.maxValue*0.1
            thruster2.value = 65 + Math.random()*thruster2.maxValue*0.1
            altimeter.value = 506 + Math.random()*10
            heading.heading = 150 + Math.random()*2
            horizon.roll = Math.random()*3
            horizon.pitch = Math.random()*5
            //gauge2.value= 30 + Math.random()*30
            gauge3.value =5 + Math.random()*35
            gauge4.value =0 + Math.random()*15
            airbrake1.value =30 +Math.random()*15
            airbrake2.value =25 +Math.random()*15
            heat1.value= 80 +Math.random()*20
            heat2.value= 75 +Math.random()*20
        }
    }
    Timer {
        interval: 500; running: true; repeat: true
        onTriggered: {
            gauge2.value= 30 + Math.random()*30
        }
    }
}
