#ifndef SYSTEM_LOG_H
#define SYSTEM_LOG_H


#include <QObject>
#include <QSqlDatabase>
#include <QVariantList>
#include <QVariantMap>
#include <QAbstractItemModel>
#include <QStandardItemModel>


class SystemLog : public QObject
{
    Q_OBJECT
public:
    explicit Q_INVOKABLE SystemLog(QObject *parent = nullptr);
    Q_INVOKABLE void initializeDatabase();
    Q_INVOKABLE void insertData(const QString& timeStamp, const QString& logType, const QString& eventType);
    Q_INVOKABLE void insertDataToMonitorLog(const QString& timeStamp, const QString& logType, const QString& eventType);
    Q_INVOKABLE void insertTechData(const QString& timeStamp, const QString& logType, const QString& eventType);
    Q_INVOKABLE QVariantList fetchData();
    Q_INVOKABLE QVariantList fetchMonitorData();
    Q_INVOKABLE QVariantList fetchTechData();
    // Q_INVOKABLE QVariantList fetchDataP(int rowId);
    // Q_INVOKABLE bool verifyLogin(const QString &name, const QString &password);
    // Q_INVOKABLE bool deleteRow(int rowid);
    // Q_INVOKABLE void updateData(int row1, const QString &namePerson, const QString &passwordPerson, const QString &agePerson, const QString &genderPerson);


private:
    QSqlDatabase m_database;
};

#endif // SYSTEM_LOG_H
