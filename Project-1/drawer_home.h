#ifndef DRAWER_HOME_H
#define DRAWER_HOME_H

#include <QObject>
#include <QSqlDatabase>
#include <QVariantList>
#include <QVariantMap>
#include <QAbstractItemModel>
#include <QStandardItemModel>

class Drawer : public QObject
{
    Q_OBJECT
public:
    explicit Q_INVOKABLE Drawer(QObject *parent = nullptr);
    Q_INVOKABLE void createTable();
    Q_INVOKABLE void insertOrUpdateData(const QString& type, const QString& value);
    Q_INVOKABLE QString retrieveValue(const QString& type);

private:
    QSqlDatabase m_database;
};
#endif // DRAWER_HOME_H
