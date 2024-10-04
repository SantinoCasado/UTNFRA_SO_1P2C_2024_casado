#Creo los directorios con sus respectivas ramas
mkdir -p $HOME/Estructura_Asimetrica/{correo,clientes} && touch $HOME/Estructura_Asimetrica/correo/cartas_{1..100},$HOME/Estructura_Asimetrica/correo/carteros_{1..10},$HOME/Estructura_Asimetrica/clientes/cartas_{1..100}

echo "Muestro la estructura de los directorios"
tree $HOME/Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4
