/****************************************************************************
** Meta object code from reading C++ file 'app.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/app.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'app.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_App[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      19,   14, // methods
       6,  109, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      11,    5,    4,    4, 0x08,

 // methods: signature, parameters, type, tag, flags
     112,   88,   80,    4, 0x02,
     163,  141,    4,    4, 0x02,
     219,  198,  193,    4, 0x02,
     286,  261,  193,    4, 0x02,
     340,  336,  193,    4, 0x02,
     366,    4,    4,    4, 0x02,
     432,  384,  193,    4, 0x02,
     502,    4,    4,    4, 0x02,
     534,  524,    4,    4, 0x02,
     621,  569,  193,    4, 0x02,
     699,  336,  193,    4, 0x02,
    1081,  729,  193,    4, 0x02,
    1355,    4,    4,    4, 0x02,
    1373,  524,    4,    4, 0x02,
    1408,  524,    4,    4, 0x02,
    1795, 1439,  193,    4, 0x02,
    2077,  336,  193,    4, 0x02,
    2103,    4,    4,    4, 0x02,

 // properties: name, type, flags
    2157, 2132, 0x00095409,
    2171, 2132, 0x00095409,
    2189, 2132, 0x00095409,
    2213, 2132, 0x00095409,
    2227, 2132, 0x00095409,
    2251, 2132, 0x00095409,

       0        // eod
};

static const char qt_meta_stringdata_App[] = {
    "App\0\0state\0"
    "registrationStateUpdated(bb::platform::bbm::RegistrationState::Type)\0"
    "QString\0objectName,defaultValue\0"
    "getValueFor(QString,QString)\0"
    "objectName,inputValue\0"
    "saveValueFor(QString,QString)\0bool\0"
    "name,description,img\0"
    "createRecordRoom(QString,QString,QString)\0"
    "key,name,description,img\0"
    "updateRecordRoom(QString,QString,QString,QString)\0"
    "key\0deleteRecordRoom(QString)\0"
    "readRecordsRoom()\0"
    "room_id,room_name,name,description,position,img\0"
    "createRecordLocation(QString,QString,QString,QString,QString,QString)\0"
    "readRecordsLocation()\0id_lookup\0"
    "readRecordsLocationInRoom(QString)\0"
    "key,room_id,room_name,name,description,position,img\0"
    "updateRecordLocation(QString,QString,QString,QString,QString,QString,Q"
    "String)\0"
    "deleteRecordLocation(QString)\0"
    "room_id,room_name,location_id,location_name,img,picture,name,descripti"
    "on,type,brand,model_number,serial_number,version,capacity,expiry_date,"
    "artist,author,genre,year,purchase_date,purchase_location,purchase_meth"
    "od,purchase_notes,purchase_price,warranty,warranty_name,warranty_num,w"
    "arranty_num2,warranty_date_start,warranty_date_end,warranty_notes,note"
    "s\0"
    "createRecordItem(QString,QString,QString,QString,QString,QString,QStri"
    "ng,QString,QString,QString,QString,QString,QString,QString,QString,QSt"
    "ring,QString,QString,QString,QString,QString,QString,QString,QString,Q"
    "String,QString,QString,QString,QString,QString,QString,QString)\0"
    "readRecordsItem()\0readRecordsItemInLocation(QString)\0"
    "readRecordsItemInRoom(QString)\0"
    "key,room_id,room_name,location_id,location_name,img,picture,name,descr"
    "iption,type,brand,model_number,serial_number,version,capacity,expiry_d"
    "ate,artist,author,genre,year,purchase_date,purchase_location,purchase_"
    "method,purchase_notes,purchase_price,warranty,warranty_name,warranty_n"
    "um,warranty_num2,warranty_date_start,warranty_date_end,warranty_notes,"
    "notes\0"
    "updateRecordItem(QString,QString,QString,QString,QString,QString,QStri"
    "ng,QString,QString,QString,QString,QString,QString,QString,QString,QSt"
    "ring,QString,QString,QString,QString,QString,QString,QString,QString,Q"
    "String,QString,QString,QString,QString,QString,QString,QString,QString"
    ")\0"
    "deleteRecordItem(QString)\0"
    "inviteUserToDownloadViaBBM()\0"
    "bb::cascades::DataModel*\0dataModelRoom\0"
    "dataModelLocation\0dataModelLocationInRoom\0"
    "dataModelItem\0dataModelItemInLocation\0"
    "dataModelItemInRoom\0"
};

void App::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        App *_t = static_cast<App *>(_o);
        switch (_id) {
        case 0: _t->registrationStateUpdated((*reinterpret_cast< bb::platform::bbm::RegistrationState::Type(*)>(_a[1]))); break;
        case 1: { QString _r = _t->getValueFor((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 2: _t->saveValueFor((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 3: { bool _r = _t->createRecordRoom((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 4: { bool _r = _t->updateRecordRoom((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 5: { bool _r = _t->deleteRecordRoom((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 6: _t->readRecordsRoom(); break;
        case 7: { bool _r = _t->createRecordLocation((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])),(*reinterpret_cast< const QString(*)>(_a[5])),(*reinterpret_cast< const QString(*)>(_a[6])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 8: _t->readRecordsLocation(); break;
        case 9: _t->readRecordsLocationInRoom((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 10: { bool _r = _t->updateRecordLocation((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])),(*reinterpret_cast< const QString(*)>(_a[5])),(*reinterpret_cast< const QString(*)>(_a[6])),(*reinterpret_cast< const QString(*)>(_a[7])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 11: { bool _r = _t->deleteRecordLocation((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 12: { bool _r = _t->createRecordItem((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])),(*reinterpret_cast< const QString(*)>(_a[5])),(*reinterpret_cast< const QString(*)>(_a[6])),(*reinterpret_cast< const QString(*)>(_a[7])),(*reinterpret_cast< const QString(*)>(_a[8])),(*reinterpret_cast< const QString(*)>(_a[9])),(*reinterpret_cast< const QString(*)>(_a[10])),(*reinterpret_cast< const QString(*)>(_a[11])),(*reinterpret_cast< const QString(*)>(_a[12])),(*reinterpret_cast< const QString(*)>(_a[13])),(*reinterpret_cast< const QString(*)>(_a[14])),(*reinterpret_cast< const QString(*)>(_a[15])),(*reinterpret_cast< const QString(*)>(_a[16])),(*reinterpret_cast< const QString(*)>(_a[17])),(*reinterpret_cast< const QString(*)>(_a[18])),(*reinterpret_cast< const QString(*)>(_a[19])),(*reinterpret_cast< const QString(*)>(_a[20])),(*reinterpret_cast< const QString(*)>(_a[21])),(*reinterpret_cast< const QString(*)>(_a[22])),(*reinterpret_cast< const QString(*)>(_a[23])),(*reinterpret_cast< const QString(*)>(_a[24])),(*reinterpret_cast< const QString(*)>(_a[25])),(*reinterpret_cast< const QString(*)>(_a[26])),(*reinterpret_cast< const QString(*)>(_a[27])),(*reinterpret_cast< const QString(*)>(_a[28])),(*reinterpret_cast< const QString(*)>(_a[29])),(*reinterpret_cast< const QString(*)>(_a[30])),(*reinterpret_cast< const QString(*)>(_a[31])),(*reinterpret_cast< const QString(*)>(_a[32])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 13: _t->readRecordsItem(); break;
        case 14: _t->readRecordsItemInLocation((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 15: _t->readRecordsItemInRoom((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 16: { bool _r = _t->updateRecordItem((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])),(*reinterpret_cast< const QString(*)>(_a[5])),(*reinterpret_cast< const QString(*)>(_a[6])),(*reinterpret_cast< const QString(*)>(_a[7])),(*reinterpret_cast< const QString(*)>(_a[8])),(*reinterpret_cast< const QString(*)>(_a[9])),(*reinterpret_cast< const QString(*)>(_a[10])),(*reinterpret_cast< const QString(*)>(_a[11])),(*reinterpret_cast< const QString(*)>(_a[12])),(*reinterpret_cast< const QString(*)>(_a[13])),(*reinterpret_cast< const QString(*)>(_a[14])),(*reinterpret_cast< const QString(*)>(_a[15])),(*reinterpret_cast< const QString(*)>(_a[16])),(*reinterpret_cast< const QString(*)>(_a[17])),(*reinterpret_cast< const QString(*)>(_a[18])),(*reinterpret_cast< const QString(*)>(_a[19])),(*reinterpret_cast< const QString(*)>(_a[20])),(*reinterpret_cast< const QString(*)>(_a[21])),(*reinterpret_cast< const QString(*)>(_a[22])),(*reinterpret_cast< const QString(*)>(_a[23])),(*reinterpret_cast< const QString(*)>(_a[24])),(*reinterpret_cast< const QString(*)>(_a[25])),(*reinterpret_cast< const QString(*)>(_a[26])),(*reinterpret_cast< const QString(*)>(_a[27])),(*reinterpret_cast< const QString(*)>(_a[28])),(*reinterpret_cast< const QString(*)>(_a[29])),(*reinterpret_cast< const QString(*)>(_a[30])),(*reinterpret_cast< const QString(*)>(_a[31])),(*reinterpret_cast< const QString(*)>(_a[32])),(*reinterpret_cast< const QString(*)>(_a[33])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 17: { bool _r = _t->deleteRecordItem((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 18: _t->inviteUserToDownloadViaBBM(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData App::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject App::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_App,
      qt_meta_data_App, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &App::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *App::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *App::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_App))
        return static_cast<void*>(const_cast< App*>(this));
    return QObject::qt_metacast(_clname);
}

int App::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 19)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 19;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bb::cascades::DataModel**>(_v) = dataModelRoom(); break;
        case 1: *reinterpret_cast< bb::cascades::DataModel**>(_v) = dataModelLocation(); break;
        case 2: *reinterpret_cast< bb::cascades::DataModel**>(_v) = dataModelLocationInRoom(); break;
        case 3: *reinterpret_cast< bb::cascades::DataModel**>(_v) = dataModelItem(); break;
        case 4: *reinterpret_cast< bb::cascades::DataModel**>(_v) = dataModelItemInLocation(); break;
        case 5: *reinterpret_cast< bb::cascades::DataModel**>(_v) = dataModelItemInRoom(); break;
        }
        _id -= 6;
    } else if (_c == QMetaObject::WriteProperty) {
        _id -= 6;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
