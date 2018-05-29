#include "timezone.h"


TimeZone::TimeZone(QObject *parent) : QObject(parent) , m_oreFusoOrario(0)
{
    QDateTime newDate= QDateTime::currentDateTimeUtc();  // restituisce il time UTC (quello di Greenwitch)
    emit dateTimeChanged(newDate);

    QTimer *timer= new QTimer();
    timer->start(1000);

   connect(timer, SIGNAL(timeout()), this, SLOT(updateDateTime()));
}

void TimeZone::updateDateTime()
{
    QDateTime newDate= QDateTime::currentDateTimeUtc();

   QTime tm=newDate.time();



   qDebug()<<newDate.toOffsetFromUtc(3600);
    emit dateTimeChanged(newDate.toOffsetFromUtc(3600));


}

void TimeZone::cambioFusoOrario(int offsetFuso)
{
    m_oreFusoOrario=offsetFuso;

}

