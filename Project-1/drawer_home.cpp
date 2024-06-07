#include "drawer_home.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QStandardItem>
#include <QAbstractItemModel>
#include <QStandardItemModel>
#include <QStandardItem>

Drawer::Drawer(QObject *parent) : QObject(parent) {}

void Drawer::createTable() {
    QSqlQuery query(m_database);
    QString createQuery = "CREATE TABLE IF NOT EXISTS Drawer_Table ("
                          "Type TEXT PRIMARY KEY,"
                          "Value TEXT)";

    if (!query.exec(createQuery)) {
        qWarning() << "Error: could not create table" << query.lastError().text();
    } else {
        qDebug() << "Table created successfully";
    }
}

void Drawer::insertOrUpdateData(const QString& type, const QString& value) {
    QSqlQuery query(m_database);
    query.prepare("SELECT Type FROM Drawer_Table WHERE Type = ?");
    query.bindValue(0, type);
    if (query.exec() && query.next()) {
        query.prepare("UPDATE Drawer_Table SET Value = ? WHERE Type = ?");
        query.bindValue(0, value);
        query.bindValue(1, type);
        if (!query.exec()) {
            qWarning() << "Error updating data:" << query.lastError().text();
        } else {
            qDebug() << "Data updated successfully for type:" << type;
        }
    } else {
        query.prepare("INSERT INTO Drawer_Table (Type, Value) VALUES (?, ?)");
        query.bindValue(0, type);
        query.bindValue(1, value);
        if (!query.exec()) {
            qWarning() << "Error inserting data:" << query.lastError().text();
        } else {
            qDebug() << "Data inserted successfully for type:" << type;
        }
    }
}

QString Drawer::retrieveValue(const QString& type) {
    QSqlQuery query(m_database);
    query.prepare("SELECT Value FROM Drawer_Table WHERE Type = ?");
    query.bindValue(0, type);
    if (query.exec() && query.next()) {
        return query.value(0).toString();
    } else {
        qWarning() << "Error retrieving value for type:" << type << query.lastError().text();
        return QString();
    }
}
