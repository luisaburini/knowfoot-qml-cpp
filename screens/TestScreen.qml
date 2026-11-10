import QtQuick
import QtQuick.Controls
import QtQuick.Window

Item {
    id: test
    anchors.fill: parent

    signal clickedFPILeft()
    signal clickedFPIRight()

    signal clickedNavicularLeft()
    signal clickedNavicularRight()

    signal backHome()

    Rectangle {
        id: name
        color: "#f7fafe"
        anchors.centerIn: parent
        Column{
            spacing: 2
            anchors.centerIn: parent
            Row{
                Button{
                    background: Image {
                        id: backHome
                        source: "../imgs/back.png"
                    }
                    onClicked: test.backHome()
                }
                Text {
                    id: title
                    text: qsTr("KnowFoot")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    color: "#09325f"
                    font.pointSize: 60
                    font.bold: true
                }
            }
            Text {
                text: qsTr("Testes")
                padding: 10
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                font.pointSize: 24
                color: "#09325f"
            }
            Column{
                spacing: 2
                Text {
                    text: qsTr("FPI")
                    padding: 10
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    color: "#09325f"
                    font.pointSize: 20
                }
                Text {
                    text: qsTr("O FPI é um método altamente recomendado para identificar qual tipo de pisada que uma pessoa possui. É composto por 6 medições")
                    padding: 10
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    color: "#09325f"
                    wrapMode: Text.WordWrap
                }
                Row{
                    spacing: 10
                    Button{
                        text: qsTr("Pé esquerdo")
                        height: 50
                        width: 200
                        font.pixelSize: 30
                        background: Rectangle{
                            opacity: parent.down ? 0.1 : 0.3
                            radius: 20
                            color: "#4c7db7"
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            opacity: enabled ? 1.0 : 0.3
                            color: parent.down ? "#575976" : "#09325f"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked: test.clickedFPILeft()
                    }
                    Button{
                        text: qsTr("Pé direito")
                        height: 50
                        width: 200
                        font.pixelSize: 30
                        background: Rectangle{
                            opacity: parent.down ? 0.1 : 0.3
                            radius: 20
                            color: "#4c7db7"
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            opacity: enabled ? 1.0 : 0.3
                            color: parent.down ? "#575976" : "#09325f"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked: test.clickedFPIRight()
                    }
                }
                Text {
                    text: qsTr("DROP DO NAVICULAR")
                    color: "#09325f"
                    padding: 10
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    font.pointSize: 20
                }
                Text{
                    text: qsTr("Identifica o tipo de pé por meio da diferença da altura do osso navicular entre as posturas sentada e em pé")
                    color: "#09325f"
                    padding: 10
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                }
                Row{
                    spacing: 10
                    Button{
                        text: qsTr("Pé esquerdo")
                        height: 50
                        font.pixelSize: 30
                        background: Rectangle{
                            opacity: parent.down ? 0.1 : 0.3
                            radius: 20
                            color: "#4c7db7"
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            opacity: enabled ? 1.0 : 0.3
                            color: parent.down ? "#575976" : "#09325f"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked: test.clickedNavicularLeft()
                    }
                    Button{
                        text: qsTr("Pé direito")
                        height: 50
                        font.pixelSize: 30
                        background: Rectangle{
                            opacity: parent.down ? 0.1 : 0.3
                            radius: 20
                            color: "#4c7db7"
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            opacity: enabled ? 1.0 : 0.3
                            color: parent.down ? "#575976" : "#09325f"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked: test.clickedNavicularRight()
                    }
                }
            }
        }
    }
}
