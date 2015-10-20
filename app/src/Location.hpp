#ifndef LOCATION_HPP
#define LOCATION_HPP

#include <QObject>

class Location: public QObject
{
    Q_OBJECT

    // These are the properties that will be accessible by the datamodel in the view.
    Q_PROPERTY(QString id READ id WRITE setID NOTIFY idChanged FINAL)
    Q_PROPERTY(QString room_id READ room_id WRITE setRoomID NOTIFY roomIDChanged FINAL)
    Q_PROPERTY(QString room_name READ room_name WRITE setRoomName NOTIFY roomNameChanged FINAL)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged FINAL)
    Q_PROPERTY(QString position READ position WRITE setPosition NOTIFY positionChanged FINAL)
    Q_PROPERTY(QString img READ img WRITE setImg NOTIFY imgChanged FINAL)

public:
    Location(QObject *parent = 0);
    Location(const QString &id, const QString &room_id,
    		const QString &room_name, const QString &name,
    		const QString &description, const QString &position,
    		const QString &img, QObject *parent = 0);

    QString id() const;
    QString room_id() const;
    QString room_name() const;
    QString name() const;
    QString description() const;
    QString position() const;
    QString img() const;

    void setID(const QString &newId);
    void setRoomID(const QString &newRoomId);
    void setRoomName(const QString &newRoomName);
    void setName(const QString &newName);
    void setDescription(const QString &newDescription);
    void setPosition(const QString &newPosition);
    void setImg(const QString &newImg);

Q_SIGNALS:
    void idChanged(const QString &newId);
    void roomIDChanged(const QString &newRoomId);
    void roomNameChanged(const QString &newRoomName);
    void nameChanged(const QString &name);
    void descriptionChanged(const QString &description);
    void positionChanged(const QString &position);
    void imgChanged(const QString &img);

private:
    QString m_id;
    QString m_room_id;
    QString m_room_name;
    QString m_name;
    QString m_description;
    QString m_position;
    QString m_img;
};

#endif
