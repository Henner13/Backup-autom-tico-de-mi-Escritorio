#!/bin/bash

# 1. Definimos las variables y las rutas

FECHA=$(date +%Y-%m-%d)
ARCHIVO="backup.tar.gz"
ORINGEN="$HOME/Escritorio"
DESTINO="$HOME/Backup"
REMOTE="dropbox" #Aquí es importante poner el nombre configurado en Dropbox

# 2. Creamos la carpeta si no existe
if [ ! -d "$DESTINO" ]; then
	echo "\e[31mLa carpeta de destino no exite.Vamos a crearla\e[0m"
	mkdir -p "$DESTINO"
	echo "\e[32mCarpeta Backup creada exitosamente\e[0m"
fi

# 3. Creamos el backup en un archivo comprimido
tar -czf "$DESTINO/$ARCHIVO" "$ORIGEN"

# 4. Sube el backup a Dropbox

rclone copy  "$DESTINO/$ARCHIVO" "$REMOTE:/Backups/"

# 5. Mensaje final de confirmación
echo -e "\e[32mBackup creado y subido con exito: $DESTINO/$ARCHIVO\e[0m"

