#include "app.hpp"

#include "Room.hpp"
#include "Location.hpp"
#include "Item.hpp"

#include <bb/cascades/AbstractPane>
#include <bb/cascades/Application>
#include <bb/cascades/Container>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/SceneCover>
#include <bb/data/SqlConnection>
#include <bb/data/SqlDataAccess>
#include <bb/system/SystemDialog>

#include <QDebug>
#include <QSettings>
#include <QtSql/QtSql>

using namespace bb::cascades;
using namespace bb::data;
using namespace bb::system;

App::App()
	: m_dataModelRoom(0)
	, m_dataModelLocation(0)
	, m_dataModelLocationInRoom(0)
	, m_dataModelItem(0)
	, m_dataModelItemInLocation(0)
	, m_dataModelItemInRoom(0)
{
    // Initialize the Group Data Model before setting up our QML Scene
    // as the QML scene will bind to the data model
    initDataModel();

    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    // Retrieve the path to the app's working directory
    QString workingDir = QDir::currentPath();

    // Build the path, add it as a context property, and expose it to QML
    QDeclarativePropertyMap* paths = new QDeclarativePropertyMap;
    paths->insert("db", QVariant(QString("file://" + workingDir + "/data/cella.db")));
    qml->setContextProperty("paths", paths);

    QmlDocument *qmlCover = QmlDocument::create("asset:///cover.qml").parent(this);

    if (!qmlCover->hasErrors()) {
        // Create the QML Container from using the QMLDocument.
        Container *coverContainer = qmlCover->createRootObject<Container>();

        // Create a SceneCover and set the application cover
        SceneCover *sceneCover = SceneCover::create().content(coverContainer);
        Application::instance()->setCover(sceneCover);
    }

    //-- setContextProperty expose C++ object in QML as an variable
    qml->setContextProperty("_app", this);

    // Creates the root node object as defined in main.qml
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // Give the application the root node to display.
    Application::instance()->setScene(root);

    m_context = new bb::platform::bbm::Context(QUuid("a7f4ce1e-7eb6-4849-9a72-de36194f7192"));
	if (m_context->registrationState()
			!= bb::platform::bbm::RegistrationState::Allowed) {
		connect(m_context,
				SIGNAL(registrationStateUpdated (bb::platform::bbm::RegistrationState::Type)),
				this,
				SLOT(registrationStateUpdated (bb::platform::bbm::RegistrationState::Type)));
		m_context->requestRegisterApplication();
	}

    // Initialize the database, ensure a connection can be established
    // and that all the required tables and initial data exists
    const bool dbInited = initDatabase();

    // Inform the UI if the database was successfully initialized or not
    root->setProperty("databaseOpen", dbInited);
}

void App::initDataModel()
{
    // Note: The Group Data Model is joining this objects tree as a child (for memory management)
    m_dataModelRoom = new GroupDataModel(this);
    m_dataModelRoom->setSortingKeys(QStringList() << "name");
    m_dataModelRoom->setGrouping(ItemGrouping::ByFirstChar);

    m_dataModelLocation = new GroupDataModel(this);
    m_dataModelLocation->setSortingKeys(QStringList() << "room_name" << "name");
    m_dataModelLocation->setGrouping(ItemGrouping::ByFullValue);

    m_dataModelLocationInRoom = new GroupDataModel(this);
    m_dataModelLocationInRoom->setSortingKeys(QStringList() << "name");
    m_dataModelLocationInRoom->setGrouping(ItemGrouping::None);

    m_dataModelItem = new GroupDataModel(this);
    m_dataModelItem->setSortingKeys(QStringList() << "name");
    m_dataModelItem->setGrouping(ItemGrouping::ByFirstChar);

    m_dataModelItemInLocation = new GroupDataModel(this);
    m_dataModelItemInLocation->setSortingKeys(QStringList() << "name");
    m_dataModelItemInLocation->setGrouping(ItemGrouping::None);

    m_dataModelItemInRoom = new GroupDataModel(this);
    m_dataModelItemInRoom->setSortingKeys(QStringList() << "location_name" << "name");
    m_dataModelItemInRoom->setGrouping(ItemGrouping::ByFullValue);
}

bool App::initDatabase()
{
    // Initialize the database and create any tables needed for the app to function
    // properly if they do not already exist.
    QSqlDatabase database = QSqlDatabase::addDatabase("QSQLITE");
    database.setDatabaseName("./data/cella.db");

    // If we cannot open a connection to the database, then fail initialization
    // and display an error message
    if (database.open() == false) {
        const QSqlError error = database.lastError();
        alert(tr("Error opening connection to the database: %1").arg(error.text()));
        qDebug() << "\nDatabase NOT opened.";
        return false;
    }

    QSqlQuery query(database);

    // Reset databases on start
//    if (query.exec("DROP TABLE IF EXISTS rooms")) {
//        qDebug() << "ROOMS - Table dropped.";
//    } else {
//        const QSqlError error = query.lastError();
//        alert(tr("ROOMS - Table drop error: %1").arg(error.text()));
//    }
//
//    if (query.exec("DROP TABLE IF EXISTS locations")) {
//        qDebug() << "LOCATIONS - Table dropped.";
//    } else {
//        const QSqlError error = query.lastError();
//        alert(tr("LOCATIONS - Table drop error: %1").arg(error.text()));
//    }
//
//    if (query.exec("DROP TABLE IF EXISTS items")) {
//        qDebug() << "ITEMS - Table dropped.";
//    } else {
//        const QSqlError error = query.lastError();
//        alert(tr("ITEMS - Table drop error: %1").arg(error.text()));
//    }

    // Create the 'rooms' table
    const QString createRoomsSQL = "CREATE TABLE IF NOT EXISTS rooms"
								   " (id INTEGER PRIMARY KEY AUTOINCREMENT, "
								   " name VARCHAR,"
								   " description VARCHAR,"
								   " img VARCHAR);";
    if (query.exec(createRoomsSQL)) {
        qDebug() << "ROOMS - Table created.";
    } else {
        const QSqlError error = query.lastError();
        alert(tr("ROOMS - Table create error: %1").arg(error.text()));
        return false;
    }

    // Create the 'locations' table
    const QString createLocationsSQL = "CREATE TABLE IF NOT EXISTS locations "
									   " (id INTEGER PRIMARY KEY AUTOINCREMENT, "
									   " room_id INTEGER,"
									   " room_name VARCHAR,"
									   " name VARCHAR,"
									   " description VARCHAR,"
									   " position VARCHAR,"
									   " img VARCHAR);";
    if (query.exec(createLocationsSQL)) {
        qDebug() << "LOCATIONS - Table created.";
    } else {
        const QSqlError error = query.lastError();
        alert(tr("LOCATIONS - Table create error: %1").arg(error.text()));
        return false;
    }

    // Create the 'items' table
    const QString createItemsSQL = "CREATE TABLE IF NOT EXISTS items "
								   " (id INTEGER PRIMARY KEY AUTOINCREMENT, "
    							   " room_id INTEGER,"
			   	   	   	   	   	   " room_name VARCHAR,"
			   	   	   	   	   	   " location_id INTEGER,"
								   " location_name VARCHAR,"
			   	   	   	   	   	   " img VARCHAR,"
								   " name VARCHAR,"
								   " description VARCHAR,"
								   " type VARCHAR,"
								   " brand VARCHAR,"
								   " model_number VARCHAR,"
								   " serial_number VARCHAR,"
								   " version VARCHAR,"
								   " capacity VARCHAR,"
								   " expiry_date VARCHAR,"
								   " artist VARCHAR,"
			   	   	   	   	   	   " author VARCHAR,"
								   " genre VARCHAR,"
								   " year VARCHAR,"
    							   " purchase_date VARCHAR,"
								   " purchase_location VARCHAR,"
								   " purchase_method VARCHAR, "
								   " purchase_price NUMERIC);";
    if (query.exec(createItemsSQL)) {
        qDebug() << "ITEMS - Table created.";
    } else {
        const QSqlError error = query.lastError();
        alert(tr("ITEMS - Table create error: %1").arg(error.text()));
        return false;
    }

    const QString addColumnPurchaseNotes= "ALTER TABLE items ADD COLUMN purchase_notes VARCHAR";
    if (query.exec(addColumnPurchaseNotes)) {
        qDebug() << "ITEMS - purchase_notes column added to items table.";
    }

    const QString addColumnWarranty= "ALTER TABLE items ADD COLUMN warranty VARCHAR";
    if (query.exec(addColumnWarranty)) {
        qDebug() << "ITEMS - warranty column added to items table.";
    }

    const QString addColumnWarrantyName = "ALTER TABLE items ADD COLUMN warranty_name VARCHAR";
    if (query.exec(addColumnWarrantyName)) {
        qDebug() << "ITEMS - warranty_name column added to items table.";
    }

    const QString addColumnWarrantyNum = "ALTER TABLE items ADD COLUMN warranty_num VARCHAR";
    if (query.exec(addColumnWarrantyNum)) {
        qDebug() << "ITEMS - warranty_num column added to items table.";
    }

    const QString addColumnWarrantyNum2 = "ALTER TABLE items ADD COLUMN warranty_num2 VARCHAR";
    if (query.exec(addColumnWarrantyNum2)) {
        qDebug() << "ITEMS - warranty_num2 column added to items table.";
    }

    const QString addColumnWarrantyDateStart = "ALTER TABLE items ADD COLUMN warranty_date_start VARCHAR";
    if (query.exec(addColumnWarrantyDateStart)) {
        qDebug() << "ITEMS - warranty_date_start column added to items table.";
    }

    const QString addColumnWarrantyDateEnd = "ALTER TABLE items ADD COLUMN warranty_date_end VARCHAR";
    if (query.exec(addColumnWarrantyDateEnd)) {
        qDebug() << "ITEMS - warranty_date_end column added to items table.";
    }

    const QString addColumnWarrantyNotes = "ALTER TABLE items ADD COLUMN warranty_notes VARCHAR";
    if (query.exec(addColumnWarrantyNotes)) {
        qDebug() << "ITEMS - warranty_notes column added to items table.";
    }

    const QString addColumnNotes = "ALTER TABLE items ADD COLUMN notes VARCHAR";
    if (query.exec(addColumnNotes)) {
        qDebug() << "ITEMS - notes column added to items table.";
    }

    // Update 1.0.0.2 - Changed app icon, added 'add picture' to item
    const QString addColumnPicture= "ALTER TABLE items ADD COLUMN picture VARCHAR";
    if (query.exec(addColumnPicture)) {
        qDebug() << "ITEMS - picture column added to items table.";
    }

    return true;
}

// -----------------------------------------------------------------------------------------------
// SETTINGS Functions

QString App::getValueFor(const QString &objectName, const QString &defaultValue)
{
    QSettings settings;

    if (settings.value(objectName).isNull()) {
        return defaultValue;
    }

    return settings.value(objectName).toString();
}

void App::saveValueFor(const QString &objectName, const QString &inputValue)
{
    QSettings settings;
    settings.setValue(objectName, QVariant(inputValue));
}

// -----------------------------------------------------------------------------------------------
// ROOM Functions

bool App::createRecordRoom(const QString &name, const QString &description, const QString &img)
{
    QSqlDatabase database = QSqlDatabase::database();

    QSqlQuery query(database);
    query.prepare("INSERT INTO rooms"
                  "    (name, description, img) "
                  "    VALUES (:name, :description, :img)");
    query.bindValue(":name", name);
    query.bindValue(":description", description);
    query.bindValue(":img", img);

    bool success = false;
    if (query.exec()) {
        qDebug() << "ROOMS - Room created.";
        success = true;
    } else {
        const QSqlError error = query.lastError();
        qDebug() << "ROOMS - Room create error: " + error.text();
    }

    database.close();
    return success;
}

bool App::updateRecordRoom(const QString &id, const QString &name, const QString &description, const QString &img)
{
    bool intConversionGood = false;
    const int idKey = id.toInt(&intConversionGood);
    if (!intConversionGood) {
        alert(tr("You must provide valid integer key."));
        return false;
    }

    QSqlDatabase database = QSqlDatabase::database();

    QSqlQuery query(database);
    const QString sqlCommand = "UPDATE rooms "
                               "    SET name = :name, description = :description, img = :img"
                               "    WHERE id = :id";
    query.prepare(sqlCommand);

    query.bindValue(":name", name);
    query.bindValue(":description", description);
    query.bindValue(":img", img);
    query.bindValue(":id", idKey);

    // Execute the query and check the result for errors
    bool updated = false;
    if (query.exec()) {
        // No room with specified ID
        if (query.numRowsAffected() > 0) {
        	qDebug() << tr("ROOMS - Room (id=%1) updated.").arg(id);
            updated = true;
        } else {
        	qDebug() << tr("ROOMS - Room (id=%1) not found.").arg(id);
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    database.close();

    return updated;
}

bool App::deleteRecordRoom(const QString &id)
{
    bool intConversionGood = false;
    const int idNumber = id.toInt(&intConversionGood);
    if (!intConversionGood) {
        alert(tr("You must provide valid integer key."));
        return false;
    }

    QSqlDatabase database = QSqlDatabase::database(); // open the default database.

    QSqlQuery query(database);

    // DELETE - Room
    query.prepare("DELETE FROM rooms WHERE id=:id");
    query.bindValue(":id", idNumber);

    // Execute the query and check the result for errors
    bool deleted = false;
    if (query.exec()) {
        // Verify that a row was modified, if not, there was no customer
        //  with the specified ID
        if (query.numRowsAffected() > 0) {
        	qDebug() << tr("ROOMS - Room (id=%1) deleted.").arg(id);
            deleted = true;
        } else {
        	qDebug() << tr("ROOMS - Room (id=%1) not found.").arg(id);
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    // DELETE - All items in all locations in room
    query.prepare("DELETE FROM items WHERE location_id in (SELECT id FROM locations WHERE room_id=:room_id)");
    query.bindValue(":room_id", idNumber);

    deleted = false;
    if (query.exec()) {
        if (query.numRowsAffected() > 0) {
            qDebug() << tr("ITEMS - Items in all Locations in Room (id=%1) deleted.").arg(id);
            deleted = true;
        } else {
            qDebug() << tr("ITEMS - Items in Room (id=%1) not found.").arg(id);
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    // DELETE - All locations in room
    query.prepare("DELETE FROM locations WHERE room_id=:room_id");
    query.bindValue(":room_id", idNumber);

    deleted = false;
    if (query.exec()) {
        if (query.numRowsAffected() > 0) {
            qDebug() << tr("LOCATIONS - Locations in Room (id=%1) deleted.").arg(id);
            deleted = true;
        } else {
            qDebug() << tr("LOCATIONS - Location (id=%1) not found.").arg(id);
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    database.close();
    return deleted;
}

void App::readRecordsRoom()
{
    QSqlDatabase database = QSqlDatabase::database(); // opens the default database.

    QSqlQuery query(database);
    const QString sqlQuery = "SELECT * FROM rooms";

    if (query.exec(sqlQuery)) {

        // Get the field indexes. We know the order of the fields, and could skip this step.
        // However this will still work if the fields change order in the query string.
        const int idField = query.record().indexOf("id");
        const int nameField = query.record().indexOf("name");
        const int descriptionField = query.record().indexOf("description");
        const int imgField = query.record().indexOf("img");

        // The data will be displayed in a group data model
        // Clear any previous reads from the data model first
        m_dataModelRoom->clear();

        int recordsRead = 0;
        while (query.next()) {
            // Access the data (stored in the query) via the field indexes
            // and add the data to the model.
            Room *room = new Room(query.value(idField).toString(),
                                        query.value(nameField).toString(),
										query.value(descriptionField).toString(),
										query.value(imgField).toString());
            m_dataModelRoom->insert(room);
            recordsRead++;
        }
        qDebug() << "Read" << recordsRead << "records succeeded";

        if (recordsRead == 0) {
            qDebug() << "Rooms table is empty.";
        }
    } else {
        alert(tr("Read records failed: %1").arg(query.lastError().text()));
    }

    database.close();
}

// -----------------------------------------------------------------------------------------------
// LOCATION Functions

bool App::createRecordLocation(const QString &room_id, const QString &room_name, const QString &name, const QString &description, const QString &position, const QString &img)
{
    QSqlDatabase database = QSqlDatabase::database();

    QSqlQuery query(database);
    query.prepare("INSERT INTO locations"
                  "    (room_id, room_name, name, description, position, img) "
                  "    VALUES (:room_id, :room_name, :name, :description, :position, :img)");
    query.bindValue(":room_id", room_id);
    query.bindValue(":room_name", room_name);
    query.bindValue(":name", name);
    query.bindValue(":description", description);
    query.bindValue(":position", position);
    query.bindValue(":img", img);

    // Execute the query and check the result
    bool success = false;
    if (query.exec()) {
        qDebug() << "Location created.";
        success = true;
    } else {
        const QSqlError error = query.lastError();
        alert(tr("Create record error: %1").arg(error.text()));
    }

    database.close();

    return success;
}

bool App::updateRecordLocation(const QString &id, const QString &room_id, const QString &room_name, const QString &name, const QString &description, const QString &position, const QString &img)
{
    bool intConversionGood = false;
    const int idKey = id.toInt(&intConversionGood);
    if (!intConversionGood) {
        alert(tr("You must provide valid integer key."));
        return false;
    }

    QSqlDatabase database = QSqlDatabase::database();

    QSqlQuery query(database);
    const QString sqlCommand = "UPDATE locations "
                               "    SET room_id = :room_id, room_name = :room_name, name = :name, description = :description, position = :position, img = :img"
                               "    WHERE id = :id";
    query.prepare(sqlCommand);

    query.bindValue(":id", idKey);
    query.bindValue(":room_id", room_id);
    query.bindValue(":room_name", room_name);
    query.bindValue(":name", name);
    query.bindValue(":description", description);
    query.bindValue(":position", position);
    query.bindValue(":img", img);

    // Execute the query and check the result for errors
    bool updated = false;
    if (query.exec()) {
        // Verify that a row was modified, if not, there was no customer
        // with the specified ID
        if (query.numRowsAffected() > 0) {
            //alert(tr("Customer with id=%1 was updated.").arg(id));
            updated = true;
        } else {
            //alert(tr("Customer with id=%1 was not found.").arg(id));
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    database.close();

    return updated;
}

bool App::deleteRecordLocation(const QString &id)
{
    bool intConversionGood = false;
    const int idNumber = id.toInt(&intConversionGood);
    if (!intConversionGood) {
        alert(tr("You must provide valid integer key."));
        return false;
    }

    QSqlDatabase database = QSqlDatabase::database(); // open the default database.

    QSqlQuery query(database);
    query.prepare("DELETE FROM locations WHERE id=:id");
    query.bindValue(":id", idNumber);

    // Execute the query and check the result for errors
    bool deleted = false;
    if (query.exec()) {
        if (query.numRowsAffected() > 0) {
            qDebug() << tr("LOCATIONS - Location (id=%1) deleted.").arg(id);
            deleted = true;
        } else {
            qDebug() << tr("LOCATIONS - Location (id=%1) not found.").arg(id);
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    // Also delete all items in that location
    query.prepare("DELETE FROM items WHERE location_id=:location_id");
    query.bindValue(":location_id", idNumber);

    deleted = false;
    if (query.exec()) {
        if (query.numRowsAffected() > 0) {
            qDebug() << tr("ITEMS - Items in Location (id=%1) deleted.").arg(id);
            deleted = true;
        } else {
            qDebug() << tr("ITEMS - Location (id=%1) not found.").arg(id);
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    database.close();

    return deleted;
}

void App::readRecordsLocation()
{
    QSqlDatabase database = QSqlDatabase::database(); // opens the default database.

    QSqlQuery query(database);
    const QString sqlQuery = "SELECT * FROM locations";

    if (query.exec(sqlQuery)) {

        // Get the field indexes. We know the order of the fields, and could skip this step.
        // However this will still work if the fields change order in the query string.
        const int idField = query.record().indexOf("id");
        const int roomIDField = query.record().indexOf("room_id");
        const int roomNameField = query.record().indexOf("room_name");
        const int nameField = query.record().indexOf("name");
        const int descriptionField = query.record().indexOf("description");
        const int positionField = query.record().indexOf("position");
        const int imgField = query.record().indexOf("img");

        // The data will be displayed in a group data model
        // Clear any previous reads from the data model first
        m_dataModelLocation->clear();

        int recordsRead = 0;
        while (query.next()) {
            // Access the data (stored in the query) via the field indexes
            // and add the data to the model.
            Location *location = new Location(query.value(idField).toString(),
											  query.value(roomIDField).toString(),
											  query.value(roomNameField).toString(),
											  query.value(nameField).toString(),
											  query.value(descriptionField).toString(),
											  query.value(positionField).toString(),
											  query.value(imgField).toString());
            m_dataModelLocation->insert(location);
            recordsRead++;
        }
        qDebug() << "Read" << recordsRead << "records succeeded";

        if (recordsRead == 0) {
            qDebug() << "LOCATIONS - Table is empty.";
        }
    } else {
        alert(tr("Read records failed: %1").arg(query.lastError().text()));
    }

    database.close();
}

void App::readRecordsLocationInRoom(const QString &id_lookup)
{
    QSqlDatabase database = QSqlDatabase::database(); // opens the default database.

    QSqlQuery query(database);
    const QString sqlQuery = "SELECT * FROM locations WHERE room_id = " + id_lookup;

    if (query.exec(sqlQuery)) {

        // Get the field indexes. We know the order of the fields, and could skip this step.
        // However this will still work if the fields change order in the query string.
        const int idField = query.record().indexOf("id");
        const int roomIDField = query.record().indexOf("room_id");
        const int roomNameField = query.record().indexOf("room_name");
        const int nameField = query.record().indexOf("name");
        const int descriptionField = query.record().indexOf("description");
        const int positionField = query.record().indexOf("position");
        const int imgField = query.record().indexOf("img");

        // The data will be displayed in a group data model
        // Clear any previous reads from the data model first
        m_dataModelLocationInRoom->clear();

        int recordsRead = 0;
        while (query.next()) {
            // Access the data (stored in the query) via the field indexes
            // and add the data to the model.
            Location *location = new Location(query.value(idField).toString(),
											  query.value(roomIDField).toString(),
											  query.value(roomNameField).toString(),
											  query.value(nameField).toString(),
											  query.value(descriptionField).toString(),
											  query.value(positionField).toString(),
											  query.value(imgField).toString());
            m_dataModelLocationInRoom->insert(location);
            recordsRead++;
        }
        qDebug() << "Read" << recordsRead << "records succeeded";

        if (recordsRead == 0) {
            qDebug() << "LOCATIONS - Table is empty.";
        }
    } else {
        alert(tr("Read records failed: %1").arg(query.lastError().text()));
    }

    database.close();
}

// -----------------------------------------------------------------------------------------------
// ITEM Functions

bool App::createRecordItem(const QString &room_id, const QString &room_name, const QString &location_id, const QString &location_name, const QString &img, const QString &picture, const QString &name, const QString &description, const QString &type, const QString &brand, const QString &model_number, const QString &serial_number, const QString &version, const QString &capacity, const QString &expiry_date, const QString &artist, const QString &author, const QString &genre, const QString &year, const QString &purchase_date, const QString &purchase_location, const QString &purchase_method, const QString &purchase_notes, const QString &purchase_price, const QString &warranty, const QString &warranty_name, const QString &warranty_num, const QString &warranty_num2, const QString &warranty_date_start, const QString &warranty_date_end, const QString &warranty_notes, const QString &notes)
{
    if (name.trimmed().isEmpty()) {
        alert(tr("You must provide a name."));
        return false;
    }

    QSqlDatabase database = QSqlDatabase::database();
    QSqlQuery query(database);
    query.prepare("INSERT INTO items"
                  "    (room_id, room_name, location_id, location_name, img, picture, name, description, type, brand, model_number, serial_number, version, capacity, expiry_date, artist, author, genre, year, purchase_date, purchase_location, purchase_method, purchase_notes, purchase_price, warranty, warranty_name, warranty_num, warranty_num2, warranty_date_start, warranty_date_end, warranty_notes, notes) "
                  "    VALUES (:room_id, :room_name, :location_id, :location_name, :img, :picture, :name, :description, :type, :brand, :model_number, :serial_number, :version, :capacity, :expiry_date, :artist, :author, :genre, :year, :purchase_date, :purchase_location, :purchase_method, :purchase_notes, :purchase_price, :warranty, :warranty_name, :warranty_num, :warranty_num2, :warranty_date_start, :warranty_date_end, :warranty_notes, :notes)");

    query.bindValue(":room_id", room_id);
    query.bindValue(":room_name", room_name);
    query.bindValue(":location_id", location_id);
    query.bindValue(":location_name", location_name);
    query.bindValue(":img", img);
    query.bindValue(":picture", picture);
    query.bindValue(":name", name);
    query.bindValue(":description", description);
    query.bindValue(":type", type);
    query.bindValue(":brand", brand);
    query.bindValue(":model_number", model_number);
    query.bindValue(":serial_number", serial_number);
    query.bindValue(":version", version);
    query.bindValue(":capacity", capacity);
    query.bindValue(":expiry_date", expiry_date);
    query.bindValue(":artist", artist);
    query.bindValue(":author", author);
    query.bindValue(":genre", genre);
    query.bindValue(":year", year);
    query.bindValue(":purchase_date", purchase_date);
    query.bindValue(":purchase_location", purchase_location);
    query.bindValue(":purchase_method", purchase_method);
    query.bindValue(":purchase_notes", purchase_notes);
    query.bindValue(":purchase_price", purchase_price);
    query.bindValue(":warranty", warranty);
    query.bindValue(":warranty_name", warranty_name);
    query.bindValue(":warranty_num", warranty_num);
    query.bindValue(":warranty_num2", warranty_num2);
    query.bindValue(":warranty_date_start", warranty_date_start);
    query.bindValue(":warranty_date_end", warranty_date_end);
    query.bindValue(":warranty_notes", warranty_notes);
    query.bindValue(":notes", notes);

    // Execute the query and check the result
    bool success = false;
    if (query.exec()) {
        qDebug() << "ITEMS - Item created.";
        success = true;
    } else {
        const QSqlError error = query.lastError();
        alert(tr("ITEMS - Item create error: %1").arg(error.text()));
    }

    database.close();

    return success;
}

bool App::updateRecordItem(const QString &id, const QString &room_id, const QString &room_name, const QString &location_id, const QString &location_name, const QString &img, const QString &picture, const QString &name, const QString &description, const QString &type, const QString &brand, const QString &model_number, const QString &serial_number, const QString &version, const QString &capacity, const QString &expiry_date, const QString &artist, const QString &author, const QString &genre, const QString &year, const QString &purchase_date, const QString &purchase_location, const QString &purchase_method, const QString &purchase_notes, const QString &purchase_price, const QString &warranty, const QString &warranty_name, const QString &warranty_num, const QString &warranty_num2, const QString &warranty_date_start, const QString &warranty_date_end, const QString &warranty_notes, const QString &notes)
{
    bool intConversionGood = false;
    const int idKey = id.toInt(&intConversionGood);
    if (!intConversionGood) {
        alert(tr("You must provide valid integer key."));
        return false;
    }

    QSqlDatabase database = QSqlDatabase::database();

    QSqlQuery query(database);
    const QString sqlCommand = "UPDATE items SET "
    						   // Room
                               "room_id = :room_id, room_name = :room_name, "

			   	   	   	   	   // Location
                               "location_id = :location_id, location_name = :location_name, "

							   // Appearance
							   "img = :img, picture = :picture, "

			   	   	   	   	   // What
                               "name = :name, description = :description, "
                               "type = :type, brand = :brand, "
                               "model_number = :model_number, serial_number = :serial_number, "
                               "version = :version, "

							   // Food
							   "capacity = :capacity, expiry_date = :expiry_date, "

							   // Media
							   "artist = :artist, author = :author, genre = :genre, year = :year, "

			   	   	   	   	   // Purchase
                               "purchase_date = :purchase_date, purchase_location = :purchase_location, "
                               "purchase_method = :purchase_method, purchase_notes = :purchase_notes, "
    						   "purchase_price = :purchase_price, "

			   	   	   	   	   "warranty = :warranty, warranty_name = :warranty_name, "
			   	   	   	   	   "warranty_num = :warranty_num, warranty_num2 = :warranty_num2, "
			   	   	   	   	   "warranty_date_start = :warranty_date_start, warranty_date_end = :warranty_date_end, "
			   	   	   	   	   "warranty_notes = :warranty_notes, "

    						   "notes = :notes "

                               "WHERE id = :id";

    query.prepare(sqlCommand);
    query.bindValue(":id", idKey);
    query.bindValue(":room_id", room_id);
    query.bindValue(":room_name", room_name);
    query.bindValue(":location_id", location_id);
    query.bindValue(":location_name", location_name);
    query.bindValue(":img", img);
    query.bindValue(":picture", picture);
    query.bindValue(":name", name);
    query.bindValue(":description", description);
    query.bindValue(":type", type);
    query.bindValue(":brand", brand);
    query.bindValue(":model_number", model_number);
    query.bindValue(":serial_number", serial_number);
    query.bindValue(":version", version);
    query.bindValue(":capacity", capacity);
    query.bindValue(":expiry_date", expiry_date);
    query.bindValue(":artist", artist);
    query.bindValue(":author", author);
    query.bindValue(":genre", genre);
    query.bindValue(":year", year);
    query.bindValue(":purchase_date", purchase_date);
    query.bindValue(":purchase_location", purchase_location);
    query.bindValue(":purchase_method", purchase_method);
    query.bindValue(":purchase_notes", purchase_notes);
    query.bindValue(":purchase_price", purchase_price);
    query.bindValue(":warranty", warranty);
    query.bindValue(":warranty_name", warranty_name);
    query.bindValue(":warranty_num", warranty_num);
    query.bindValue(":warranty_num2", warranty_num2);
    query.bindValue(":warranty_date_start", warranty_date_start);
    query.bindValue(":warranty_date_end", warranty_date_end);
    query.bindValue(":warranty_notes", warranty_notes);
    query.bindValue(":notes", notes);

    // Execute the query and check the result for errors
    bool updated = false;
    if (query.exec()) {
        // Verify that a row was modified, if not, there was no customer
        // with the specified ID
        if (query.numRowsAffected() > 0) {
            //alert(tr("Customer with id=%1 was updated.").arg(id));
            updated = true;
        } else {
            //alert(tr("Customer with id=%1 was not found.").arg(id));
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    database.close();

    return updated;
}

bool App::deleteRecordItem(const QString &id)
{
    bool intConversionGood = false;
    const int idNumber = id.toInt(&intConversionGood);
    if (!intConversionGood) {
        alert(tr("You must provide valid integer key."));
        return false;
    }

    QSqlDatabase database = QSqlDatabase::database(); // open the default database.

    QSqlQuery query(database);
    query.prepare("DELETE FROM items WHERE id=:id");
    query.bindValue(":id", idNumber);

    // Execute the query and check the result for errors
    bool deleted = false;
    if (query.exec()) {
        // Verify that a row was modified, if not, there was no customer
        //  with the specified ID
        if (query.numRowsAffected() > 0) {
            //alert(tr("Customer with id=%1 was deleted.").arg(id));
            deleted = true;
        } else {
            //alert(tr("Customer with id=%1 was not found.").arg(id));
        }
    } else {
        alert(tr("SQL error: %1").arg(query.lastError().text()));
    }

    database.close();

    return deleted;
}

void App::readRecordsItem()
{
    QSqlDatabase database = QSqlDatabase::database(); // opens the default database.

    QSqlQuery query(database);
    const QString sqlQuery = "SELECT * FROM items";

    if (query.exec(sqlQuery)) {

        // Get the field indexes. We know the order of the fields, and could skip this step.
        // However this will still work if the fields change order in the query string.
        const int idField = query.record().indexOf("id");
        const int roomIDField = query.record().indexOf("room_id");
        const int roomNameField = query.record().indexOf("room_name");
        const int locationIDField = query.record().indexOf("location_id");
        const int locationNameField = query.record().indexOf("location_name");
        const int imgField = query.record().indexOf("img");
        const int pictureField = query.record().indexOf("picture");
        const int nameField = query.record().indexOf("name");
        const int descriptionField = query.record().indexOf("description");
        const int typeField = query.record().indexOf("type");
        const int brandField = query.record().indexOf("brand");
        const int modelNumberField = query.record().indexOf("model_number");
        const int serialNumberField = query.record().indexOf("serial_number");
        const int versionField = query.record().indexOf("version");
        const int capacityField = query.record().indexOf("capacity");
        const int expiryDateField = query.record().indexOf("expiry_date");
        const int artistField = query.record().indexOf("artist");
        const int authorField = query.record().indexOf("author");
        const int genreField = query.record().indexOf("genre");
        const int yearField = query.record().indexOf("year");
        const int purchaseDateField = query.record().indexOf("purchase_date");
        const int purchaseLocationField = query.record().indexOf("purchase_location");
        const int purchaseMethodField = query.record().indexOf("purchase_method");
        const int purchaseNotesField = query.record().indexOf("purchase_notes");
        const int purchasePriceField = query.record().indexOf("purchase_price");
        const int warrantyField = query.record().indexOf("warranty");
        const int warrantyNameField = query.record().indexOf("warranty_name");
        const int warrantyNumField = query.record().indexOf("warranty_num");
        const int warrantyNum2Field = query.record().indexOf("warranty_num2");
        const int warrantyDateStartField = query.record().indexOf("warranty_date_start");
        const int warrantyDateEndField = query.record().indexOf("warranty_date_end");
        const int warrantyNotesField = query.record().indexOf("warranty_notes");
        const int notesField = query.record().indexOf("notes");

        // The data will be displayed in a group data model
        // Clear any previous reads from the data model first
        m_dataModelItem->clear();

        int recordsRead = 0;
        while (query.next()) {
            // Access the data (stored in the query) via the field indexes
            // and add the data to the model.
            Item *item = new Item(query.value(idField).toString(),
								  query.value(roomIDField).toString(),
								  query.value(roomNameField).toString(),
								  query.value(locationIDField).toString(),
								  query.value(locationNameField).toString(),
								  query.value(imgField).toString(),
								  query.value(pictureField).toString(),
								  query.value(nameField).toString(),
								  query.value(descriptionField).toString(),
								  query.value(typeField).toString(),
								  query.value(brandField).toString(),
								  query.value(modelNumberField).toString(),
								  query.value(serialNumberField).toString(),
								  query.value(versionField).toString(),
								  query.value(capacityField).toString(),
								  query.value(expiryDateField).toString(),
								  query.value(artistField).toString(),
								  query.value(authorField).toString(),
								  query.value(genreField).toString(),
								  query.value(yearField).toString(),
								  query.value(purchaseDateField).toString(),
								  query.value(purchaseLocationField).toString(),
								  query.value(purchaseMethodField).toString(),
								  query.value(purchaseNotesField).toString(),
								  query.value(purchasePriceField).toString(),
								  query.value(warrantyField).toString(),
								  query.value(warrantyNameField).toString(),
								  query.value(warrantyNumField).toString(),
								  query.value(warrantyNum2Field).toString(),
								  query.value(warrantyDateStartField).toString(),
								  query.value(warrantyDateEndField).toString(),
								  query.value(warrantyNotesField).toString(),
								  query.value(notesField).toString());
            m_dataModelItem->insert(item);
            recordsRead++;
        }
        qDebug() << "Read" << recordsRead << "records succeeded";

        if (recordsRead == 0) {
            qDebug() << "Items table is empty.";
        }
    } else {
        alert(tr("Read records failed: %1").arg(query.lastError().text()));
    }

    database.close();
}

void App::readRecordsItemInLocation(const QString &id_lookup)
{
    QSqlDatabase database = QSqlDatabase::database(); // opens the default database.

    QSqlQuery query(database);
    const QString sqlQuery = "SELECT * FROM items WHERE location_id = " + id_lookup;

    if (query.exec(sqlQuery)) {

        // Get the field indexes. We know the order of the fields, and could skip this step.
        // However this will still work if the fields change order in the query string.
        const int idField = query.record().indexOf("id");
        const int roomIDField = query.record().indexOf("room_id");
        const int roomNameField = query.record().indexOf("room_name");
        const int locationIDField = query.record().indexOf("location_id");
        const int locationNameField = query.record().indexOf("location_name");
        const int imgField = query.record().indexOf("img");
        const int pictureField = query.record().indexOf("picture");
        const int nameField = query.record().indexOf("name");
        const int descriptionField = query.record().indexOf("description");
        const int typeField = query.record().indexOf("type");
        const int brandField = query.record().indexOf("brand");
        const int modelNumberField = query.record().indexOf("model_number");
        const int serialNumberField = query.record().indexOf("serial_number");
        const int versionField = query.record().indexOf("version");
        const int capacityField = query.record().indexOf("capacity");
        const int expiryDateField = query.record().indexOf("expiry_date");
        const int artistField = query.record().indexOf("artist");
        const int authorField = query.record().indexOf("author");
        const int genreField = query.record().indexOf("genre");
        const int yearField = query.record().indexOf("year");
        const int purchaseDateField = query.record().indexOf("purchase_date");
        const int purchaseLocationField = query.record().indexOf("purchase_location");
        const int purchaseMethodField = query.record().indexOf("purchase_method");
        const int purchaseNotesField = query.record().indexOf("purchase_notes");
        const int purchasePriceField = query.record().indexOf("purchase_price");
        const int warrantyField = query.record().indexOf("warranty");
        const int warrantyNameField = query.record().indexOf("warranty_name");
        const int warrantyNumField = query.record().indexOf("warranty_num");
        const int warrantyNum2Field = query.record().indexOf("warranty_num2");
        const int warrantyDateStartField = query.record().indexOf("warranty_date_start");
        const int warrantyDateEndField = query.record().indexOf("warranty_date_end");
        const int warrantyNotesField = query.record().indexOf("warranty_notes");
        const int notesField = query.record().indexOf("notes");

        // The data will be displayed in a group data model
        // Clear any previous reads from the data model first
        m_dataModelItemInLocation->clear();

        int recordsRead = 0;
        while (query.next()) {
            // Access the data (stored in the query) via the field indexes
            // and add the data to the model.
            Item *item = new Item(query.value(idField).toString(),
								  query.value(roomIDField).toString(),
								  query.value(roomNameField).toString(),
								  query.value(locationIDField).toString(),
								  query.value(locationNameField).toString(),
								  query.value(imgField).toString(),
								  query.value(pictureField).toString(),
								  query.value(nameField).toString(),
								  query.value(descriptionField).toString(),
								  query.value(typeField).toString(),
								  query.value(brandField).toString(),
								  query.value(modelNumberField).toString(),
								  query.value(serialNumberField).toString(),
								  query.value(versionField).toString(),
								  query.value(capacityField).toString(),
								  query.value(expiryDateField).toString(),
								  query.value(artistField).toString(),
								  query.value(authorField).toString(),
								  query.value(genreField).toString(),
								  query.value(yearField).toString(),
								  query.value(purchaseDateField).toString(),
								  query.value(purchaseLocationField).toString(),
								  query.value(purchaseMethodField).toString(),
								  query.value(purchaseNotesField).toString(),
								  query.value(purchasePriceField).toString(),
								  query.value(warrantyField).toString(),
								  query.value(warrantyNameField).toString(),
								  query.value(warrantyNumField).toString(),
								  query.value(warrantyNum2Field).toString(),
								  query.value(warrantyDateStartField).toString(),
								  query.value(warrantyDateEndField).toString(),
								  query.value(warrantyNotesField).toString(),
								  query.value(notesField).toString());
            m_dataModelItemInLocation->insert(item);
            recordsRead++;
        }
        qDebug() << "Read" << recordsRead << "records succeeded";

        if (recordsRead == 0) {
            qDebug() << "Items table is empty.";
        }
    } else {
        alert(tr("Read records failed: %1").arg(query.lastError().text()));
    }

    database.close();
}

void App::readRecordsItemInRoom(const QString &id_lookup)
{
    QSqlDatabase database = QSqlDatabase::database(); // opens the default database.

    QSqlQuery query(database);
    const QString sqlQuery = "SELECT * FROM items WHERE location_id in (SELECT id FROM locations WHERE room_id = " + id_lookup + ")";

    if (query.exec(sqlQuery)) {
        // Get the field indexes. We know the order of the fields, and could skip this step.
        // However this will still work if the fields change order in the query string.
        const int idField = query.record().indexOf("id");
        const int roomIDField = query.record().indexOf("room_id");
        const int roomNameField = query.record().indexOf("room_name");
        const int locationIDField = query.record().indexOf("location_id");
        const int locationNameField = query.record().indexOf("location_name");
        const int imgField = query.record().indexOf("img");
        const int pictureField = query.record().indexOf("picture");
        const int nameField = query.record().indexOf("name");
        const int descriptionField = query.record().indexOf("description");
        const int typeField = query.record().indexOf("type");
        const int brandField = query.record().indexOf("brand");;
        const int modelNumberField = query.record().indexOf("model_number");
        const int serialNumberField = query.record().indexOf("serial_number");
        const int versionField = query.record().indexOf("version");
        const int capacityField = query.record().indexOf("capacity");
        const int expiryDateField = query.record().indexOf("expiry_date");
        const int artistField = query.record().indexOf("artist");
        const int authorField = query.record().indexOf("author");
        const int genreField = query.record().indexOf("genre");
        const int yearField = query.record().indexOf("year");
        const int purchaseDateField = query.record().indexOf("purchase_date");
        const int purchaseLocationField = query.record().indexOf("purchase_location");
        const int purchaseMethodField = query.record().indexOf("purchase_method");
        const int purchaseNotesField = query.record().indexOf("purchase_notes");
        const int purchasePriceField = query.record().indexOf("purchase_price");
        const int warrantyField = query.record().indexOf("warranty");
        const int warrantyNameField = query.record().indexOf("warranty_name");
        const int warrantyNumField = query.record().indexOf("warranty_num");
        const int warrantyNum2Field = query.record().indexOf("warranty_num2");
        const int warrantyDateStartField = query.record().indexOf("warranty_date_start");
        const int warrantyDateEndField = query.record().indexOf("warranty_date_end");
        const int warrantyNotesField = query.record().indexOf("warranty_notes");
        const int notesField = query.record().indexOf("notes");

        // The data will be displayed in a group data model
        // Clear any previous reads from the data model first
        m_dataModelItemInRoom->clear();

        int recordsRead = 0;
        while (query.next()) {
            // Access the data (stored in the query) via the field indexes
            // and add the data to the model.
            Item *item = new Item(query.value(idField).toString(),
								  query.value(roomIDField).toString(),
								  query.value(roomNameField).toString(),
								  query.value(locationIDField).toString(),
								  query.value(locationNameField).toString(),
								  query.value(imgField).toString(),
								  query.value(pictureField).toString(),
								  query.value(nameField).toString(),
								  query.value(descriptionField).toString(),
								  query.value(typeField).toString(),
								  query.value(brandField).toString(),
								  query.value(modelNumberField).toString(),
								  query.value(serialNumberField).toString(),
								  query.value(versionField).toString(),
								  query.value(capacityField).toString(),
								  query.value(expiryDateField).toString(),
								  query.value(artistField).toString(),
								  query.value(authorField).toString(),
								  query.value(genreField).toString(),
								  query.value(yearField).toString(),
								  query.value(purchaseDateField).toString(),
								  query.value(purchaseLocationField).toString(),
								  query.value(purchaseMethodField).toString(),
								  query.value(purchaseNotesField).toString(),
								  query.value(purchasePriceField).toString(),
								  query.value(warrantyField).toString(),
								  query.value(warrantyNameField).toString(),
								  query.value(warrantyNumField).toString(),
								  query.value(warrantyNum2Field).toString(),
								  query.value(warrantyDateStartField).toString(),
								  query.value(warrantyDateEndField).toString(),
								  query.value(warrantyNotesField).toString(),
								  query.value(notesField).toString());
            m_dataModelItemInRoom->insert(item);
            recordsRead++;
        }
        qDebug() << "Read" << recordsRead << "records succeeded";

        if (recordsRead == 0) {
            qDebug() << "Items table is empty.";
        }
    } else {
        alert(tr("Read records failed: %1").arg(query.lastError().text()));
    }

    database.close();
}

// -----------------------------------------------------------------------------------------------
// DATABASE

GroupDataModel* App::dataModelRoom() const { return m_dataModelRoom; }
GroupDataModel* App::dataModelLocation() const { return m_dataModelLocation; }
GroupDataModel* App::dataModelLocationInRoom() const { return m_dataModelLocationInRoom; }
GroupDataModel* App::dataModelItem() const { return m_dataModelItem; }
GroupDataModel* App::dataModelItemInLocation() const { return m_dataModelItemInLocation; }
GroupDataModel* App::dataModelItemInRoom() const { return m_dataModelItemInRoom; }

// -----------------------------------------------------------------------------------------------
// Alert Dialog Box Functions
void App::alert(const QString &message)
{
    SystemDialog *dialog;
    dialog = new SystemDialog(tr("OK"), 0);
    dialog->setTitle(tr("Alert"));
    dialog->setBody(message);
    dialog->setDismissAutomatically(true); // Hides the dialog when a button is pressed.

    // Setup slot to mark the dialog for deletion in the next event loop after the dialog has been accepted.
    connect(dialog, SIGNAL(finished(bb::system::SystemUiResult::Type)), dialog, SLOT(deleteLater()));
    dialog->show();
}

// -----------------------------------------------------------------------------------------------
// BBM Functions
void App::inviteUserToDownloadViaBBM() {
	if (m_context->registrationState() == bb::platform::bbm::RegistrationState::Allowed) {
		m_messageService->sendDownloadInvitation();
	} else {
		SystemDialog *bbmDialog = new SystemDialog("OK");
		bbmDialog->setTitle("BBM Connection Error");
		bbmDialog->setBody(
				"BBM is not currently connected. Please setup / sign-in to BBM to remove this message.");
		connect(bbmDialog, SIGNAL(finished(bb::system::SystemUiResult::Type)),
				this, SLOT(dialogFinished(bb::system::SystemUiResult::Type)));
		bbmDialog->show();
		return;
	}
}

void App::registrationStateUpdated(bb::platform::bbm::RegistrationState::Type state) {
	if (state == bb::platform::bbm::RegistrationState::Allowed) {
		m_messageService = new bb::platform::bbm::MessageService(m_context, this);
		m_userProfile = new bb::platform::bbm::UserProfile(m_context, this);
	} else if (state == bb::platform::bbm::RegistrationState::Unregistered) {
		m_context->requestRegisterApplication();
	}
}
