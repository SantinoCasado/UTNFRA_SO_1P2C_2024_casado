#!/bin/bash
DISCO="/dev/sdc"  
echo "==== Realizamos el particionamiento extendido del disco de 10G ===="
sudo fdisk $DISCO << EOF
n  
e



w  
EOF
echo "==== Realizo las particiones lógicas ===="
contador=1
if [ $contador -eq 9 ]; then
    (
    echo n   
    echo    
    echo +1G  
    echo w  
    ) | sudo fdisk $DISCO
    contador=$((contador + 1))
elif [ $contador -eq 10 ]; then
	(
    echo n
    echo
    echo 
    echo w
    ) | sudo fdisk $DISCO
fi
echo " ==== Muestro el particionamiento ===="
sudo fdisk $DISCO -l
echo "==== Particionamiento completado. ===="

echo "==== Formateando las particiones lógicas ===="
for i in {5..14}; do
    sudo mkfs.ext4 /dev/${DISCO}${i}  
done

echo "==== Formateo completados. ===="

echo "==== Monto las particiones escribiendo en el archivo /etc/fstab sin usar vim ===="
echo "sdc5  /home/vagrant/Examenes-UTN/Alumno_1/parcial_1   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc6  /home/vagrant/Examenes-UTN/Alumno_1/parcial_2   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc7  /home/vagrant/Examenes-UTN/Alumno_1/parcial_3   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc8  /home/vagrant/Examenes-UTN/Alumno_2/parcial_1   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc9  /home/vagrant/Examenes-UTN/Alumno_2/parcial_2   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc10 /home/vagrant/Examenes-UTN/Alumno_2/parcial_3   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc11 /home/vagrant/Examenes-UTN/Alumno_3/parcial_1   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc12 /home/vagrant/Examenes-UTN/Alumno_3/parciaL_2   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc13 /home/vagrant/Examenes-UTN/Alumno_3/parcial_3   ext4  defaults  0 0" | sudo tee -a /etc/fstab
echo "sdc14 /home/vagrant/Examenes-UTN/profesores ext4  defaults  0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "==== Montaje completado. ===="
