##Instalación del actualizador de directorios v2.5.1

###Clonar este git directamente en la terminal de la rasp adentro de la carpeta uslu

```
git clone https://<Nombre_de_usuario>@bitbucket.org/miraiworks/gstool.git
```
###Si tiene su branch propio para la configuracion hay que especificar el branch
```
git clone -b cerveceria_de_barrio1 https://Kelpo64@bitbucket.org/miraiworks/gstool.git
```

###Usar "git status" para verficar que este en el master branch

###Hacer el intercambio de llaves necesario 

###Configurar el archivo cliente.cfg y el alternativo en caso de multiples trabajos para playlists, etc.

###En caso de que el archivo cliente ya tenga una version para el cliente se puede descargar desde:
```
uxmal-ftp@uxm3.uxmalstream.com:3113/home/uxm3-bk/CLIENTES/
```

###Usar el comando de actualizacion manualmente por primera vez para ajustar el intercambio de llaves
```
#Para memorias nuevas que tienen la aplicacion nativa 2.0
sudo bash gstool/update_mem.sh
```

```
#Para memorias viejas que fueron actualizadas a la aplicacion 2.0
sudo bash gstool/update_app.sh
```
###Autorizar la identidad del servidor escribiendo "yes" seguido de la tecla "enter".

###Una vez revisado el llenado de carpetas revisar el log y verificar el contenido en el streambox si todo está correcto hay que establecer la rutina de actualización que actualmente son cada 20 min de hora de funcionamiento se revisa el contenido en el servidor.

###Para agregar las horas de actualización se debe usar el comando

```
sudo crontab -e

```
###Se abrirá el editor para la programación de rutinas en la utima línea del mismo se debe copiar:

```
#Para memorias nuevas que tienen la aplicacion nativa 2.0
*/20 * * * * bash /home/uslu/gstool/update_mem.sh
```

```
#Para memorias viejas que fueron actualizadas a la aplicacion 2.0
*/20 * * * * bash /home/uslu/gstool/update_app.sh
```

###Para guardar el archivo hay que dar "ctrl + o" y "enter" en el teclado para que se guarde el nuevo fichero y para salir del editor se usa "ctrl + x" en el teclado

###Verificar la correcta instalación de la rutina

##cuando son como texas ribs que hay que armar dias con diferentes playlists

```
*/20 * * * mon-fri  bash /home/uslu/gstool/update_app.sh

*/20 * * * SAT bash /home/uslu/gstool/update_app_alt.sh

*/20 * * * SUN bash /home/uslu/gstool/update_app_alt.sh
```