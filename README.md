# Backup Automático del Escritorio
Como estudiante de ASIR considero que la automatización es un factor importante que debemos saber para nuestro futuro laboral, por lo que me he decidido a hacer este pequeño proyecto.
Este proyecto contiene un script en Bash que realiza un backup automático del contenido del Escritorio del usuario. El backup se comprime, se guarda localmente y se sube a Dropbox utilizando `rclone`.
Además, el script está programado para ejecutarse automáticamente cada dos domingos a las 20:00 mediante `cron`.

## 📁 ¿Qué hace el script?

- Comprime todos los archivos y carpetas del Escritorio.
- Guarda el archivo `.tar.gz` en una carpeta local (`$HOME/backups`).
- Sube el archivo comprimido a Dropbox usando `rclone`.
- Muestra mensajes de estado en colores (verde para éxito, rojo para errores o archivos no creados).
- Se ejecuta automáticamente cada dos domingos a través de `cron`.

## ⚙️ Requisitos

- Linux con Bash
- `rclone` instalado y configurado con Dropbox
- Acceso a `cron` para tareas programadas

## 🚀 Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/Henner13/Backup-autom-tico-de-mi-Escritorio.git
   ```
2. Da permisos de ejecución al script:
   ```bash
   chmod +x backup.sh
   ```
3. Configura rclone con Dropbox:
   ```bash
   rclone config
   ```
4. Añade ka tarea a cron:
   ```bash
   crontab -e
   ```
   Y pega esta línea al final del archivo:
   ```
   0 20 * * 0 [ $(($(date +\%U) \% 2)) -eq 0 ] && /bin/bash $HOME/Escritorio/scripts/backup.sh >> $HOME/backup_log.txt 2>&1
   ```
## 📌 Notas
   * Asegurate de que la carpeta Backups exista en Dropbox o deja que rclone la cree automáticamente.
   * Puedes modificar el script para cambiar la frecuencia, origen del backup o destino en la nube, como en Google Drive.
  
## 🧑‍💻 Autor
     Henner Ignacio Martin Jaschke
