#ifndef ROOM_HPP
#define ROOM_HPP

#include <QObject>

class Room: public QObject
{
    Q_OBJECT

    // These are the properties that will be accessible by the datamodel in the view.
    Q_PROPERTY(QString id READ id WRITE setID NOTIFY idChanged FINAL)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged FINAL)
    Q_PROPERTY(QString img READ img WRITE setImg NOTIFY imgChanged FINAL)

public:
    Room(QObject *parent = 0);
    Room(const QString &id, const QString &name,
    		const QString &description, const QString &img,
    		QObject *parent = 0);

    QString id() const;
    QString name() const;
    QString description() const;
    QString img() const;

    void setID(const QString &newId);
    void setName(const QString &newName);
    void setDescription(const QString &newDescription);
    void setImg(const QString &newImg);

Q_SIGNALS:
    void idChanged(const QString &newId);
    void nameChanged(const QString &name);
    void descriptionChanged(const QString &description);
    void imgChanged(const QString &img);

private:
    QString m_id;
    QString m_name;
    QString m_description;
    QString m_img;
};

#endif
