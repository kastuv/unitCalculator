#ifndef CALC_H
#define CALC_H

#include <QObject>
#include <qdebug.h>

class calc : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double result READ getResult NOTIFY resultChanged)

public:
    calc();

public slots:
    Q_INVOKABLE void convert(const QString &value, int option);
    double getResult() const;

signals:
    double resultChanged();

private:
    double feetToInces(double value);
    double incesToFeet(double value);
    double m_result;
};

#endif // CALC_H
