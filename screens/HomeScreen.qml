import QtQuick
import QtQuick.Controls

Item{
    id: home
    anchors.fill: parent

    signal clickedTests
    signal clickedManage
    signal clickedTutorials

    Rectangle {
        id: name
        color: "#f7fafe"
        anchors.fill: parent
        Column {
            anchors.centerIn: parent
            spacing: 2
            Row {
                Image {
                    height: 70
                    fillMode: Image.PreserveAspectFit
                    source: "../imgs/knowfoot-logo.png"
                }
                Text {
                    id: know
                    color: "#09325f"
                    text: qsTr("Know")
                    font.pixelSize: 60
                    font.bold: true
                    height: 70
                    horizontalAlignment: Text.AlignJustify
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    id: foot
                    color: "#4c7db7"
                    text: qsTr("Foot")
                    font.pixelSize: 60
                    font.bold: true
                    height: 70
                    horizontalAlignment: Text.AlignJustify
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Text {
                id: ola
                text: qsTr("Olá!")
                font.pixelSize: 40
                height: 45
                color: "#09325f"
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                id: oque
                text: qsTr("O que vamos avaliar hoje?")
                font.pixelSize: 20
                height: 30
                color: "#4c7db7"
                horizontalAlignment: Text.AlignLeft
            }
            Rectangle {
                color: "#dfebfb"
                width: 400
                height: 200
                radius: 30
                Column{
                    anchors.centerIn: parent
                    padding: 20
                    Text {
                        id: novaavaliacao
                        text: qsTr("Nova avaliação")
                        font.pixelSize: 25
                        height: 30
                        color: "#09325f"
                        horizontalAlignment: Text.AlignLeft
                    }
                    Text {
                        id: realize
                        text: qsTr("Realize uma nova avaliação\nda postura dos pés do paciente.")
                        font.pixelSize: 20
                        height: 60
                        color: "#09325f"
                        horizontalAlignment: Text.AlignLeft
                    }
                    Button {
                        text: qsTr("Iniciar avaliação")
                        font.pixelSize: 15
                        width: 300
                        height: 50
                        background: Rectangle{
                            opacity: parent.down ? 0.1 : 0.3
                            radius: 20
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            opacity: enabled ? 1.0 : 0.3
                            color: parent.down ? "#575976" : "#000000"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked: home.clickedTests()
                    }
                }
            }

            Rectangle {
                height: 100
                width: 400
                color: "#dfebfb"
                radius: 30
                Column {
                    anchors.centerIn: parent
                    padding: 20
                    Text {
                        text: qsTr("Gerencie seus pacientes e cadastros.")
                        font.pixelSize: 20
                    }
                    Button {
                        text: qsTr("Gerenciar pacientes")
                        font.pixelSize: 15
                        width: 300
                        height: 50
                        background: Rectangle{
                            opacity: parent.down ? 0.1 : 0.3
                            radius: 5
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            opacity: enabled ? 1.0 : 0.3
                            color: parent.down ? "#575976" : "#000000"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked: home.clickedManage()
                    }
                }
            }
            Rectangle {
                height: 100
                width: 400
                color: "#dfebfb"
                radius: 30
                Column {
                    anchors.centerIn: parent
                    Text {
                        text: qsTr("Veja avaliações já realizadas.")
                        font.pixelSize: 20
                    }
                    Button {
                        text: qsTr("Histórico")
                        font.pixelSize: 15
                        width: 300
                        height: 50
                        background: Rectangle{
                            opacity: parent.down ? 0.1 : 0.3
                            radius: 5
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            opacity: enabled ? 1.0 : 0.3
                            color: parent.down ? "#575976" : "#000000"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked: home.clickedManage()
                    }
                }
            }
        }
    }
}
