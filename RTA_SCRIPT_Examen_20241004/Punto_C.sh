#!/bin/bash

# Obtener el hash de la contraseña del usuario vagrant
CONTRA_USUARIO=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

echo "==== Creo los usuarios ===="
sudo useradd -s /bin/bash -m p1c2_2024_A1
sudo useradd -s /bin/bash -m p1c2_2024_A2
sudo useradd -s /bin/bash -m p1c2_2024_A3
sudo useradd -s /bin/bash -m p1c2_2024_P1

echo "==== Creo los grupos secundarios ===="
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

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

echo " ==== Ajusto los Permisos ===="
sudo chmod -R 750 /Examenes-UTN/Alumno_1
sudo chmod -R 760 /Examenes-UTN/Alumno_2
sudo chmod -R 700 /Examenes-UTN/Alumno_3
sudo chmod -R 775 /Examenes-UTN/profesores

echo "==== Ajusto Dueños ===="
sudo chown -R p1c2_2024_A1:p1c2_2024_gAlumno /Examenes-UTN/Alumno_1
sudo chown -R p1c2_2024_A2:p1c2_2024_gAlumno /Examenes-UTN/Alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_gAlumno /Examenes-UTN/Alumno_3
sudo chown -R p1c2_2024_P1:p1c2_2024_gAlumno /Examenes-UTN/profesores


echo "Creo archivo con p1c1_2024_u1 "
su -c "whoami > /Examenes-UTN/Alumno_1/validar1.txt" p1c2_2024_A1
su -c "whoami > /Examenes-UTN/Alumno_2/validar2.txt" p1c2_2024_A2
su -c "whoami > /Examenes-UTN/Alumno_3/validar3.txt" p1c2_2024_A3
su -c "whoami > /Examenes-UTN/profesores/validar4.txt" p1c2_2024_P1

echo "Muestro permisos del archivo: "
sudo ls -l /Examenes-UTN/Alumno_1/validar1.txt
sudo ls -l /Examenes-UTN/Alumno_2/validar2.txt
sudo ls -l /Examenes-UTN/Alumno_3/validar3.txt
sudo ls -l /Examenes-UTN/profesores/validar4.txt

echo "Muestro archivo: "
sudo cat /Estudiantes-UTN/Alumno_1/validar1.txt
sudo cat /Estudiantes-UTN/Alumno_2/validar2.txt
sudo cat /Estudiantes-UTN/Alumno_3/validar3.txt
sudo cat /Estudiantes-UTN/profesores/validar4.txt
