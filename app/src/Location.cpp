#include "Location.hpp"

Location::Location(QObject *parent)
    : QObject(parent)
{
}

Location::Location(const QString &id, const QString &room_id,
		const QString &room_name, const QString &name,
		const QString &description, const QString &position,
		const QString &img, QObject *parent)
    : QObject(parent)
    , m_id(id)
	, m_room_id(room_id)
	, m_room_name(room_name)
    , m_name(name)
	, m_description(description)
	, m_position(position)
	, m_img(img)
{
}

QString Location::id() const
{
    return m_id;
}

QString Location::room_id() const
{
    return m_room_id;
}

QString Location::room_name() const
{
    return m_room_name;
}

QString Location::name() const
{
    return m_name;
}

QString Location::description() const
{
    return m_description;
}

QString Location::position() const
{
    return m_position;
}

QString Location::img() const
{
    return m_img;
}

void Location::setID(const QString &newId)
{
    if (newId != m_id) {
        m_id = newId;
        emit idChanged(newId);
    }
}

void Location::setRoomID(const QString &newRoomId)
{
    if (newRoomId != m_room_id) {
        m_room_id = newRoomId;
        emit roomIDChanged(newRoomId);
    }
}

void Location::setRoomName(const QString &newRoomName)
{
    if (newRoomName != m_room_name) {
    	m_room_name = newRoomName;
        emit roomNameChanged(newRoomName);
    }
}

void Location::setName(const QString &newName)
{
    if (newName != m_name) {
        m_name = newName;
        emit nameChanged(newName);
    }
}

void Location::setDescription(const QString &newDescription)
{
    if (newDescription != m_description) {
    	m_description = newDescription;
        emit descriptionChanged(newDescription);
    }
}

void Location::setPosition(const QString &newPosition)
{
    if (newPosition != m_position) {
    	m_position = newPosition;
        emit positionChanged(newPosition);
    }
}

void Location::setImg(const QString &newImg)
{
    if (newImg != m_img) {
    	m_img = newImg;
        emit imgChanged(newImg);
    }
}
