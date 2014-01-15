#include <QApplication>
#include "qmlapplicationviewer.h"
#include <qdeclarative.h>
#include "imageseacher.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    qmlRegisterType<ImageSeacher>("ImageSearcher", 1, 0, "ImageSearcher");


    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/Interface/main.qml"));


    viewer.showExpanded();

    return app->exec();
}
