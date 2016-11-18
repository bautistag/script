#!/bin/bash

#Funcion menu.
menu (){
	clear
	echo "1-Comprimir"
	echo "2-Descomprimir"
	echo "0-Exit"
	read opcion
}

#Funcion que comprimir
comprimir (){
	echo "Introduce el fichero que quieres comprimir"
	read fichero
	echo "Introduce el directorio donde se encuentra el fichero"
	read directorio

        cd $directorio 2>>/tmp/errores.txt

if [ $fichero ]
	then
	tar -czvf $fichero.tgz $fichero
else
echo "El $fichero no se puede comprimir"
fi
}

#Funcion descomprimir
descomprimir (){ 
        echo "Introduce el fichero que quieres descomprimir"
	read fichero
	echo "Introduce el directorio donde se encuentra el fichero"
	read directorio

       cd $directorio 2>>/tmp/errores.txt

if [ $fichero ]
	then
	tar -xzvf $fichero
else 
echo "El $fichero no se puede descomprimir"
fi
}


#Funcion para elegir una opcion del menu
opciones (){
case $opcion in
	1)comprimir;;
	2)descomprimir;;
	0)exit 0;;
esac
}


while true
do
#Muestra el menu
 menu
	if [ $opcion -le 2 ] && [ $opcion -ge 0 ] 
	then
	#Llamo a la funcion opciones.
	opciones
	else  echo "Elige una opcion de las anteriores"
	fi
read -p "Pulse para continuar"
done
