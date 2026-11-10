import QtQuick
import QtQuick.Controls

Item{
    id: register
    anchors.fill: parent

    Rectangle {
        id: name
        color: "#f7fafe"
        Column {
            spacing: 2
            Text {
                id: title
                color: "#09325f"
                text: qsTr("KnowFoot")
                font.pixelSize: 60
                font.bold: true
                horizontalAlignment: Text.AlignJustify
            }
            TextEdit {
                text: qsTr("Digite seu nome")
                color: "#09325f"
            }
            Row {
                Column{
                    Text{
                        text: qsTr("Altura")
                        color: "#09325f"
                    }
                    Row{
                        TextEdit{
                            color: "#09325f"
                        }
                        Text{
                            text: qsTr("cm")
                            color: "#09325f"
                        }
                    }
                }
                Column{
                    Text{
                        text: qsTr("Idade")
                        color: "#09325f"
                    }
                    Row{
                        TextEdit{
                            color: "#09325f"
                        }
                        Text{
                            text: qsTr("anos")
                            color: "#09325f"
                        }
                    }
                }
            }

            Row {
                Column{
                    Text{
                        text: qsTr("Peso")
                        color: "#09325f"
                    }
                    Row{
                        TextEdit{
                            color: "#09325f"
                        }
                        Text{
                            text: qsTr("kg")
                            color: "#09325f"
                        }
                    }
                }
                Column{
                    Text{
                        text: qsTr("Sexo")
                        color: "#09325f"
                    }
                    TextEdit{
                        color: "#09325f"
                    }
                }
            }

            Column{
                Text{
                    text: qsTr("Já teve alguma lesão no pé?")
                }
                TextEdit{
                    color: "#09325f"
                }
            }

            Column{
                Text{
                    text: qsTr("Qual?")
                }
                TextEdit{
                    color: "#09325f"
                }
            }

            Column{
                Text{
                    text: qsTr("Pratica atividade física?")
                }
                TextEdit{
                    color: "#09325f"
                }
            }

            Column{
                Text{
                    text: qsTr("Qual?")
                }
                TextEdit{
                    color: "#09325f"
                }
            }

            Button{
                text: qsTr("Concluir")
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
