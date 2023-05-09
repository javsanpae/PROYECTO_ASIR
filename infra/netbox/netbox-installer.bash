#!/bin/bash

if [ -e ./netbox-docker ] ; then 
    echo "La carpeta netbox-docker ya existe. Por favor, bórrela para ejecutar este script." && exit
fi

git clone https://github.com/netbox-community/netbox-docker.git netbox-docker &>/dev/null

if [ $? -ne 0 ] ; then 
    echo "Hubo un error al clonar el repositorio. Inténtelo de nuevo" && exit
fi

cd netbox-docker || exit

read -rp "¿Qué puerto quieres abrir para Netbox? " port

tee docker-compose.override.yml <<EOF
version: '3.4'
services:
  netbox:
    ports:
      - $port:8080
EOF

if [ ! -f "$(pwd)"/docker-compose.override.yml ] ; then 
    echo "Hubo un error creando el archivo. Asegúrate de que tienes permisos de escritura en esta ruta." && exit
fi

echo "Descargando contenedores necesarios..."
docker compose pull &>/dev/null

sudo cp netbox-compose.service /etc/systemd/system/

read -rp "¿Quieres iniciar ya Netbox? [Y/n] " iniciar

case $iniciar in
    Y|y) docker compose up -d &>/dev/null ;;
    N|n) echo "De acuerdo. Para ejecutarlo más adelante, recuerda usar el comando 'docker compose up'" && exit ;;
    *) echo "Carácter no valido, se saldrá del asistente. Para ejecutarlo, recuerda usar el comando 'docker compose up'"
esac

if [ $? -ne 0 ] ; then
    echo "Hubo un problema en la ejecución. Compruebe que su servicio de Docker se esté ejecutando."
fi