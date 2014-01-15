# Add more folders to ship with the application, here
folder_01.source = qml/Interface
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
 CONFIG += xml
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    imageseacher.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    imageseacher.h

RESOURCES += \
    resource.qrc
