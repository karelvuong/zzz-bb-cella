#include "Item.hpp"

Item::Item(QObject *parent)
    : QObject(parent)
{
}

Item::Item(const QString &id, const QString &room_id, const QString &room_name, const QString &location_id, const QString &location_name, const QString &img, const QString &picture, const QString &name, const QString &description, const QString &type, const QString &brand, const QString &model_number, const QString &serial_number, const QString &version, const QString &capacity, const QString &expiry_date, const QString &artist, const QString &author, const QString &genre, const QString &year, const QString &purchase_date, const QString &purchase_location, const QString &purchase_method, const QString &purchase_notes, const QString &purchase_price, const QString &warranty, const QString &warranty_name, const QString &warranty_num, const QString &warranty_num2, const QString &warranty_date_start, const QString &warranty_date_end, const QString &warranty_notes, const QString &notes, QObject *parent)
    : QObject(parent)
	, m_id(id)
	, m_room_id(room_id)
	, m_room_name(room_name)
	, m_location_id(location_id)
	, m_location_name(location_name)
	, m_img(img)
	, m_picture(picture)
    , m_name(name)
	, m_description(description)
	, m_type(type)
	, m_brand(brand)
	, m_model_number(model_number)
	, m_serial_number(serial_number)
	, m_version(version)
	, m_capacity(capacity)
	, m_expiry_date(expiry_date)
	, m_artist(artist)
	, m_author(author)
	, m_genre(genre)
	, m_year(year)
	, m_purchase_date(purchase_date)
	, m_purchase_location(purchase_location)
	, m_purchase_method(purchase_method)
	, m_purchase_notes(purchase_notes)
	, m_purchase_price(purchase_price)
	, m_warranty(warranty)
	, m_warranty_name(warranty_name)
	, m_warranty_num(warranty_num)
	, m_warranty_num2(warranty_num2)
	, m_warranty_date_start(warranty_date_start)
	, m_warranty_date_end(warranty_date_end)
	, m_warranty_notes(warranty_notes)
	, m_notes(notes)
{
}

QString Item::id() const
{
    return m_id;
}

QString Item::room_id() const
{
    return m_room_id;
}

QString Item::room_name() const
{
    return m_room_name;
}

QString Item::location_id() const
{
    return m_location_id;
}

QString Item::location_name() const
{
    return m_location_name;
}

QString Item::img() const
{
    return m_img;
}

QString Item::picture() const
{
    return m_picture;
}

QString Item::name() const
{
    return m_name;
}

QString Item::description() const
{
    return m_description;
}

QString Item::type() const
{
    return m_type;
}

QString Item::brand() const
{
    return m_brand;
}

QString Item::model_number() const
{
    return m_model_number;
}

QString Item::serial_number() const
{
    return m_serial_number;
}

QString Item::version() const
{
    return m_version;
}

QString Item::capacity() const
{
    return m_capacity;
}

QString Item::expiry_date() const
{
    return m_expiry_date;
}

QString Item::artist() const
{
    return m_artist;
}

QString Item::author() const
{
    return m_author;
}

QString Item::genre() const
{
    return m_genre;
}

QString Item::year() const
{
    return m_year;
}

QString Item::purchase_date() const
{
    return m_purchase_date;
}

QString Item::purchase_location() const
{
    return m_purchase_location;
}

QString Item::purchase_method() const
{
    return m_purchase_method;
}

QString Item::purchase_notes() const
{
    return m_purchase_notes;
}

QString Item::purchase_price() const
{
    return m_purchase_price;
}

QString Item::warranty() const
{
    return m_warranty;
}

QString Item::warranty_name() const
{
    return m_warranty_name;
}

QString Item::warranty_num() const
{
    return m_warranty_num;
}

QString Item::warranty_num2() const
{
    return m_warranty_num2;
}

QString Item::warranty_date_start() const
{
    return m_warranty_date_start;
}

QString Item::warranty_date_end() const
{
    return m_warranty_date_end;
}

QString Item::warranty_notes() const
{
    return m_warranty_notes;
}

QString Item::notes() const
{
    return m_notes;
}

void Item::setID(const QString &newId)
{
    if (newId != m_id) {
        m_id = newId;
        emit idChanged(newId);
    }
}

void Item::setRoomID(const QString &newRoomID)
{
    if (newRoomID != m_room_id) {
        m_room_id = newRoomID;
        emit roomIDChanged(newRoomID);
    }
}

void Item::setRoomName(const QString &newRoomName)
{
    if (newRoomName != m_room_name) {
        m_room_name = newRoomName;
        emit roomNameChanged(newRoomName);
    }
}

void Item::setLocationID(const QString &newLocationId)
{
    if (newLocationId != m_location_id) {
    	m_location_id = newLocationId;
        emit locationIDChanged(newLocationId);
    }
}

void Item::setLocationName(const QString &newLocationName)
{
    if (newLocationName != m_location_name) {
    	m_location_name = newLocationName;
        emit locationNameChanged(newLocationName);
    }
}

void Item::setImg(const QString &newImg)
{
    if (newImg != m_img) {
    	m_img = newImg;
        emit imgChanged(newImg);
    }
}

void Item::setPicture(const QString &newPicture)
{
    if (newPicture != m_picture) {
    	m_picture = newPicture;
        emit pictureChanged(newPicture);
    }
}

void Item::setName(const QString &newName)
{
    if (newName != m_name) {
        m_name = newName;
        emit nameChanged(newName);
    }
}

void Item::setDescription(const QString &newDescription)
{
    if (newDescription != m_description) {
        m_description = newDescription;
        emit descriptionChanged(newDescription);
    }
}

void Item::setType(const QString &newType)
{
    if (newType != m_type) {
    	m_type = newType;
        emit typeChanged(newType);
    }
}

void Item::setBrand(const QString &newBrand)
{
    if (newBrand != m_brand) {
    	m_brand = newBrand;
        emit brandChanged(newBrand);
    }
}

void Item::setModelNumber(const QString &newModelNumber)
{
    if (newModelNumber != m_model_number) {
    	m_model_number = newModelNumber;
        emit modelNumberChanged(newModelNumber);
    }
}

void Item::setSerialNumber(const QString &newSerialNumber)
{
    if (newSerialNumber != m_serial_number) {
    	m_serial_number = newSerialNumber;
        emit serialNumberChanged(newSerialNumber);
    }
}

void Item::setVersion(const QString &newVersion)
{
    if (newVersion != m_version) {
    	m_version = newVersion;
        emit versionChanged(newVersion);
    }
}

void Item::setCapacity(const QString &newCapacity)
{
    if (newCapacity != m_capacity) {
    	m_capacity = newCapacity;
        emit capacityChanged(newCapacity);
    }
}

void Item::setExpiryDate(const QString &newExpiryDate)
{
    if (newExpiryDate != m_expiry_date) {
    	m_expiry_date = newExpiryDate;
        emit expiryDateChanged(newExpiryDate);
    }
}

void Item::setArtist(const QString &newArtist)
{
    if (newArtist != m_artist) {
    	m_artist = newArtist;
        emit artistChanged(newArtist);
    }
}

void Item::setAuthor(const QString &newAuthor)
{
    if (newAuthor != m_author) {
    	m_author = newAuthor;
        emit authorChanged(newAuthor);
    }
}

void Item::setGenre(const QString &newGenre)
{
    if (newGenre != m_genre) {
    	m_genre = newGenre;
        emit genreChanged(newGenre);
    }
}

void Item::setYear(const QString &newYear)
{
    if (newYear != m_year) {
    	m_year = newYear;
        emit yearChanged(newYear);
    }
}

void Item::setPurchaseDate(const QString &newPurchaseDate)
{
    if (newPurchaseDate != m_purchase_date) {
    	m_purchase_date = newPurchaseDate;
        emit purchaseDateChanged(newPurchaseDate);
    }
}

void Item::setPurchaseLocation(const QString &newPurchaseLocation)
{
    if (newPurchaseLocation != m_purchase_location) {
    	m_purchase_location = newPurchaseLocation;
        emit purchaseLocationChanged(newPurchaseLocation);
    }
}

void Item::setPurchaseMethod(const QString &newPurchaseMethod)
{
    if (newPurchaseMethod != m_purchase_method) {
    	m_purchase_method = newPurchaseMethod;
        emit purchaseMethodChanged(newPurchaseMethod);
    }
}

void Item::setPurchaseNotes(const QString &newPurchaseNotes)
{
    if (newPurchaseNotes != m_purchase_notes) {
    	m_purchase_notes = newPurchaseNotes;
        emit purchaseNotesChanged(newPurchaseNotes);
    }
}

void Item::setPurchasePrice(const QString &newPurchasePrice)
{
    if (newPurchasePrice != m_purchase_price) {
    	m_purchase_price = newPurchasePrice;
        emit purchasePriceChanged(newPurchasePrice);
    }
}

void Item::setWarranty(const QString &newWarranty)
{
    if (newWarranty != m_warranty) {
    	m_warranty = newWarranty;
        emit warrantyChanged(newWarranty);
    }
}

void Item::setWarrantyName(const QString &newWarrantyName)
{
    if (newWarrantyName != m_warranty_name) {
    	m_warranty_name = newWarrantyName;
        emit warrantyNameChanged(newWarrantyName);
    }
}

void Item::setWarrantyNum(const QString &newWarrantyNum)
{
    if (newWarrantyNum != m_warranty_num) {
    	m_warranty_num = newWarrantyNum;
        emit warrantyNumChanged(newWarrantyNum);
    }
}

void Item::setWarrantyNum2(const QString &newWarrantyNum2)
{
    if (newWarrantyNum2 != m_warranty_num2) {
    	m_warranty_num2 = newWarrantyNum2;
        emit warrantyNum2Changed(newWarrantyNum2);
    }
}

void Item::setWarrantyDateStart(const QString &newWarrantyDateStart)
{
    if (newWarrantyDateStart != m_warranty_date_start) {
    	m_warranty_date_start = newWarrantyDateStart;
        emit warrantyDateStartChanged(newWarrantyDateStart);
    }
}

void Item::setWarrantyDateEnd(const QString &newWarrantyDateEnd)
{
    if (newWarrantyDateEnd != m_warranty_date_end) {
    	m_warranty_date_end = newWarrantyDateEnd;
        emit warrantyDateEndChanged(newWarrantyDateEnd);
    }
}

void Item::setWarrantyNotes(const QString &newWarrantyNotes)
{
    if (newWarrantyNotes != m_warranty_notes) {
    	m_warranty_notes = newWarrantyNotes;
        emit warrantyNotesChanged(newWarrantyNotes);
    }
}

void Item::setNotes(const QString &newNotes)
{
    if (newNotes != m_notes) {
    	m_notes = newNotes;
        emit notesChanged(newNotes);
    }
}
