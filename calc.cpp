#include "calc.h"

calc::calc() : m_result(0) {}

void calc::convert(const QString &value, int option)
{
    bool ok;
    double intValue = value.toDouble(&ok);

    if(ok)
    {
        switch(option)
        {
            case 0:
                m_result = incesToFeet(intValue);
                qDebug() << "Inches to Feet: " << m_result;
                break;

            case 1:
                m_result = feetToInces(intValue);
                break;
        }

        emit resultChanged();
    }

    else
    {
        m_result = 0; // Reset the result in case of an invalid value
        emit resultChanged();
        qDebug() <<"Invalid value";
    }

}


double calc::feetToInces(double value)
{
    return (value*12.0);

}

double calc::incesToFeet(double value)
{
    return (value/ 12.0);
}

double calc::getResult() const
{
    return m_result;
}
