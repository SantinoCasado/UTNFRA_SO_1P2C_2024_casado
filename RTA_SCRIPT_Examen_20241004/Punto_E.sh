#!/bin/bash

# Obtener total de memoria RAM
total_ram=$(grep MemTotal /proc/meminfo | awk '{print $2, $3}')

# Obtengo el fabricante del chasis
chassis=$(sudo dmidecode -s chassis-manufacturer)

echo MemTotal: $total_ram >> ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Basico.txt

echo Chasis Information >> ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Basico.txt
echo 		Manufacturer: $chassis >> ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Basico.txt

echo "==== Muestro el contenido de Filtro_Basico ===="
cat ~/repogit/UTNFRA_SO_1P2C_2024_casado/RTA_ARCHIVOS_Examen_20241004/Filtro_Basico.txt
