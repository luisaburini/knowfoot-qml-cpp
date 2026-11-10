import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Item{
    id: fpiScreen
    state: "Init"
    anchors.fill: parent
    onVisibleChanged: {
        if (fpiScreen.visible === false || fpiScreen.state === "Init") {
            camera.stop()
        }
    }
    onStateChanged: {
        if (fpiScreen.visible === false || fpiScreen.state === "Init") {
            camera.stop()
        }
    }

    property var level

    signal clickedLevel(int level)
    signal nextPage()

    property var descriptionText


    onDescriptionTextChanged: {
        description.text = descriptionText
    }

    property var wordForImage

    onWordForImageChanged: {
        imageMinusTwo.source = "../imgs/fpi"+wordForImage+"-2.png"
        imageMinusOne.source = "../imgs/fpi"+wordForImage+"-1.png"
        imageZero.source = "../imgs/fpi"+wordForImage+"0.png"
        imageOne.source = "../imgs/fpi"+wordForImage+"1.png"
        imageTwo.source = "../imgs/fpi"+wordForImage+"2.png"
    }


    Rectangle {
        id: name
        color: "#f7fafe"
        anchors.fill: parent
        Column {
            anchors.centerIn: parent
            spacing: 2
            Text {
                id: title
                color: "#1c009e"
                text: qsTr("KnowFoot")
                font.pixelSize: 60
                font.bold: true
            }
            Rectangle{
                color: "#00000000"
                border.color: "#1c009e"
                border.width: 3
                radius: 20

                Text {
                    text: qsTr("F.P.I.")
                    color: "#1c009e"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 24
                }
            }

            Text {
                id: description
                text: qsTr("")
                wrapMode: Text.WordWrap
                font.pointSize: 24
                color: "#1c009e"
                horizontalAlignment: Text.AlignHCenter
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    background: Image{
                        id: imageMinusTwo
                        source: "../imgs/fpiMalleolus-2.png"
                        Rectangle {
                            id: borderMinusTwo
                            radius: 20
                            border.color: "#1c009e"
                            border.width: 0
                            anchors.fill: parent
                            color: "#00000000"
                        }
                    }
                    onClicked: {
                        if (borderMinusTwo.border.width !== 0) {
                            borderMinusTwo.border.width = 0
                        } else {
                            borderTwo.border.width = 0
                            borderMinusOne.border.width = 0
                            borderZero.border.width = 0
                            borderOne.border.width = 0
                            borderMinusTwo.border.width = 5
                            fpiScreen.level = -2
                            fpiScreen.clickedLevel(-2)
                            errorMessage.visible = false
                        }
                    }
                }
                Button {
                    background: Image{
                        id: imageMinusOne
                        source: "../imgs/fpiMalleolus-1.png"
                        Rectangle {
                            id: borderMinusOne
                            radius: 20
                            border.color: "#1c009e"
                            border.width: 0
                            anchors.fill: parent
                            color: "#00000000"
                        }
                    }
                    onClicked: {
                        if (borderMinusOne.border.width !== 0) {
                            borderMinusOne.border.width = 0
                        } else {
                            borderMinusTwo.border.width = 0
                            borderTwo.border.width = 0
                            borderZero.border.width = 0
                            borderOne.border.width = 0
                            borderMinusOne.border.width = 5
                            fpiScreen.clickedLevel(-1)
                            fpiScreen.level = -1
                            errorMessage.visible = false
                        }
                    }
                }
                Button {
                    background: Image{
                        id: imageZero
                        source: "../imgs/fpiMalleolus0.png"
                        Rectangle {
                            id: borderZero
                            border.color: "#1c009e"
                            border.width: 0
                            radius: 20
                            anchors.fill: parent
                            color: "#00000000"
                        }
                    }
                    onClicked: {
                        if (borderZero.border.width !== 0) {
                            borderZero.border.width = 0
                        } else {
                            borderMinusTwo.border.width = 0
                            borderMinusOne.border.width = 0
                            borderTwo.border.width = 0
                            borderOne.border.width = 0
                            borderZero.border.width = 5
                            fpiScreen.clickedLevel(0)
                            fpiScreen.level = 0
                            errorMessage.visible = false
                        }
                    }
                }
                Button {
                    background: Image{
                        id: imageOne
                        source: "../imgs/fpiMalleolus1.png"
                        Rectangle {
                            id: borderOne
                            border.color: "#1c009e"
                            border.width: 0
                            radius: 20
                            anchors.fill: parent
                            color: "#00000000"
                        }
                    }
                    onClicked: {
                        if (borderOne.border.width !== 0) {
                            borderOne.border.width = 0
                        } else {
                            borderMinusTwo.border.width = 0
                            borderMinusOne.border.width = 0
                            borderZero.border.width = 0
                            borderTwo.border.width = 0
                            borderOne.border.width = 5
                            fpiScreen.clickedLevel(1)
                            fpiScreen.level = 1
                            errorMessage.visible = false
                        }
                    }
                }
                Button {
                    background: Image{
                        id: imageTwo
                        source: "../imgs/fpiMalleolus2.png"
                        Rectangle {
                            id: borderTwo
                            border.color: "#1c009e"
                            border.width: 0
                            radius: 20
                            anchors.fill: parent
                            color: "#00000000"
                        }
                    }
                    onClicked: {
                        if (borderTwo.border.width !== 0) {
                            borderTwo.border.width = 0
                        } else {
                            borderMinusTwo.border.width = 0
                            borderMinusOne.border.width = 0
                            borderZero.border.width = 0
                            borderOne.border.width = 0
                            borderTwo.border.width = 5
                            fpiScreen.clickedLevel(2)
                            fpiScreen.level = 2
                            errorMessage.visible = false
                        }
                    }
                }
            }
            Item {
                id: controlLayout

                readonly property bool isMobile: Qt.platform.os === "android" || Qt.platform.os === "ios" || Qt.platform.os === "linux"
                readonly property bool isLandscape: Screen.desktopAvailableWidth >= Screen.desktopAvailableHeight
                property int buttonsWidth: state === "MobilePortrait" ? Screen.desktopAvailableWidth / 3.4 : 114

                states: [
                    State {
                        name: "MobileLandscape"
                        when: controlLayout.isMobile && controlLayout.isLandscape
                    },
                    State {
                        name: "MobilePortrait"
                        when: controlLayout.isMobile && !controlLayout.isLandscape
                    },
                    State {
                        name: "Other"
                        when: !controlLayout.isMobile
                    }
                ]

                onStateChanged: {
                    console.log("State: " + controlLayout.state)
                }
            }
            Rectangle {
                width: 600
                height: 400
                color: "#000000"
                CameraPermission {
                    id: cameraPermission

                    onStatusChanged: {
                        // In case the application does not already have permissions at startup
                        if (status === Qt.PermissionStatus.Granted && fpiScreen.state === "PhotoCapture") {
                            cameraPermission.request()
                            camera.start()
                       } else if (status === Qt.PermissionStatus.Denied || fpiScreen.state !== "PhotoCapture") {
                            camera.stop()
                        }
                    }
                }
                Component.onCompleted: {
                    // In case the application already has permissions at startup
                    if (cameraPermission.status === Qt.PermissionStatus.Granted)
                        camera.start()
                }
                Text{
                    text: qsTr("FOTO")
                    color: "#1c009e"
                    font.pixelSize: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                CaptureSession {
                    id: captureSession
                    camera: Camera {
                        id: camera
                    }
                    imageCapture: ImageCapture {
                        id: imageCapture
                    }

                    recorder: MediaRecorder {
                        id: recorder
                    }
                    videoOutput: viewfinder
                }
                VideoOutput {
                    id: viewfinder
                    visible: (fpiScreen.state === "PhotoCapture")
                    anchors.fill: parent
                }
            }
            Row{
                Button {
                    text: qsTr("Voltar")
                    width: 300
                    height: 50
                    font.pixelSize: 30
                    background: Rectangle{
                        opacity: parent.down ? 0.1 : 0.3
                        radius: 30
                    }
                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        opacity: enabled ? 1.0 : 0.3
                        color: parent.down ? "#575976" : "#1c009e"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }
                Button {
                    text: qsTr("Próximo")
                    width: 300
                    height: 50
                    font.pixelSize: 30
                    background: Rectangle{
                        opacity: parent.down ? 0.1 : 0.3
                        radius: 30
                    }
                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        opacity: enabled ? 1.0 : 0.3
                        color: parent.down ? "#575976" : "#1c009e"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    onClicked: {
                        if (borderMinusTwo.border.width === 0 &&
                                borderMinusOne.border.width === 0 &&
                                borderZero.border.width === 0 &&
                                borderOne.border.width === 0 &&
                                borderTwo.border.width === 0) {
                            errorMessage.visible = true
                            return
                        }
                        fpiScreen.nextPage()
                    }
                }
            }

            Text {
                id: errorMessage
                visible: false
                color: "#FF0000"
                font.pixelSize: 20
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Aperte no desenho mais parecido com o seu pé")
            }
        }
    }
}
