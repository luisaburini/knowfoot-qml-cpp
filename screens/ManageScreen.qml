import QtQuick
import QtQuick.Controls

Item{
    id: manage
    anchors.fill: parent

    Rectangle {
        id: name
        color: "#f7fafe"
        Column {
            anchors.centerIn: parent
            spacing: 2
            Text {
                id: title
                color: "#09325f"
                text: qsTr("KnowFoot")
                font.pixelSize: 60
                font.bold: true
                horizontalAlignment: Text.AlignJustify
            }
            Button{
                text: qsTr("Buscar")
                width: 300
                height: 50
                font.pixelSize: 30
                background: Rectangle{ opacity: parent.down ? 0.1 : 0.3 }
                contentItem: Text {
                    text: parent.text
                    font: parent.font
                    opacity: enabled ? 1.0 : 0.3
                    color: parent.down ? "#575976" : "#09325f"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
            }
            Text {
                text: qsTr("Nome preenchido dinamicamente")
                color: "#09325f"
            }
            Button{
                text: qsTr("Adicionar paciente")
                width: 300
                height: 50
                font.pixelSize: 30
                background: Rectangle{ opacity: parent.down ? 0.1 : 0.3 }
                contentItem: Text {
                    text: parent.text
                    font: parent.font
                    opacity: enabled ? 1.0 : 0.3
                    color: parent.down ? "#575976" : "#09325f"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
            }
        }
    }
}
