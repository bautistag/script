#!/bin/bash

#Funcion menu.
menu (){
opcion=`zenity --text "Elige una opcion" \
	--list --column "Numero" --column "Operacion" \
	"1" "Comprimir" "2" "Descomprimir" "0" "Salir"`
}

#Funcion que comprimir
comprimir (){
	fichero=`zenity --forms --title="Comprimir" \
	--text="Introduce el fichero que quieres comprimir" \
	--add-entry="Fichero"`
	directorio=`zenity --forms --title= "Comprimir" \
	--text="Introduce el directorio donde se encuentra el fichero" \
	--add-entry="Directorio"`

        cd $directorio 2>>/tmp/errores.txt

if [ $fichero ]
	then
#	cd $directorio 2>>/tmp/errores.txt
	tar -czvf $fichero.tgz $fichero

else
zenity --info --text="El $fichero no se puede comprimir"
fi
}

#Funcion descomprimir
descomprimir (){ 
        fichero=`zenity --forms --title="Descomprimir" \
	--text="Introduce el fichero que quieres descomprimir" \
	--add-entry="Fichero"`
        directorio=`zenity --forms --title="Descomprimir" \
	--text="Introduce el directorio donde quieres descomprimir el fichero" \
	--add-entry="Directorio"`
      cd $directorio 2>>/tmp/errores.txt

if [ $fichero ]
	then
#	cd $directorio 2>>/tmp/errores.txt
	tar -xzvf $fichero
else
zenity --info --text "El $fichero no se puede descomprimir"
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
	zenity --info --text "Elige una opcion de las anteriores"
	fi
done
