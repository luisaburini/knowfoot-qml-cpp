import QtQuick
import QtQuick.Controls
import QtQuick.Window
import "./screens/"

Window {
    visible: true
    title: qsTr("KnowFoot")
    visibility: Window.FullScreen

    ResultsScreen{
        id: resultsScreen
        visible: false
        onRedoTest: {
            resultsScreen.visible = false
            testScreen.visible = true
        }
        onNewTest: {
            resultsScreen.visible = false
            testScreen.visible = true
        }
    }

    FPITalusScreen{
        id: fpiTalusScreen
        visible: false
        onNextPage: {
            fpiTalusScreen.visible = false
            resultsScreen.calculate(fpiMalleolusScreen.level,
                                    fpiCalcaneousScreen.level,
                                    fpiAbductionScreen.level,
                                    fpiLongitudinalScreen.level,
                                    fpiATNScreen.level,
                                    fpiTalusScreen.level)
            resultsScreen.visible = true
        }
        onPreviousPage: {
            fpiTalusScreen.visible = false
            fpiATNScreen.visible = true
            fpiATNScreen.state = "PhotoCapture"
        }
    }
    FPIATNScreen{
        id: fpiATNScreen
        visible: false
        onNextPage: {
            fpiATNScreen.visible = false
            fpiTalusScreen.visible = true
            fpiTalusScreen.state = "PhotoCapture"
        }
        onPreviousPage: {
            fpiATNScreen.visible = false
            fpiLongitudinalScreen.visible = true
            fpiLongitudinalScreen.state = "PhotoCapture"
        }
    }
    FPILongitudinalScreen{
        id: fpiLongitudinalScreen
        visible: false
        onNextPage: {
            fpiLongitudinalScreen.visible = false
            fpiATNScreen.visible = true
            fpiATNScreen.state = "PhotoCapture"
        }
        onPreviousPage: {
            fpiLongitudinalScreen.visible = false
            fpiCalcaneousScreen.visible = true
            fpiCalcaneousScreen.state = "PhotoCapture"
        }
    }
    FPICalcaneusScreen{
        id: fpiCalcaneousScreen
        visible: false
        onNextPage: {
            fpiCalcaneousScreen.visible = false
            fpiLongitudinalScreen.visible = true
            fpiLongitudinalScreen.state = "PhotoCapture"
        }
        onPreviousPage: {
            fpiCalcaneousScreen.visible = false
            fpiAbductionScreen.visible = true
            fpiAbductionScreen.state = "PhotoCapture"
        }
    }
    FPIAbductionScreen{
        id: fpiAbductionScreen
        visible: false
        onNextPage: {
            fpiAbductionScreen.visible = false
            fpiCalcaneousScreen.visible = true
            fpiCalcaneousScreen.state = "PhotoCapture"
        }
        onPreviousPage: {
            fpiAbductionScreen.visible = false
            fpiMalleolusScreen.visible = true
            fpiMalleolusScreen.state = "PhotoCapture"
        }
    }
    FPIMalleolusScreen{
        id: fpiMalleolusScreen
        visible: false
        onNextPage: {
            fpiMalleolusScreen.visible = false
            fpiAbductionScreen.visible = true
            fpiAbductionScreen.state = "PhotoCapture"
        }
        onPreviousPage: {
            fpiMalleolusScreen.visible = false
            testScreen.visible = true
        }
    }


    ManageScreen{
        id: manageScreen
        visible: false
    }
    RegisterScreen{
        id: registerScreen
        visible: false
    }

    TestScreen{
        id: testScreen
        visible: false
        onClickedFPI: {
            testScreen.visible = false
            fpiMalleolusScreen.visible = true
        }
        onClickedNavicular: {
            testScreen.visible = false
            fpiMalleolusScreen.visible = false
            homeScreen.visible = true
        }
        onBackHome: {
            testScreen.visible = false
            homeScreen.visible = false
        }
    }

    HomeScreen{
        id: homeScreen
        onClickedTests: {
            testScreen.visible = true
            homeScreen.visible = false
        }
        onClickedManage: {
            manageScreen.visible = true
            homeScreen.visible = false
        }
    }
}
