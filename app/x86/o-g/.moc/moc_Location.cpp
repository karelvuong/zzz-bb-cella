/****************************************************************************
** Meta object code from reading C++ file 'Location.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/Location.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Location.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Location[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       7,   49, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: signature, parameters, type, tag, flags
      16,   10,    9,    9, 0x05,
      45,   35,    9,    9, 0x05,
      80,   68,    9,    9, 0x05,
     110,  105,    9,    9, 0x05,
     143,  131,    9,    9, 0x05,
     180,  171,    9,    9, 0x05,
     209,  205,    9,    9, 0x05,

 // properties: name, type, flags
     237,  229, 0x0a495803,
     240,  229, 0x0a495803,
     248,  229, 0x0a495803,
     105,  229, 0x0a495903,
     131,  229, 0x0a495903,
     171,  229, 0x0a495903,
     205,  229, 0x0a495903,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,
       6,

       0        // eod
};

static const char qt_meta_stringdata_Location[] = {
    "Location\0\0newId\0idChanged(QString)\0"
    "newRoomId\0roomIDChanged(QString)\0"
    "newRoomName\0roomNameChanged(QString)\0"
    "name\0nameChanged(QString)\0description\0"
    "descriptionChanged(QString)\0position\0"
    "positionChanged(QString)\0img\0"
    "imgChanged(QString)\0QString\0id\0room_id\0"
    "room_name\0"
};

void Location::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Location *_t = static_cast<Location *>(_o);
        switch (_id) {
        case 0: _t->idChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->roomIDChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->roomNameChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->nameChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: _t->descriptionChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->positionChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->imgChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData Location::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Location::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Location,
      qt_meta_data_Location, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Location::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Location::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Location::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Location))
        return static_cast<void*>(const_cast< Location*>(this));
    return QObject::qt_metacast(_clname);
}

int Location::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = id(); break;
        case 1: *reinterpret_cast< QString*>(_v) = room_id(); break;
        case 2: *reinterpret_cast< QString*>(_v) = room_name(); break;
        case 3: *reinterpret_cast< QString*>(_v) = name(); break;
        case 4: *reinterpret_cast< QString*>(_v) = description(); break;
        case 5: *reinterpret_cast< QString*>(_v) = position(); break;
        case 6: *reinterpret_cast< QString*>(_v) = img(); break;
        }
        _id -= 7;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setID(*reinterpret_cast< QString*>(_v)); break;
        case 1: setRoomID(*reinterpret_cast< QString*>(_v)); break;
        case 2: setRoomName(*reinterpret_cast< QString*>(_v)); break;
        case 3: setName(*reinterpret_cast< QString*>(_v)); break;
        case 4: setDescription(*reinterpret_cast< QString*>(_v)); break;
        case 5: setPosition(*reinterpret_cast< QString*>(_v)); break;
        case 6: setImg(*reinterpret_cast< QString*>(_v)); break;
        }
        _id -= 7;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 7;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Location::idChanged(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Location::roomIDChanged(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void Location::roomNameChanged(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void Location::nameChanged(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void Location::descriptionChanged(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void Location::positionChanged(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void Location::imgChanged(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}
QT_END_MOC_NAMESPACE
