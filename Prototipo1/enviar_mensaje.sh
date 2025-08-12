#!/bin/bash

# Mensaje JSON
MENSAJE='{
  "nombre": "Martín Mainentti",
  "edad": 20,
  "ciudad": "Maldonado",
  "intereses": ["manga", "gaming", "teclado", "escritura"]
}'

# Publicar el mensaje al broker MQTT
mosquitto_pub -h localhost -p 1883 -t "test/mensaje" -m "$MENSAJE"
