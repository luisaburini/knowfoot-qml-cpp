import QtQuick
import QtQuick.Controls

Item{
    id: results
    anchors.fill: parent

    signal redoTest()
    signal newTest()
    signal finish()

    function calculate(malleolus, calcaneus, abduction, longitudinal, atn, talus) {
        let res = malleolus+calcaneus+abduction+longitudinal+atn+talus
        console.log(malleolus, calcaneus, abduction, longitudinal, atn, talus, res)
        resultsText.text = "Resultados: " + res.toString()
    }

    Rectangle {
        id: name
        color: '#f7fafe'
        anchors.fill: parent
        Column {
            anchors.centerIn: parent
            spacing: 20
            Text {
                id: resultsText
                text: qsTr("Resultados")
                color: "#09325f"
                font.pixelSize: 20
            }
            Button{
                text: qsTr("Refazer teste")
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
                onClicked: results.redoTest()
            }
            Button{
                text: qsTr("Novo teste")
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
                onClicked: results.newTest()
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
                onClicked: results.finish()
            }
        }
    }
}
