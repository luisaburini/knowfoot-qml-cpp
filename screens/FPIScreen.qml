import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtMultimedia

Item{
    id: fpiScreen
    state: "Init"
    width: Screen.width
    height: Screen.height

    onVisibleChanged: {
        if (fpiScreen.visible === true) {
            fpiScreen.state = "PhotoCapture"
        }
        if (fpiScreen.visible === false || fpiScreen.state === "Init") {
            camera.stop()
        } else {
            cameraPermission.request()
            camera.start()
        }
    }
    onStateChanged: {
        if (fpiScreen.visible === false || fpiScreen.state === "Init") {
            camera.stop()
        } else {
            camera.start()
        }
    }

    property var level
    property var descriptionText
    property var step
        property var wordForImage

    signal clickedLevel(int level)
    signal nextPage()
    signal previousPage()


    onDescriptionTextChanged: {
        description.text = descriptionText
    }
    onStepChanged: {
        progressBar.from = 0
        progressBar.to = 6
        progressBar.value = step
        progressText.text = step.toString() + " de 6"
    }

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
        width: Screen.width;
        height: Screen.height;
        Column {
            width: Screen.width
            spacing: 10
            padding: 10
            Item{
                height: 10
                width: Screen.width
            }
            Row {
                width: Screen.width
                spacing: 10
                Item {
                    width: 10
                    height: 10
                }
                Text {
                    id: progressText
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 20
                    font.bold: true
                    color: "#1c009e"
                }
                ProgressBar{
                    id: progressBar
                    height: 50
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Text {
                id: description
                wrapMode: Text.WordWrap
                font.pointSize: 24
                font.bold: true
                color: "#1c009e"
                width: Screen.width
                height: Screen.height/10
            }
            Row {
                id: fpiLevelRow
                width: Screen.width
                leftPadding: 20
                rightPadding: 20
                spacing: (-40+Screen.width/6)/6
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    width: Screen.width/6
                    background: Image{
                        id: imageMinusTwo
                        source: "../imgs/fpiMalleolus-2.png"
                        width: Screen.width/6
                        fillMode: Image.PreserveAspectCrop
                        Rectangle {
                            id: borderMinusTwo
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
                    width: Screen.width/6
                    background: Image{
                        id: imageMinusOne
                        source: "../imgs/fpiMalleolus-1.png"
                        width: Screen.width/6
                        fillMode: Image.PreserveAspectCrop
                        Rectangle {
                            id: borderMinusOne
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
                    width: Screen.width/6
                    background: Image{
                        id: imageZero
                        source: "../imgs/fpiMalleolus0.png"
                        width: Screen.width/6
                        fillMode: Image.PreserveAspectCrop
                        Rectangle {
                            id: borderZero
                            border.color: "#1c009e"
                            border.width: 0
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
                    width: Screen.width/6
                    background: Image{
                        id: imageOne
                        source: "../imgs/fpiMalleolus1.png"
                        width: Screen.width/6
                        fillMode: Image.PreserveAspectCrop
                        Rectangle {
                            id: borderOne
                            border.color: "#1c009e"
                            border.width: 0
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
                    width: Screen.width/6
                    background: Image{
                        id: imageTwo
                        source: "../imgs/fpiMalleolus2.png"
                        width: Screen.width/6
                        fillMode: Image.PreserveAspectCrop
                        Rectangle {
                            id: borderTwo
                            border.color: "#1c009e"
                            border.width: 0
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
                            borderTwo.border.width = 5
                            borderOne.border.width = 0
                            fpiScreen.clickedLevel(2)
                            fpiScreen.level = 2
                            errorMessage.visible = false
                        }
                    }
                }
            }
            Text{
                text: qsTr("Foto (opcional)")
                color: "#1c009e"
                font.pixelSize: 30
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
            Image {
                id: photoPreview
                width: Screen.width
                height: Screen.height/3
                //source: imageCapture.preview
                //source: "../imgs/capture.png"
                fillMode: Image.PreserveAspectCrop
                smooth: true
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
                    width: Screen.width/3
                    height: 50
                    font.pixelSize: 20
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
                        fpiScreen.previousPage()
                    }
                }
                Button {
                    text: qsTr("Tirar Foto")
                    width: Screen.width/3
                    height: 50
                    font.pixelSize: 20
                    visible: imageCapture.readyForCapture
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
                        camera.stop()
                        imageCapture.captureToFile("../imgs/capture.png")
                        photoPreview.source = "../imgs/capture.png"
                        photoPreview.source = imageCapture.preview
                    }
                }
                Button {
                    text: qsTr("Próximo")
                    width: Screen.width/3
                    height: 50
                    font.pixelSize: 20
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
                width: 400
                color: "#FF0000"
                font.pixelSize: 20
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Aperte no desenho mais parecido com o seu pé")
            }
        }
    }
}
