cmake_minimum_required(VERSION 3.16)

project(knowfoot VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appknowfoot
    main.cpp
)

qt_add_qml_module(appknowfoot
    URI knowfoot
    QML_FILES
        Main.qml
        QML_FILES screens/FPIAbductionScreen.qml screens/FPIATNScreen.qml screens/FPICalcaneusScreen.qml screens/FPILongitudinalScreen.qml screens/FPIMalleolusScreen.qml screens/FPIScreen.qml screens/FPITalusScreen.qml screens/HomeScreen.qml screens/ManageScreen.qml screens/RegisterScreen.qml screens/ResultsScreen.qml screens/TestScreen.qml
        RESOURCES imgs/back.png  imgs/fpiAbduction0.png imgs/fpiAbduction1.png imgs/fpiAbduction2.png imgs/fpiAbduction-1.png imgs/fpiAbduction-2.png imgs/fpiATN0.png imgs/fpiATN1.png imgs/fpiATN2.png imgs/fpiATN-1.png imgs/fpiATN-2.png imgs/fpiCalcaneus0.png imgs/fpiCalcaneus1.png imgs/fpiCalcaneus2.png imgs/fpiCalcaneus-1.png imgs/fpiCalcaneus-2.png imgs/fpiLongitudinal0.png imgs/fpiLongitudinal1.png imgs/fpiLongitudinal2.png imgs/fpiLongitudinal-1.png imgs/fpiLongitudinal-2.png imgs/fpiMalleolus0.png imgs/fpiMalleolus1.png imgs/fpiMalleolus2.png imgs/fpiMalleolus-1.png imgs/fpiMalleolus-2.png imgs/fpiTalus0.png imgs/fpiTalus1.png imgs/fpiTalus2.png imgs/fpiTalus-1.png imgs/fpiTalus-2.png
        QML_FILES screens/FPIAbductionScreen.qml
        RESOURCES imgs/knowfoot-logo.png
        QML_FILES screens/TestsModel.qml
        QML_FILES screens/TutorialModel.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appknowfoot PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appknowfoot
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appknowfoot
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appknowfoot
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
