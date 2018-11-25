#!/bin/sh


DIRECTORIO=""
NOMBRE="Francisco Mujica"
EMAIL="frmujica@outlook.es"

if [ "$#" = 0 ] 
then
	echo "Debe de indicar la carpeta en la que se encuentra el projecto a publicar"
	exit
else
  DIRECTORIO=$1
fi


if [ "$NOMBRE" = "" ]
then
 	echo "Edita este script y asigna valor a la variable NOMBRE con tu nombre en GITHUB"
	exit 1
fi

if [ "$EMAIL" = "" ]
then
 	echo "Edita este script y asigna valor a la variable EMAIL con tu correo en GITHUB"
	exit 1
fi


# COFIGURAMOS EL ENTORNA PARa EL USUARIO CONFIGURADO
git config --global user.name $NOMBRE
git config --global user.email $EMAIL

for i in $(find $DIRECTORIO -maxdepth 1)
do
	echo "Añadido: $i"
	git add $i --force
done

git commit -m "Mensaje de Commit"

git push




