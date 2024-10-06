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
while [ $contador -le 9 ]; do
    (
    echo n
    echo
    echo +1G
    echo w
    ) | sudo fdisk $DISCO
    contador=$((contador + 1))
done
sudo fdisk $DISCO << EOF
n


w
EOF
echo " ==== Muestro el particionamiento ===="
sudo fdisk $DISCO -l
echo "==== Particionamiento completado. ===="
echo "==== Formateando las particiones lógicas ===="
for i in {5..14}; do
    sudo mkfs.ext4 ${DISCO}${i}
done
echo "==== Formateo completados. ===="

echo "==== Monto las pariciones ===="
echo "${DISCO}5 $HOME/Examenes-UTN/Alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}6 $HOME/Examenes-UTN/Alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}7 $HOME/Examenes-UTN/Alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}8 $HOME/Examenes-UTN/Alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}9 $HOME/Examenes-UTN/Alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}10 $HOME/Examenes-UTN/Alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}11 $HOME/Examenes-UTN/Alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}12 $HOME/Examenes-UTN/Alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}13 $HOME/Examenes-UTN/Alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}14 $HOME/Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
