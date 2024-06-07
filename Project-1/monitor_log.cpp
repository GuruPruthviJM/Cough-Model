// //monitor_log.cpp

// #include "system_log.h"
// #include <QSqlQuery>
// #include <QSqlError>
// #include <QDebug>
// #include <QStandardItem>
// #include <QAbstractItemModel>
// #include <QStandardItemModel>
// #include <QStandardItem>


// SystemLog::SystemLog(QObject *parent) : QObject(parent) {}

// void SystemLog::initializeDatabase() {
//     m_database = QSqlDatabase::addDatabase("QSQLITE");
//     m_database.setDatabaseName("major.db");
//     if (!m_database.open()) {
//         qWarning() << "Error: could not open database" << m_database.lastError().text();
//         return;
//     } else {
//         qDebug() << "Database opened successfully";
//     }
//     QSqlQuery query(m_database);
//     if (!query.exec("CREATE TABLE IF NOT EXISTS System_log("
//                     "Event_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
//                     "Time_Stamp TEXT, "
//                     "Log_Type TEXT, "
//                     "Event_Type TEXT,"
//                     "Value INTEGER,"
//                     "Ref_ID INTEGER)")) {
//         qWarning() << "Error: could not create table" << query.lastError().text();
//     } else {
//         qDebug() << "Table created successfully";
//     }
// }
// void SystemLog::insertData(const QString& timeStamp, const QString& logType, const QString& eventType) {
//     QSqlQuery insertQuery(m_database);
//     insertQuery.prepare("INSERT INTO System_log (Time_Stamp, Log_Type, Event_Type) "
//                         "VALUES (:timeStamp, :logType, :eventType)");
//     insertQuery.bindValue(":timeStamp", timeStamp);
//     insertQuery.bindValue(":logType", logType);
//     insertQuery.bindValue(":eventType", eventType);
//     if (!insertQuery.exec()) {
//         qWarning() << "Error inserting log:" << insertQuery.lastError().text();
//         return;
//     }
//     QSqlQuery selectQuery("SELECT last_insert_rowid() AS lastRowId", m_database);
//     if (!selectQuery.exec() || !selectQuery.next()) {
//         qWarning() << "Error retrieving last inserted ID:" << selectQuery.lastError().text();
//         return;
//     }
//     int lastEventId = selectQuery.value("lastRowId").toInt();

//     QSqlQuery updateQuery(m_database);
//     updateQuery.prepare("UPDATE System_log SET Value = :eventId, Ref_ID = :eventId WHERE Event_ID = :eventId");
//     updateQuery.bindValue(":eventId", lastEventId);

//     if (!updateQuery.exec()) {
//         qWarning() << "Error updating log:" << updateQuery.lastError().text();
//         return;
//     }
//     qDebug() << "System Log inserted successfully with Event_ID:" << lastEventId;
// }



// QVariantList SystemLog::fetchData() {
//     QVariantList resultList;
//     QSqlQuery query("SELECT * FROM System_log ORDER BY Event_ID DESC", m_database);
//     if (!query.exec()) {
//         qWarning() << "Error retrieving data:" << query.lastError().text();
//         return resultList;
//     }
//     while (query.next()) {
//         QVariantMap rowData;
//         rowData["Event_ID"] = query.value("Event_ID").toInt();
//         rowData["Time_Stamp"] = query.value("Time_Stamp").toString();
//         rowData["Log_Type"] = query.value("Log_Type").toString();
//         rowData["Event_Type"] = query.value("Event_Type").toString();
//         rowData["Value"] = query.value("Value").toInt();
//         rowData["Ref_ID"] = query.value("Ref_ID").toInt();
//         resultList.append(rowData);
//     }
//     return resultList;
// }
