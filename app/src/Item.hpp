#ifndef ITEM_HPP
#define ITEM_HPP

#include <QObject>

class Item: public QObject
{
    Q_OBJECT

    // These are the properties that will be accessible by the datamodel in the view.
    Q_PROPERTY(QString id READ id WRITE setID NOTIFY idChanged FINAL)
    Q_PROPERTY(QString room_id READ room_id WRITE setRoomID NOTIFY roomIDChanged FINAL)
    Q_PROPERTY(QString room_name READ room_name WRITE setRoomName NOTIFY roomNameChanged FINAL)
    Q_PROPERTY(QString location_id READ location_id WRITE setLocationID NOTIFY locationIDChanged FINAL)
    Q_PROPERTY(QString location_name READ location_name WRITE setLocationName NOTIFY locationNameChanged FINAL)
    Q_PROPERTY(QString img READ img WRITE setImg NOTIFY imgChanged FINAL)
    Q_PROPERTY(QString picture READ picture WRITE setPicture NOTIFY pictureChanged FINAL)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged FINAL)
    Q_PROPERTY(QString type READ type WRITE setType NOTIFY typeChanged FINAL)
    Q_PROPERTY(QString brand READ brand WRITE setBrand NOTIFY brandChanged FINAL)
    Q_PROPERTY(QString model_number READ model_number WRITE setModelNumber NOTIFY modelNumberChanged FINAL)
    Q_PROPERTY(QString serial_number READ serial_number WRITE setSerialNumber NOTIFY serialNumberChanged FINAL)
    Q_PROPERTY(QString version READ version WRITE setVersion NOTIFY versionChanged FINAL)
    Q_PROPERTY(QString capacity READ capacity WRITE setCapacity NOTIFY capacityChanged FINAL)
    Q_PROPERTY(QString expiry_date READ expiry_date WRITE setExpiryDate NOTIFY expiryDateChanged FINAL)
    Q_PROPERTY(QString artist READ artist WRITE setArtist NOTIFY artistChanged FINAL)
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged FINAL)
    Q_PROPERTY(QString genre READ genre WRITE setGenre NOTIFY genreChanged FINAL)
    Q_PROPERTY(QString year READ year WRITE setYear NOTIFY yearChanged FINAL)
    Q_PROPERTY(QString purchase_date READ purchase_date WRITE setPurchaseDate NOTIFY purchaseDateChanged FINAL)
    Q_PROPERTY(QString purchase_location READ purchase_location WRITE setPurchaseLocation NOTIFY purchaseLocationChanged FINAL)
    Q_PROPERTY(QString purchase_method READ purchase_method WRITE setPurchaseMethod NOTIFY purchaseMethodChanged FINAL)
    Q_PROPERTY(QString purchase_notes READ purchase_notes WRITE setPurchaseNotes NOTIFY purchaseNotesChanged FINAL)
    Q_PROPERTY(QString purchase_price READ purchase_price WRITE setPurchasePrice NOTIFY purchasePriceChanged FINAL)
    Q_PROPERTY(QString warranty READ warranty WRITE setWarranty NOTIFY warrantyChanged FINAL)
    Q_PROPERTY(QString warranty_name READ warranty_name WRITE setWarrantyName NOTIFY warrantyNameChanged FINAL)
    Q_PROPERTY(QString warranty_num READ warranty_num WRITE setWarrantyNum NOTIFY warrantyNumChanged FINAL)
    Q_PROPERTY(QString warranty_num2 READ warranty_num2 WRITE setWarrantyNum2 NOTIFY warrantyNum2Changed FINAL)
    Q_PROPERTY(QString warranty_date_start READ warranty_date_start WRITE setWarrantyDateStart NOTIFY warrantyDateStartChanged FINAL)
    Q_PROPERTY(QString warranty_date_end READ warranty_date_end WRITE setWarrantyDateEnd NOTIFY warrantyDateEndChanged FINAL)
    Q_PROPERTY(QString warranty_notes READ warranty_notes WRITE setWarrantyNotes NOTIFY warrantyNotesChanged FINAL)
    Q_PROPERTY(QString notes READ notes WRITE setNotes NOTIFY notesChanged FINAL)

public:
    Item(QObject *parent = 0);
    Item(const QString &id, const QString &room_id, const QString &room_name, const QString &location_id, const QString &location_name, const QString &img, const QString &picture, const QString &name, const QString &description, const QString &type, const QString &brand, const QString &model_number, const QString &serial_number, const QString &version, const QString &capacity, const QString &expiry_date, const QString &artist, const QString &author, const QString &genre, const QString &year, const QString &purchase_date, const QString &purchase_location, const QString &purchase_method, const QString &purchase_notes, const QString &purchase_price, const QString &warranty, const QString &warranty_name, const QString &warranty_num, const QString &warranty_num2, const QString &warranty_date_start, const QString &warranty_date_end, const QString &warranty_notes, const QString &notes, QObject *parent = 0);

    QString id() const;
    QString room_id() const;
    QString room_name() const;
    QString location_id() const;
    QString location_name() const;
    QString img() const;
    QString picture() const;
    QString name() const;
    QString description() const;
    QString type() const;
    QString brand() const;
    QString model_number() const;
    QString serial_number() const;
    QString version() const;
    QString capacity() const;
    QString expiry_date() const;
    QString artist() const;
    QString author() const;
    QString genre() const;
    QString year() const;
    QString purchase_date() const;
    QString purchase_location() const;
    QString purchase_method() const;
    QString purchase_notes() const;
    QString purchase_price() const;
    QString warranty() const;
    QString warranty_name() const;
    QString warranty_num() const;
    QString warranty_num2() const;
    QString warranty_date_start() const;
    QString warranty_date_end() const;
    QString warranty_notes() const;
    QString notes() const;

    void setID(const QString &newId);
    void setRoomID(const QString &newRoomId);
    void setRoomName(const QString &newRoomName);
    void setLocationID(const QString &newLocationId);
    void setImg(const QString &newImg);
    void setPicture(const QString &newPicture);
    void setName(const QString &newName);
    void setLocationName(const QString &newLocationName);
    void setDescription(const QString &newDescription);
    void setType(const QString &newType);
    void setBrand(const QString &newBrand);
    void setModelNumber(const QString &newModelNumber);
    void setSerialNumber(const QString &newSerialNumber);
    void setVersion(const QString &newVersion);
    void setCapacity(const QString &newCapacity);
    void setExpiryDate(const QString &newExpiryDate);
    void setArtist(const QString &newArtist);
    void setAuthor(const QString &newAuthor);
    void setGenre(const QString &newGenre);
    void setYear(const QString &newYear);
    void setPurchaseDate(const QString &newPurchaseDate);
    void setPurchaseLocation(const QString &newPurchaseLocation);
    void setPurchaseMethod(const QString &newPurchaseMethod);
    void setPurchaseNotes(const QString &newPurchaseNotes);
    void setPurchasePrice(const QString &newPurchasePrice);
    void setWarranty(const QString &newWarranty);
    void setWarrantyName(const QString &newWarrantyName);
    void setWarrantyNum(const QString &newWarrantyNum);
    void setWarrantyNum2(const QString &newWarrantyNum2);
    void setWarrantyDateStart(const QString &newWarrantyDateStart);
    void setWarrantyDateEnd(const QString &newWarrantyDateEnd);
    void setWarrantyNotes(const QString &newWarrantyNotes);
    void setNotes(const QString &newNotes);

Q_SIGNALS:
	void idChanged(const QString &id);
	void roomIDChanged(const QString &roomID);
    void roomNameChanged(const QString &roomName);
	void locationIDChanged(const QString &locationID);
    void locationNameChanged(const QString &locationName);
    void imgChanged(const QString &img);
    void pictureChanged(const QString &picture);
    void nameChanged(const QString &name);
    void descriptionChanged(const QString &description);
    void typeChanged(const QString &type);
    void brandChanged(const QString &brand);
    void modelNumberChanged(const QString &modelNumber);
    void serialNumberChanged(const QString &serialNumber);
    void versionChanged(const QString &version);
    void capacityChanged(const QString &capacity);
    void expiryDateChanged(const QString &expiryDate);
    void artistChanged(const QString &artist);
    void authorChanged(const QString &author);
    void genreChanged(const QString &genre);
    void yearChanged(const QString &year);
    void purchaseDateChanged(const QString &purchaseDate);
    void purchaseLocationChanged(const QString &purchaseLocation);
    void purchaseMethodChanged(const QString &purchaseMethod);
    void purchaseNotesChanged(const QString &purchaseNotes);
    void purchasePriceChanged(const QString &purchasePrice);
    void warrantyChanged(const QString &warranty);
    void warrantyNameChanged(const QString &warrantyName);
    void warrantyNumChanged(const QString &warrantyNum);
    void warrantyNum2Changed(const QString &warrantyNum2);
    void warrantyDateStartChanged(const QString &warrantyDateStart);
    void warrantyDateEndChanged(const QString &warrantyDateEnd);
    void warrantyNotesChanged(const QString &warrantyNotes);
    void notesChanged(const QString &notes);

private:
    QString m_id;
    QString m_room_id;
    QString m_room_name;
    QString m_location_id;
    QString m_location_name;
    QString m_img;
    QString m_picture;
    QString m_name;
    QString m_description;
    QString m_type;
    QString m_brand;
    QString m_model_number;
    QString m_serial_number;
    QString m_version;
    QString m_capacity;
    QString m_expiry_date;
    QString m_artist;
    QString m_author;
    QString m_genre;
    QString m_year;
    QString m_purchase_date;
    QString m_purchase_location;
    QString m_purchase_method;
    QString m_purchase_notes;
    QString m_purchase_price;
    QString m_warranty;
    QString m_warranty_name;
    QString m_warranty_num;
    QString m_warranty_num2;
    QString m_warranty_date_start;
    QString m_warranty_date_end;
    QString m_warranty_notes;
    QString m_notes;
};

#endif
