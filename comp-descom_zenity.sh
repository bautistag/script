#!/bin/bash

#Funcion menu.
menu (){
opcion=`zenity --text "Elige una opcion" \
	--list --column "Numero" --column "Operacion" \
	"1" "Comprimir" "2" "Descomprimir" "0" "Salir"`
}

#Funcion que comprimir
comprimir (){
	fichero= `zenity --text= "Introduce el fichero que quieres comprimir"`
	directorio=`zenity --text= "Introduce el directorio donde se encuentra el fichero"`

if [ -d $fichero ]
	then
	cd $directorio 2>>/tmp/errores.txt
	tar cvf $fichero.tgz $fichero

else
zenity --text= "El $archivo no es un directorio y no se puede comprimir"
fi
}

#Funcion descomprimir
descomprimir (){ 
        fichero= `zenity --text= "Introduce el fichero que quieres descomprimir"`
        directorio=`zenity --text= "Introduce el directorio donde quieres descomprimir el fichero"`

if [ -f $fichero ]
	then
	cd $directorio 	
	tar -xvf $fichero 
else 
zenity --text "$archivo no es un directorio y no se puede descomprimir"
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
	else  
	zenity --text "Elige una opcion de las anteriores"
	fi
#read -p "Pulse para continuar"
done
