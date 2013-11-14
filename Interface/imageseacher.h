#ifndef IMAGESEACHER_H
#define IMAGESEACHER_H

#include <QObject>
#include <QDir>
#include <QDebug>
#include <QFileInfoList>
class ImageSeacher : public QObject
{
    Q_OBJECT
public:
    explicit ImageSeacher(QObject *parent = 0);
    Q_INVOKABLE QList<QVariant> getImageList();
signals:
    
public slots:
    
};

#endif // IMAGESEACHER_H
