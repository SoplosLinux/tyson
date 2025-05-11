#!/bin/bash
# Script de instalación para repositorio tyson

# Colores para mensajes
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

# Verificar si se ejecuta como root
if [ "$(id -u)" != "0" ]; then
    echo -e "${RED}Este script debe ejecutarse como root${NC}"
    exit 1
fi

# Crear directorio de llavero GPG
mkdir -p /usr/share/keyrings

# Descargar e importar clave GPG
echo -e "${GREEN}Descargando clave GPG...${NC}"
if ! wget -qO - https://raw.githubusercontent.com/SoplosLinux/tyson/main/public.key | gpg --dearmor -o /usr/share/keyrings/tyson.gpg; then
    echo -e "${RED}Error al descargar la clave GPG${NC}"
    exit 1
fi

# Verificar que la clave se descargó correctamente
if [ ! -s /usr/share/keyrings/tyson.gpg ]; then
    echo -e "${RED}Error: La clave GPG está vacía o no se instaló${NC}"
    exit 1
fi

# Configurar repositorio
echo -e "${GREEN}Configurando repositorio...${NC}"
echo "deb [signed-by=/usr/share/keyrings/tyson.gpg trusted=yes] https://github.com/SoplosLinux/tyson/raw/refs/heads/main/ stable main" > /etc/apt/sources.list.d/tyson.list

# Forzar actualización segura
echo -e "${GREEN}Actualizando índices...${NC}"
rm -f /var/lib/apt/lists/*tyson*
apt-get update --allow-insecure-repositories

# Verificar que el repositorio está configurado
if ! apt-cache policy | grep -q "https://github.com/SoplosLinux/tyson/raw/refs/heads/main"; then
    echo -e "${RED}Error: El repositorio no se configuró correctamente${NC}"
    exit 1
fi

echo -e "${GREEN}¡Repositorio instalado correctamente!${NC}"
