#ifndef TIMEZONE_H
#define TIMEZONE_H

#include <QObject>
#include <QDateTime>
#include <QTimer>
#include <QDebug>
#include <QTimeZone>

class TimeZone : public QObject
{
   Q_OBJECT

public:
   explicit TimeZone(QObject *parent = nullptr);



public slots:

    void updateDateTime();
    void cambioFusoOrario(int offsetFuso);

signals:

    void dateTimeChanged (QTime dataFusoOrario);

private:

    int m_oreFusoOrario;

};

#endif // TIMEZONE_H
