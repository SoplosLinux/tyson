# 📦 Repositorio APT Oficial de Soplos Linux Tyson

Repositorio de paquetes APT para Soplos Linux Tyson

## 🛠️ Instalación

### 1️⃣ Añadir la clave GPG
```bash
# Descargar e instalar la clave GPG
sudo mkdir -p /usr/share/keyrings
wget -qO - https://raw.githubusercontent.com/SoplosLinux/tyson/main/public.key | sudo gpg --dearmor -o /usr/share/keyrings/tyson.gpg
```

### 2️⃣ Añadir el repositorio

```bash
# Añadir la fuente APT
echo "deb [signed-by=/usr/share/keyrings/tyson.gpg trusted=yes] https://github.com/SoplosLinux/tyson/raw/refs/heads/main/ stable main" | sudo tee /etc/apt/sources.list.d/tyson.list

# Actualizar índices
sudo apt update --allow-insecure-repositories
```

### 3️⃣ Instalar paquetes

```bash
sudo apt install nombre-del-paquete
```

## 🔍 Buscar paquetes disponibles
Para ver todos los paquetes disponibles:

```bash
apt search tyson
```

## 🤝 Contribuir
¿Encontraste un error o tienes una sugerencia? ¡Abre un issue!

## 📝 Licencia
Este repositorio está bajo la licencia GPL-3.0.