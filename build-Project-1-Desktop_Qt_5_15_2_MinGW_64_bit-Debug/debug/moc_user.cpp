/****************************************************************************
** Meta object code from reading C++ file 'user.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Project-1/user.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'user.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_UserProfile_t {
    QByteArrayData data[15];
    char stringdata0[191];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_UserProfile_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_UserProfile_t qt_meta_stringdata_UserProfile = {
    {
QT_MOC_LITERAL(0, 0, 11), // "UserProfile"
QT_MOC_LITERAL(1, 12, 19), // "createUserInfoTable"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 14), // "insertUserInfo"
QT_MOC_LITERAL(4, 48, 4), // "name"
QT_MOC_LITERAL(5, 53, 13), // "QList<double>"
QT_MOC_LITERAL(6, 67, 6), // "values"
QT_MOC_LITERAL(7, 74, 16), // "retrieveUserInfo"
QT_MOC_LITERAL(8, 91, 14), // "updateUserInfo"
QT_MOC_LITERAL(9, 106, 14), // "deleteUserInfo"
QT_MOC_LITERAL(10, 121, 16), // "getUserNamesAuto"
QT_MOC_LITERAL(11, 138, 18), // "getUserNamesManual"
QT_MOC_LITERAL(12, 157, 17), // "isUserNamePresent"
QT_MOC_LITERAL(13, 175, 8), // "userName"
QT_MOC_LITERAL(14, 184, 6) // "parent"

    },
    "UserProfile\0createUserInfoTable\0\0"
    "insertUserInfo\0name\0QList<double>\0"
    "values\0retrieveUserInfo\0updateUserInfo\0"
    "deleteUserInfo\0getUserNamesAuto\0"
    "getUserNamesManual\0isUserNamePresent\0"
    "userName\0parent"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_UserProfile[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       2,   80, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   54,    2, 0x02 /* Public */,
       3,    2,   55,    2, 0x02 /* Public */,
       7,    1,   60,    2, 0x02 /* Public */,
       8,    2,   63,    2, 0x02 /* Public */,
       9,    1,   68,    2, 0x02 /* Public */,
      10,    0,   71,    2, 0x02 /* Public */,
      11,    0,   72,    2, 0x02 /* Public */,
      12,    1,   73,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, 0x80000000 | 5,    4,    6,
    QMetaType::QVariantMap, QMetaType::QString,    4,
    QMetaType::Void, QMetaType::QString, 0x80000000 | 5,    4,    6,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QVariantList,
    QMetaType::QVariantList,
    QMetaType::Bool, QMetaType::QString,   13,

 // constructors: parameters
    0x80000000 | 2, QMetaType::QObjectStar,   14,
    0x80000000 | 2,

 // constructors: name, argc, parameters, tag, flags
       0,    1,   76,    2, 0x0e /* Public */,
       0,    0,   79,    2, 0x2e /* Public | MethodCloned */,

       0        // eod
};

void UserProfile::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { UserProfile *_r = new UserProfile((*reinterpret_cast< QObject*(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { UserProfile *_r = new UserProfile();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        default: break;
        }
    } else if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<UserProfile *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->createUserInfoTable(); break;
        case 1: _t->insertUserInfo((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QList<double>(*)>(_a[2]))); break;
        case 2: { QVariantMap _r = _t->retrieveUserInfo((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->updateUserInfo((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QList<double>(*)>(_a[2]))); break;
        case 4: _t->deleteUserInfo((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: { QVariantList _r = _t->getUserNamesAuto();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 6: { QVariantList _r = _t->getUserNamesManual();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 7: { bool _r = _t->isUserNamePresent((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 1:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<double> >(); break;
            }
            break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 1:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<double> >(); break;
            }
            break;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject UserProfile::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_UserProfile.data,
    qt_meta_data_UserProfile,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *UserProfile::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *UserProfile::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_UserProfile.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int UserProfile::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
