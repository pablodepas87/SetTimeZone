#include "timezone.h"


TimeZone::TimeZone(QObject *parent) : QObject(parent) , m_oreFusoOrario(2)
{
    QDateTime newDate= QDateTime::currentDateTimeUtc();  // restituisce il time UTC (quello di Greenwitch)
    QTime time = newDate.time();
    emit dateTimeChanged(time);

    QTimer *timer= new QTimer();
    timer->start(100);
    timer->setSingleShot(false);

   connect(timer, SIGNAL(timeout()), this, SLOT(updateDateTime()));
}

void TimeZone::updateDateTime()
{
    QDateTime newDate= QDateTime::currentDateTimeUtc().toOffsetFromUtc(3600*m_oreFusoOrario);

    QTime time = newDate.time();

     emit dateTimeChanged(time);

}

void TimeZone::cambioFusoOrario(int offsetFuso)
{
    m_oreFusoOrario=offsetFuso;

}

