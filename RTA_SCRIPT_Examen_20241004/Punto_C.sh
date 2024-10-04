#!/bin/bash

# Obtener el hash de la contraseña del usuario vagrant
CONTRA_USUARIO=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

echo "==== Creo los usuarios ===="
sudo useradd -s /bin/bash -m p1c2_2024_A1
sudo useradd -s /bin/bash -m p1c2_2024_A2
sudo useradd -s /bin/bash -m p1c2_2024_A3
sudo useradd -s /bin/bash -m p1c2_2024_P1

echo "==== Creo los grupos secundarios ===="
sudo groupadd -f p1c2_2024_gAlumno
sudo groupadd -f p1c2_2024_gProfesores

echo "==== Agrego a los usuarios a los grupos secundarios ===="
for i in 1 2 3; do
    sudo usermod -aG p1c2_2024_gAlumno p1c2_2024_A$i
done
sudo usermod -aG p1c2_2024_gProfesores p1c2_2024_P1

echo "==== Asigno a los usuarios el hash de la contraseña del usuario vagrant ===="
for i in 1 2 3; do
    echo "p1c2_2024_A$i:${CONTRA_USUARIO}" | sudo chpasswd
done
echo "p1c2_2024_P1:${CONTRA_USUARIO}" | sudo chpasswd

echo "==== Ajusto los Permisos ===="
sudo chmod -R 750 /Examenes-UTN/Alumno_1
sudo chmod -R 760 /Examenes-UTN/Alumno_2
sudo chmod -R 700 /Examenes-UTN/Alumno_3
sudo chmod -R 775 /Examenes-UTN/profesores

echo "==== Ajusto Dueños ===="
sudo chown -R p1c2_2024_A1:p1c2_2024_gAlumno $HOME/Examenes-UTN/Alumno_1
sudo chown -R p1c2_2024_A2:p1c2_2024_gAlumno $HOME/Examenes-UTN/Alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_gAlumno $HOME/Examenes-UTN/Alumno_3
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores $HOME/Examenes-UTN/profesores

echo "Creo archivo con p1c1_2024_u1"
sudo -u p1c2_2024_A1 bash -c "echo \$(whoami) > $HOME/Examenes-UTN/Alumno_1/validar1.txt"
sudo -u p1c2_2024_A2 bash -c "echo \$(whoami) > $HOME/Examenes-UTN/Alumno_2/validar2.txt"
sudo -u p1c2_2024_A3 bash -c "echo \$(whoami) > $HOME/Examenes-UTN/Alumno_3/validar3.txt"
sudo -u p1c2_2024_P1 bash -c "echo \$(whoami) > $HOME/Examenes-UTN/profesores/validar4.txt"

echo "Muestro permisos del archivo: "
sudo ls -l $HOME/Examenes-UTN/Alumno_1/validar1.txt
sudo ls -l $HOME/Examenes-UTN/Alumno_2/validar2.txt
sudo ls -l $HOME/Examenes-UTN/Alumno_3/validar3.txt
sudo ls -l $HOME/Examenes-UTN/profesores/validar4.txt

echo "Muestro archivo: "
sudo cat $HOME/Examenes-UTN/Alumno_1/validar1.txt
sudo cat $HOME/Examenes-UTN/Alumno_2/validar2.txt
sudo cat $HOME/Examenes-UTN/Alumno_3/validar3.txt
sudo cat $HOME/Examenes-UTN/profesores/validar4.txt

