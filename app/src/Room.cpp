#include "Room.hpp"

Room::Room(QObject *parent)
    : QObject(parent)
{
}

Room::Room(const QString &id, const QString &name, const QString &description, const QString &img, QObject *parent)
    : QObject(parent)
    , m_id(id)
    , m_name(name)
	, m_description(description)
	, m_img(img)
{
}

QString Room::id() const
{
    return m_id;
}

QString Room::name() const
{
    return m_name;
}

QString Room::description() const
{
    return m_description;
}

QString Room::img() const
{
    return m_img;
}

void Room::setID(const QString &newId)
{
    if (newId != m_id) {
        m_id = newId;
        emit idChanged(newId);
    }
}

void Room::setName(const QString &newName)
{
    if (newName != m_name) {
        m_name = newName;
        emit nameChanged(newName);
    }
}

void Room::setDescription(const QString &newDescription)
{
    if (newDescription != m_description) {
        m_description = newDescription;
        emit descriptionChanged(newDescription);
    }
}

void Room::setImg(const QString &newImg)
{
    if (newImg != m_img) {
    	m_img = newImg;
        emit imgChanged(newImg);
    }
}
