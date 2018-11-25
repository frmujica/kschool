# kschool
Kschool Environment

# Datos

<li>Autor:	Francisco Mújica</li>
<br>
<li>Fecha:	23/11/2018</li>

<hr>

<li>Sintaxis:  publicar_GHub.sh carpeta_a_publicar

<li>Este admite como parametro la ruta de una carpeta.</li>

<li>El script entrará en la carpeta, recorrerá recursivamente ficheros y subcareptas y las añadira a la tu GITHUB.</li>

<li>Finalmente para publicar en GITHUB nos pedira nuestro uusuario y nuestra clave de GITHUB</li>

<br>
<br>

Antes de probar el script, debes de editar el fihcero y asignar tu nombre y correo de GITHUB correspondiente y a las variables <b>"NOMBRE" </b> e <b>"EMAIL"</b> respectivamente.

<br>
<br>

Ejemplo:

<br>

* Si nuestros projectos se encuentra en la carpeta "/home/dsc/Repos/<b>kschool</b>"

<br>

* Copiaremos este script en este carpeta "<b>/home/dsc/Repos/</b>"

<br>

* Y ejecutaremos <b>"./publicar_GHUB.sh kschool"</b>

<br>

EL SCRIPT NO SUBIRÁ LOS FICHEROS OCULTOS!!!

EL SCRIPT SUBE LOS SUBDIRECTORIOS TAMBIEN

<pre>

#!/bin/sh

DIRECTORIO=""
NOMBRE="TU NOMBRE EN GITHUB"
EMAIL="TU CORREO EN GITHUB"


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
for i in $(find . -not -path '*/\.*')
do
	if [ $i != "." ] && [ $i != ".."  ]
	then
		echo "Añadido: $i"
		git add $i --force
	fi
done

# COMMIT
git commit -m "Mensaje de Commit"

# PUSH. NOS PEDIRA USUARIO Y CLAVE DE GITHUB
git push

</pre>






