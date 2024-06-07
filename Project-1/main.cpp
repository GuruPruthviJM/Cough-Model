#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "system_log.h"
#include "logmodel.h"
#include "drawer_home.h"
#include "user.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    SystemLog systemLog;
    SystemListModel systemListModel;
    Drawer drawerCpp;
    UserProfile user;
    engine.rootContext()->setContextProperty("systemLog", &systemLog);
    engine.rootContext()->setContextProperty("systemListModel", &systemListModel);
    engine.rootContext()->setContextProperty("drawerCpp", &drawerCpp);
    engine.rootContext()->setContextProperty("user",&user);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
