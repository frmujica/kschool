#!/bin/sh

DIRECTORIO=""
NOMBRE="TU NOMBRE EN GITHUB"
EMAIL="TU_CUENTA_DE_CORREO_EN_GITHUB"


# CHEQUEAMOS QUE TENEMOS UN NOMBRE DE USUARIO DE GITHUB CONFIGURADO
if [ "$NOMBRE" = "" ]
then
 	echo "Edita este script y asigna valor a la variable NOMBRE con tu nombre en GITHUB"
	exit 1
fi

# CHEQUEAMOS QUE TENMEOS UNA CUANTA DE CORREO PARA GITHUB
if [ "$EMAIL" = "" ]
then
 	echo "Edita este script y asigna valor a la variable EMAIL con tu correo en GITHUB"
	exit 1
fi

# COMPROBAMOS QUE TENEMOS UN PARAMETRO DE ENTRADA
if [ "$#" = 0 ] 
then
	echo "Debe de indicar la carpeta en la que se encuentra el projecto a publicar"
	exit
else
  	DIRECTORIO=$1

	# COMPROBAMOS QUE PODEMOS ENTAR EN LA CARPATA DE ENTRADA DONDE ESTA NUESTRO PROYECTO
	if ! cd $DIRECTORIO
	then
		echo "Carpeta no valida"
		exit 1  
	else 
		echo "Ruta a cargar en GITHUB: $PWD"
	fi
 
fi


# COFIGURAMOS EL ENTORNA PARa EL USUARIO CONFIGURADO
git config --global user.name $NOMBRE
git config --global user.email $EMAIL

# AÑADIMOS LOSFICHEROS Y CARPETAS DE LA RUTA QUE NOS HA ENTRADO COMO PARAMETRO
# for i in $(find . -maxdepth 1)
for i in $(find . -not -path '*/\.*')
do
	if [ $i != "." ] && [ $i != ".."  ]
	then
		echo "Añadido: $i"
		git add $i --force
	fi
done

# COMMIT
git commit -m "Working Process"

# PUSH. NOS PEDIRA USUARIO Y CLAVE DE GITHUB
git push




