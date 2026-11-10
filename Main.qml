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
    }
    FPIATNScreen{
        id: fpiATNScreen
        visible: false
        onNextPage: {
            fpiATNScreen.visible = false
            fpiTalusScreen.visible = true
        }
    }
    FPILongitudinalScreen{
        id: fpiLongitudinalScreen
        visible: false
        onNextPage: {
            fpiLongitudinalScreen.visible = false
            fpiATNScreen.visible = true
        }
    }
    FPICalcaneusScreen{
        id: fpiCalcaneousScreen
        visible: false
        onNextPage: {
            fpiCalcaneousScreen.visible = false
            fpiLongitudinalScreen.visible = true
        }
    }
    FPIAbductionScreen{
        id: fpiAbductionScreen
        visible: false
        onNextPage: {
            fpiAbductionScreen.visible = false
            fpiCalcaneousScreen.visible =true
        }
    }
    FPIMalleolusScreen{
        id: fpiMalleolusScreen
        visible: false
        onNextPage: {
            fpiMalleolusScreen.visible = false
            fpiAbductionScreen.visible = true
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
        onClickedFPILeft: {
            testScreen.visible = false
            fpiMalleolusScreen.visible = true
        }
        onClickedFPIRight: {
            testScreen.visible = false
            fpiMalleolusScreen.visible = true
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
