// #include "drawer_home.h"
#include "user.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QStandardItem>
#include <QAbstractItemModel>
#include <QStandardItemModel>
#include <QStandardItem>


UserProfile::UserProfile(QObject *parent) : QObject(parent) {}

void UserProfile::createUserInfoTable() {
    QSqlQuery query(m_database);
    QString createQuery = "CREATE TABLE IF NOT EXISTS User_Info ("
                          "Name TEXT PRIMARY KEY,"
                          "Pause_Pressure_Main_Value TEXT,"
                          "Pause_Pressure_Slider_Value TEXT,"
                          "Insp_Pressure_Main_Value TEXT,"
                          "Insp_Pressure_Slider_Value TEXT,"
                          "Exp_Pressure_Main_Value TEXT,"
                          "Exp_Pressure_Slider_Value TEXT,"
                          "Cycle_val TEXT,"
                          "greenStratPointerWidth TEXT,"
                          "greenPointerHeight TEXT,"
                          "greenEndPointerWidth TEXT,"
                          "yellowStratPointerWidth TEXT,"
                          "yellowPointerHeight TEXT,"
                          "yellowEndPointerWidth TEXT,"
                          "blueStratPointerWidth TEXT,"
                          "bluePointerHeight TEXT,"
                          "blueEndPointerWidth REAL)";

    if (!query.exec(createQuery)) {
        qWarning() << "Error: could not create table" << query.lastError().text();
    } else {
        qDebug() << "User_Info table created successfully";
    }
}



void UserProfile::insertUserInfo(const QString& name, const QList<double>& values) {
    if (values.size() != 16) {
        qWarning() << "Error: Incorrect number of values provided";
        return;
    }

    QSqlQuery query(m_database);
    query.prepare("INSERT INTO User_Info "
                  "(Name, Pause_Pressure_Main_Value, Pause_Pressure_Slider_Value, "
                  "Insp_Pressure_Main_Value, Insp_Pressure_Slider_Value, "
                  "Exp_Pressure_Main_Value, Exp_Pressure_Slider_Value, "
                  "Cycle_val, greenStratPointerWidth, greenPointerHeight, "
                  "greenEndPointerWidth, yellowStratPointerWidth, yellowPointerHeight, "
                  "yellowEndPointerWidth, blueStratPointerWidth, bluePointerHeight, "
                  "blueEndPointerWidth) "
                  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    query.addBindValue(name);
    for(int i = 0; i < 16; ++i){
        query.addBindValue(values[i]);
    }
    if(!query.exec()){
        qWarning() << "Error: Failed to insert data" << query.lastError().text();
    }else{
        qDebug() << "Data inserted successfully for user:" << name;
    }
}



void UserProfile::deleteUserInfo(const QString& name) {
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM User_Info WHERE Name = :name");
    query.bindValue(":name", name);

    if (!query.exec()) {
        qWarning() << "Error: could not delete data from User_Info table for name" << name << query.lastError().text();
    } else {
        qDebug() << "Data deleted from User_Info table successfully for name" << name;
    }
}


void UserProfile::updateUserInfo(const QString& name, const QList<double>& values) {
    if (values.size() != 16) {
        qWarning() << "Error: Invalid number of values provided for updating User_Info table";
        return;
    }

    QSqlQuery query(m_database);
    query.prepare("UPDATE User_Info SET "
                  "Pause_Pressure_Main_Value = :pauseMain, "
                  "Pause_Pressure_Slider_Value = :pauseSlider, "
                  "Insp_Pressure_Main_Value = :inspMain, "
                  "Insp_Pressure_Slider_Value = :inspSlider, "
                  "Exp_Pressure_Main_Value = :expMain, "
                  "Exp_Pressure_Slider_Value = :expSlider, "
                  "Cycle_val = :cycle, "
                  "greenStratPointerWidth = :greenStratWidth, "
                  "greenPointerHeight = :greenPointerHeight, "
                  "greenEndPointerWidth = :greenEndWidth, "
                  "yellowStratPointerWidth = :yellowStratWidth, "
                  "yellowPointerHeight = :yellowPointerHeight, "
                  "yellowEndPointerWidth = :yellowEndWidth, "
                  "blueStratPointerWidth = :blueStratWidth, "
                  "bluePointerHeight = :bluePointerHeight, "
                  "blueEndPointerWidth = :blueEndWidth "
                  "WHERE Name = :name");
    query.bindValue(":name", name);
    query.bindValue(":pauseMain", values[0]);
    query.bindValue(":pauseSlider", values[1]);
    query.bindValue(":inspMain", values[2]);
    query.bindValue(":inspSlider", values[3]);
    query.bindValue(":expMain", values[4]);
    query.bindValue(":expSlider", values[5]);
    query.bindValue(":cycle", values[6]);
    query.bindValue(":greenStratWidth", values[7]);
    query.bindValue(":greenPointerHeight", values[8]);
    query.bindValue(":greenEndWidth", values[9]);
    query.bindValue(":yellowStratWidth", values[10]);
    query.bindValue(":yellowPointerHeight", values[11]);
    query.bindValue(":yellowEndWidth", values[12]);
    query.bindValue(":blueStratWidth", values[13]);
    query.bindValue(":bluePointerHeight", values[14]);
    query.bindValue(":blueEndWidth", values[15]);
    if (!query.exec()) {
        qWarning() << "Error: could not update data in User_Info table for name" << name << query.lastError().text();
    } else {
        qDebug() << "Data updated in User_Info table successfully for name" << name;
    }
}



QMap<QString, QVariant> UserProfile::retrieveUserInfo(const QString& name) {
    QSqlQuery query(m_database);
    query.prepare("SELECT * FROM User_Info WHERE Name = :name");
    query.bindValue(":name", name);

    QMap<QString, QVariant> userInfo;

    if (query.exec() && query.next()) {
        userInfo["Name"] = query.value("Name");
        userInfo["Pause_Pressure_Main_Value"] = query.value("Pause_Pressure_Main_Value");
        userInfo["Pause_Pressure_Slider_Value"] = query.value("Pause_Pressure_Slider_Value");
        userInfo["Insp_Pressure_Main_Value"] = query.value("Insp_Pressure_Main_Value");
        userInfo["Insp_Pressure_Slider_Value"] = query.value("Insp_Pressure_Slider_Value");
        userInfo["Exp_Pressure_Main_Value"] = query.value("Exp_Pressure_Main_Value");
        userInfo["Exp_Pressure_Slider_Value"] = query.value("Exp_Pressure_Slider_Value");
        userInfo["Cycle_val"] = query.value("Cycle_val");
        userInfo["greenStratPointerWidth"] = query.value("greenStratPointerWidth");
        userInfo["greenPointerHeight"] = query.value("greenPointerHeight");
        userInfo["greenEndPointerWidth"] = query.value("greenEndPointerWidth");
        userInfo["yellowStratPointerWidth"] = query.value("yellowStratPointerWidth");
        userInfo["yellowPointerHeight"] = query.value("yellowPointerHeight");
        userInfo["yellowEndPointerWidth"] = query.value("yellowEndPointerWidth");
        userInfo["blueStratPointerWidth"] = query.value("blueStratPointerWidth");
        userInfo["bluePointerHeight"] = query.value("bluePointerHeight");
        userInfo["blueEndPointerWidth"] = query.value("blueEndPointerWidth");
    } else {
        qWarning() << "Error: could not retrieve data from User_Info table for name" << name << query.lastError().text();
    }
    return userInfo;
}



QVariantList UserProfile::getUserNamesAuto() {
    QSqlQuery query(m_database);
    QVariantList userList;

    if (query.exec("SELECT Name FROM User_Info WHERE Name = 'Auto' or Name LIKE 'A-%' ORDER BY rowid")) {
        while (query.next()) {
            userList.append(query.value("Name").toString());
        }
    } else {
        qWarning() << "Error: could not retrieve user names" << query.lastError().text();
    }
    return userList;
}



QVariantList UserProfile::getUserNamesManual() {
    QSqlQuery query(m_database);
    QVariantList userList;
    if (query.exec("SELECT Name FROM User_Info WHERE Name = 'Manual' or Name LIKE 'M-%' ORDER BY rowid")) {
        while (query.next()) {
            userList.append(query.value("Name").toString());
        }
    } else {
        qWarning() << "Error: could not retrieve user names" << query.lastError().text();
    }
    return userList;
}

bool UserProfile::isUserNamePresent(const QString& userName) {
    QSqlQuery query(m_database);
    bool isPresent = false;

    // Prepare the query to check if the user name exists
    QString queryString = "SELECT COUNT(*) FROM User_Info WHERE Name = ?";
    query.prepare(queryString);
    query.addBindValue(userName);

    // Execute the query
    if (query.exec() && query.next()) {
        int count = query.value(0).toInt();
        isPresent = (count > 0); // If count > 0, user name is present
    } else {
        qWarning() << "Error: could not check if user name is present" << query.lastError().text();
    }

    return isPresent;
}

