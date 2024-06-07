#ifndef LOGMODEL_H
#define LOGMODEL_H

#include <QAbstractListModel>
#include <QVariantList>
#include <QHash>

#include <QAbstractListModel>
#include <QList>
#include <QVariantMap>

struct MyListItem
{
    // int Event_ID;
    // QString Time_Stamp;
    // QString Log_Type;
    // QString Event_Type;
    // int Value;
    // int Ref_ID;
};

class SystemListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit SystemListModel(QObject *parent = nullptr);
    enum {
        Event_ID = Qt::UserRole,
        Time_Stamp,
        Log_Type,
        Event_Type,
        Value,
        Ref_ID
    };
    // QAbstractListModel overrides
    Q_INVOKABLE int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    Q_INVOKABLE QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE QHash<int, QByteArray> roleNames() const override;
    Q_INVOKABLE void addData(const QVariantMap &data);
    Q_INVOKABLE void clearData();


private:
    QList<QVariantMap> m_data;
};

#endif // LOGMODEL_H
