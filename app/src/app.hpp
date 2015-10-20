#ifndef APP_HPP
#define APP_HPP

#include <bb/platform/bbm/Context>
#include <bb/platform/bbm/MessageService>
#include <bb/platform/bbm/UserProfile>

#include <bb/cascades/GroupDataModel>

using namespace bb::cascades;

/*
 * @brief Declaration of our application's class (as opposed to the BB Cascades
 *  application class that contains our application).
 */
class App: public QObject
{
    // Classes that inherit from QObject must have the Q_OBJECT macro so
    // the meta-object compiler (MOC) can add supporting code to the application.
    Q_OBJECT

    // A property that is used by the list view in QML
    Q_PROPERTY(bb::cascades::DataModel* dataModelRoom READ dataModelRoom CONSTANT)
    Q_PROPERTY(bb::cascades::DataModel* dataModelLocation READ dataModelLocation CONSTANT)
    Q_PROPERTY(bb::cascades::DataModel* dataModelLocationInRoom READ dataModelLocationInRoom CONSTANT)
    Q_PROPERTY(bb::cascades::DataModel* dataModelItem READ dataModelItem CONSTANT)
    Q_PROPERTY(bb::cascades::DataModel* dataModelItemInLocation READ dataModelItemInLocation CONSTANT)
    Q_PROPERTY(bb::cascades::DataModel* dataModelItemInRoom READ dataModelItemInRoom CONSTANT)

public:
    App();

    // "Q_INVOKABLE" allows these functions to be called from main.qml
    Q_INVOKABLE QString getValueFor(const QString &objectName, const QString &defaultValue);
    Q_INVOKABLE void saveValueFor(const QString &objectName, const QString &inputValue);

    Q_INVOKABLE bool createRecordRoom(const QString &name, const QString &description, const QString &img);
    Q_INVOKABLE bool updateRecordRoom(const QString &key, const QString &name, const QString &description, const QString &img);
    Q_INVOKABLE bool deleteRecordRoom(const QString &key);
    Q_INVOKABLE void readRecordsRoom();

    Q_INVOKABLE bool createRecordLocation(const QString &room_id, const QString &room_name, const QString &name, const QString &description, const QString &position, const QString &img);
    Q_INVOKABLE void readRecordsLocation();
    Q_INVOKABLE void readRecordsLocationInRoom(const QString &id_lookup);
    Q_INVOKABLE bool updateRecordLocation(const QString &key, const QString &room_id, const QString &room_name, const QString &name, const QString &description, const QString &position, const QString &img);
    Q_INVOKABLE bool deleteRecordLocation(const QString &key);

    Q_INVOKABLE bool createRecordItem(const QString &room_id, const QString &room_name, const QString &location_id, const QString &location_name, const QString &img, const QString &picture, const QString &name, const QString &description, const QString &type, const QString &brand, const QString &model_number, const QString &serial_number, const QString &version, const QString &capacity, const QString &expiry_date, const QString &artist, const QString &author, const QString &genre, const QString &year, const QString &purchase_date, const QString &purchase_location, const QString &purchase_method, const QString &purchase_notes, const QString &purchase_price, const QString &warranty, const QString &warranty_name, const QString &warranty_num, const QString &warranty_num2, const QString &warranty_date_start, const QString &warranty_date_end, const QString &warranty_notes, const QString &notes);
    Q_INVOKABLE void readRecordsItem();
    Q_INVOKABLE void readRecordsItemInLocation(const QString &id_lookup);
    Q_INVOKABLE void readRecordsItemInRoom(const QString &id_lookup);
    Q_INVOKABLE bool updateRecordItem(const QString &key, const QString &room_id, const QString &room_name, const QString &location_id, const QString &location_name, const QString &img, const QString &picture, const QString &name, const QString &description, const QString &type, const QString &brand, const QString &model_number, const QString &serial_number, const QString &version, const QString &capacity, const QString &expiry_date, const QString &artist, const QString &author, const QString &genre, const QString &year, const QString &purchase_date, const QString &purchase_location, const QString &purchase_method, const QString &purchase_notes, const QString &purchase_price, const QString &warranty, const QString &warranty_name, const QString &warranty_num, const QString &warranty_num2, const QString &warranty_date_start, const QString &warranty_date_end, const QString &warranty_notes, const QString &notes);
    Q_INVOKABLE bool deleteRecordItem(const QString &key);

    Q_INVOKABLE void inviteUserToDownloadViaBBM();

private:
    // Functions to call upon initialization to setup the model and database
    void initDataModel();
    bool initDatabase();

    // To alert the user if something has gone wrong
    void alert(const QString &message);

    // The getter method for the property
    bb::cascades::GroupDataModel* dataModelRoom() const;
    bb::cascades::GroupDataModel* dataModelLocation() const;
    bb::cascades::GroupDataModel* dataModelLocationInRoom() const;
    bb::cascades::GroupDataModel* dataModelItem() const;
    bb::cascades::GroupDataModel* dataModelItemInLocation() const;
    bb::cascades::GroupDataModel* dataModelItemInRoom() const;

    // The data shown by the list view.
    GroupDataModel* m_dataModelRoom;
    GroupDataModel* m_dataModelLocation;
    GroupDataModel* m_dataModelLocationInRoom;
    GroupDataModel* m_dataModelItem;
    GroupDataModel* m_dataModelItemInLocation;
    GroupDataModel* m_dataModelItemInRoom;

    bb::platform::bbm::UserProfile * m_userProfile;
	bb::platform::bbm::Context *m_context;
	bb::platform::bbm::MessageService *m_messageService;
	Q_SLOT void registrationStateUpdated(bb::platform::bbm::RegistrationState::Type state);
};

#endif
