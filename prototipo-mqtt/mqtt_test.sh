#!/bin/bash


BROKER_HOST="localhost"
TOPIC="test/topic"

echo "prueba MQTT"
echo "Broker: $BROKER_HOST"
echo "Tópico: $TOPIC"
echo


echo "suscribiendose al topic '$TOPIC'..."
docker exec broker-mqtt mosquitto_sub -h $BROKER_HOST -t "$TOPIC" > subscriber_output.log &
SUB_PID=$!   

sleep 2


echo "publicando mensajes..."
docker exec broker-mqtt mosquitto_pub -h $BROKER_HOST -t "$TOPIC" -m "Mensaje 1: MQTT desde docker"
sleep 1
docker exec broker-mqtt mosquitto_pub -h $BROKER_HOST -t "$TOPIC" -m "Mensaje 2: probando comunicacion publish/subscribe"
sleep 1
docker exec broker-mqtt mosquitto_pub -h $BROKER_HOST -t "$TOPIC" -m "Mensaje 3: enviando datos simulados"
sleep 1
docker exec broker-mqtt mosquitto_pub -h $BROKER_HOST -t "$TOPIC" -m "Mensaje 4: ultimo mensaje"


sleep 3

echo
echo "mensajes recibidos:"
cat subscriber_output.log

kill $SUB_PID

echo
echo "prueba finalizada"
