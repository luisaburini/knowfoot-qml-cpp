#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QPermission>
#include <QCamera>

void checkCameraPermission() {
    QCameraPermission cameraPermission;
    switch (qApp->checkPermission(cameraPermission)) {
    case Qt::PermissionStatus::Granted:
        // Permissão já concedida, pode iniciar a câmera
        break;
    case Qt::PermissionStatus::Denied:
        // Permissão negada pelo usuário
        break;
    case Qt::PermissionStatus::Undetermined:
        // Solicita a permissão em tempo de execução
        qApp->requestPermission(cameraPermission, [](const QPermission &permission) {
            if (permission.status() == Qt::PermissionStatus::Granted) {
                // Câmera autorizada! Inicialize o QCamera aqui
            }
        });
        break;
    }
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("knowfoot", "Main");

    checkCameraPermission();

    return app.exec();
}
