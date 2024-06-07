#include "logmodel.h"
#include <QDebug>
SystemListModel::SystemListModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int SystemListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_data.size();
}

QVariant SystemListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_data.size())
        return QVariant();

    const QVariantMap &item = m_data.at(index.row());

    switch (role) {
    case Event_ID:
        return item.value("Event_ID");
    case Time_Stamp:
        return item.value("Time_Stamp");
    case Log_Type:
        return item.value("Log_Type");
    case Event_Type:
        return item.value("Event_Type");
    case Value:
        return item.value("Value");
    case Ref_ID:
        return item.value("Ref_ID");
    default:
        return QVariant();
    }
}

void SystemListModel::addData(const QVariantMap &data)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_data.append(data);
    endInsertRows();
}

void SystemListModel::clearData()
{
    beginResetModel();
    m_data.clear();
    endResetModel();
}

QHash<int, QByteArray> SystemListModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[Event_ID] = "Event_ID";
    roles[Time_Stamp] = "Time_Stamp";
    roles[Log_Type] = "Log_Type";
    roles[Event_Type] = "Event_Type";
    roles[Value] = "Value";
    roles[Ref_ID] = "Ref_ID";
    return roles;
}
