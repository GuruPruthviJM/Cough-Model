/****************************************************************************
** Meta object code from reading C++ file 'system_log.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Project-1/system_log.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'system_log.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_SystemLog_t {
    QByteArrayData data[13];
    char stringdata0[155];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SystemLog_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SystemLog_t qt_meta_stringdata_SystemLog = {
    {
QT_MOC_LITERAL(0, 0, 9), // "SystemLog"
QT_MOC_LITERAL(1, 10, 18), // "initializeDatabase"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 10), // "insertData"
QT_MOC_LITERAL(4, 41, 9), // "timeStamp"
QT_MOC_LITERAL(5, 51, 7), // "logType"
QT_MOC_LITERAL(6, 59, 9), // "eventType"
QT_MOC_LITERAL(7, 69, 22), // "insertDataToMonitorLog"
QT_MOC_LITERAL(8, 92, 14), // "insertTechData"
QT_MOC_LITERAL(9, 107, 9), // "fetchData"
QT_MOC_LITERAL(10, 117, 16), // "fetchMonitorData"
QT_MOC_LITERAL(11, 134, 13), // "fetchTechData"
QT_MOC_LITERAL(12, 148, 6) // "parent"

    },
    "SystemLog\0initializeDatabase\0\0insertData\0"
    "timeStamp\0logType\0eventType\0"
    "insertDataToMonitorLog\0insertTechData\0"
    "fetchData\0fetchMonitorData\0fetchTechData\0"
    "parent"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SystemLog[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       2,   78, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x02 /* Public */,
       3,    3,   50,    2, 0x02 /* Public */,
       7,    3,   57,    2, 0x02 /* Public */,
       8,    3,   64,    2, 0x02 /* Public */,
       9,    0,   71,    2, 0x02 /* Public */,
      10,    0,   72,    2, 0x02 /* Public */,
      11,    0,   73,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    4,    5,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    4,    5,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    4,    5,    6,
    QMetaType::QVariantList,
    QMetaType::QVariantList,
    QMetaType::QVariantList,

 // constructors: parameters
    0x80000000 | 2, QMetaType::QObjectStar,   12,
    0x80000000 | 2,

 // constructors: name, argc, parameters, tag, flags
       0,    1,   74,    2, 0x0e /* Public */,
       0,    0,   77,    2, 0x2e /* Public | MethodCloned */,

       0        // eod
};

void SystemLog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { SystemLog *_r = new SystemLog((*reinterpret_cast< QObject*(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { SystemLog *_r = new SystemLog();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        default: break;
        }
    } else if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SystemLog *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->initializeDatabase(); break;
        case 1: _t->insertData((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 2: _t->insertDataToMonitorLog((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 3: _t->insertTechData((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 4: { QVariantList _r = _t->fetchData();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 5: { QVariantList _r = _t->fetchMonitorData();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 6: { QVariantList _r = _t->fetchTechData();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject SystemLog::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_SystemLog.data,
    qt_meta_data_SystemLog,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *SystemLog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SystemLog::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_SystemLog.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int SystemLog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
