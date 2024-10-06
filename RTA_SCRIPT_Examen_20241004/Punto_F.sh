#! /bin/bash

# Obtengo la IP pública
public_ip=$(curl -s ifconfig.me)

# Obtengo el nombre de usuario
usuario=$(whoami)

# Obtengo el hash del usuario
usuario_hash=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

# URL de mi repositorio
repo_url="https://github.com/SantinoCasado/UTNFRA_SO_1P2C_2024_casado.git"

# Escribir la información en el archivo
echo Mi IP publica es: $public_ip >> ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Avanzado.txt
echo Mi usuario es: $usuario >> ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Avanzado.txt
echo El HASH de mi usuario es: $usuario_hash >> ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Avanzado.txt
echo La URL de mi repositorio es: $repo_url >> ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Avanzado.txt

echo "Muestro el archivo Filtro_Avanzado"
cat ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Avanzado.txt
