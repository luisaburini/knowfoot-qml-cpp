import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import "."

Item {
    id: test
    anchors.fill: parent

    property int whichTest
    property bool isEvaluation

    onVisibleChanged: {
        if (test.visible) {
            test.whichTest = -2
            test.isEvaluation = true
        }
    }
    onWhichTestChanged: {
        console.log("Which test changed " + test.whichTest)
        if (test.whichTest === 0) {
            test.clickedFPI()
        }
        if (test.whichTest === 1) {
            test.clickedNavicular()
        }
    }

    signal clickedFPI()
    signal clickedNavicular()


    signal backHome()

    Rectangle {
        id: name
        color: "#f6fbff"
        anchors.fill: parent
        Layout.fillWidth: true
        Column{
            spacing: 2
            anchors.centerIn: parent
            Text {
                text: qsTr("Testes")
                padding: 10
                width: 400
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                font.pointSize: 30
                color: "#09325f"
            }
            SearchField {
                width: 400
                background: Rectangle{
                    radius: 40
                    color: "white"
                    anchors.fill: parent
                }
                searchIndicator.indicator: null
                clearIndicator.indicator: null
            }

            ButtonGroup { id: group }
            Row {
                Button {
                    id: evalButton
                    text: qsTr("Avaliações")
                    font.bold: true
                    font.pointSize: 20
                    width: 200
                    background: Rectangle {
                        width: 200
                        color: "#4473b3"
                    }
                    onClicked: {
                        test.isEvaluation = true
                    }
                    ButtonGroup.group: group
                }
                Button {
                    id: tutorialButton
                    text: qsTr("Tutoriais")
                    font.pointSize: 20
                    width: 200
                    background: Rectangle {
                        width: 200
                        color: "#deeeff"
                    }
                    onClicked: {
                        test.isEvaluation = false
                    }
                    ButtonGroup.group: group
                }
            }

            Rectangle {

                width: 400
                height: 700

                Component {
                    id: testsDelegate
                    Item {
                        id: testItem
                        required property string name
                        required property string description
                        width: 400
                        height: 100
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                test.whichTest = testsListView.currentIndex
                                console.log("BUTTON CLICKED which test " + test.whichTest)
                            }
                            Rectangle{
                                color: "#fbfdff"
                                radius: 20
                                anchors.fill: parent
                                Row {
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 10
                                    Item { height: 1; width: 5 }
                                    Image {
                                        id: listIcon
                                        source: "../imgs/knowfoot-logo.png"
                                        height: 50
                                        fillMode: Image.PreserveAspectFit
                                    }
                                    Column {
                                        spacing: 5
                                        Text {
                                            text: testItem.name
                                            font.bold: true
                                            font.pointSize: 20
                                            color: "#09325f"
                                        }
                                        Text {
                                            text: testItem.description
                                            font.pointSize: 15
                                            color: "#8f9aca"
                                        }
                                    }
                                }
                            }
                        }


                    }
                }

                ListView {
                    id: testsListView
                    anchors.fill: parent
                    model: TestsModel {}
                    delegate: testsDelegate
                    highlight: Rectangle { color: "white"; radius: 20 }
                    focus: true
                }
            }
        }
    }
}
