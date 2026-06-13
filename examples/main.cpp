#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Basic");

    QQmlApplicationEngine engine;
    // Add build dir to import path so solar module is found
    engine.addImportPath(SOLAR_BUILD_DIR);
    engine.load(QUrl::fromLocalFile(SOLAR_EXAMPLE_DIR "/main.qml"));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
