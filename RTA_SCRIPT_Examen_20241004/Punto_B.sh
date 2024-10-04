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

