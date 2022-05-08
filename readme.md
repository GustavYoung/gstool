##Instalación del actualizador de directorios v2.5.1

###Clonar este git directamente en la terminal de la rasp adentro de la carpeta uslu

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