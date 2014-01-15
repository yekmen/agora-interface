#include "imageseacher.h"

ImageSeacher::ImageSeacher(QObject *parent) :
    QObject(parent)
{
    getImageList();
}

QList<QVariant> ImageSeacher::getImageList()
{
    QDir dir;
    QFileInfoList listFileInfo;
    QStringList filter;
    filter << "*.jpg"
           << "*.png";

//    if(dir.cd("/home/pi/image")){
    if(dir.cd("/home/yekmen/Images")){
        qDebug() << " ------ Folder is exist! ------- ";
        listFileInfo = dir.entryInfoList(filter,QDir::Files);
        qDebug() << listFileInfo.size() << " items founds";
    }
    else
        qDebug() << "Folder not exist!";
//    return listFileInfo;
}
