#ifndef SERIALPORTINTERFACE_H
#define SERIALPORTINTERFACE_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QTimer>
#include <QtDebug>
#include <QVariantList>
#include <QStringList>
#include <QDateTime>
#include <fstream>
#include <QTimer>

class SerialPortInterface : public QObject
{
    Q_OBJECT
public:
    explicit SerialPortInterface(QObject *parent = nullptr);

    bool initializeSerialPort();

    bool sendData(QVariantList data);

signals:
    void startedSerializerPort(bool isAvailable);

    void sentData(bool isSent);

    void heartbeatDataRecieved(float data);

    void statusDataRecieved(QString data);

    void chartDataRecieved(float data);

public slots:
    void onInitSerializerPort();

    void onTimerOverflow();

    void onSendingData(QVariantList data);

private slots:

    void onReadyRead();

    void checkIfSerialPortIsConnected(QSerialPort::SerialPortError error);

private:
    QSerialPort * m_serial_port;

    bool m_is_available, m_is_recieving;

    QString m_port_name;

    QByteArray prepareDataForSending(QVariantList data);

    QList<float> m_plot_data;

    // std::ifstream stream;

    QTimer * timer;

    int m_array_size, index = 0;

};


#endif // SERIALPORTINTERFACE_H
