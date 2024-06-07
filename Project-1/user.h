#ifndef USER_H
#define USER_H

#include <QObject>
#include <QSqlDatabase>
#include <QVariantList>
#include <QVariantMap>
#include <QAbstractItemModel>
#include <QStandardItemModel>

class UserProfile : public QObject
{
    Q_OBJECT
public:
    explicit Q_INVOKABLE UserProfile(QObject *parent = nullptr);
    Q_INVOKABLE void createUserInfoTable();
    Q_INVOKABLE void insertUserInfo(const QString& name, const QList<double>& values);
    Q_INVOKABLE QVariantMap retrieveUserInfo(const QString& name);
    Q_INVOKABLE void updateUserInfo(const QString& name, const QList<double>& values);
    Q_INVOKABLE void deleteUserInfo(const QString& name);
    Q_INVOKABLE QVariantList getUserNamesAuto();
    Q_INVOKABLE QVariantList getUserNamesManual();
    Q_INVOKABLE bool isUserNamePresent(const QString& userName);
private:
    QSqlDatabase m_database;
};

#endif // USER_H
