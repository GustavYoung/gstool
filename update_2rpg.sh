#!/bin/bash
# Actualizacion por hora de equipos.
# Version Alpha 0.2 bugfix 015
#FOR YOUR EYES ONLY CODE PENDING OF APLYING LICENSE PROTECTION
#Copyright 2014-2016 Gustavo Santana
#For internal use only
#Developed for vupen Sync fork for uxmalstream Prototype
#bugs? contact at gus.santana(at)icloud.com
case "$(pidof rsync | wc -w)" in

0)  configfile='/home/uslu/gstool/cliente2.cfg'
    configfile_secured='/tmp/cliente.cfg'

    # Elemento de seguridad previene el envenenamiento del archivo de configuracion
    if egrep -q -v '^#|^[^ ]*=[^;]*' "$configfile"; then
      echo "El archivo de configuracion fue alterado, limpiando..." >&2
      # Filtrar el contenido peligroso :S :P
      egrep '^#|^[^ ]*=[^;&]*'  "$configfile" > "$configfile_secured"
      configfile="$configfile_secured"
    fi

    # Ahora con todo limpio se puede continuar :)
    . "$configfile"
    echo "Leyendo configuración" >&2
    #source o . es la misma mierda
    echo "Nombre del cliente: $client_name" >&2
    echo "Carpertas a actualizar: $client_folders" >&2

    if [ "$folder_numbers" -eq 1 ]; then

      touch /home/uslu/actualizacion.lock
      ( cmdpid="$BASHPID";
          (sleep 36; echo "Version 2021-02-27") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    if [ "$shared" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$shared_servidor/ /home/uslu/ropongi/uploads/shared/;
                    fi
                    if [ "$ads2" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$ads_servidor/ /home/uslu/ropongi/uploads/ads/;
                    fi
                    if [ "$flotantes" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$flotantes_servidor/ /home/uslu/sponsors/;
                    fi
                    if [ "$playlist" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    fi
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/actualizacion.lock
      exit;
    fi

    if [ "$folder_numbers" -eq 2 ]; then
      touch /home/uslu/actualizacion.lock
      ( cmdpid=$BASHPID;
          (sleep 36; echo "Version 2021-02-27") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    if [ "$shared" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$shared_servidor/ /home/uslu/ropongi/uploads/shared/;
                    fi
                    if [ "$ads2" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$ads_servidor/ /home/uslu/ropongi/uploads/ads/;
                    fi
                    if [ "$flotantes" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$flotantes_servidor/ /home/uslu/sponsors/;
                    fi
                    if [ "$playlist" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    fi
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/actualizacion.lock
      exit
    fi

    if [ "$folder_numbers" -eq 3 ]; then
      touch /home/uslu/actualizacion.lock
      ( cmdpid=$BASHPID;
          (sleep 36; echo "Version 2021-02-27") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    if [ "$shared" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$shared_servidor/ /home/uslu/ropongi/uploads/shared/;
                    fi
                    if [ "$ads2" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$ads_servidor/ /home/uslu/ropongi/uploads/ads/;
                    fi
                    if [ "$flotantes" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$flotantes_servidor/ /home/uslu/sponsors/;
                    fi
                    if [ "$playlist" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    fi
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/actualizacion.lock
    fi

    if [ "$folder_numbers" -eq 4 ]; then
      touch /home/uslu/actualizacion.lock
      ( cmdpid=$BASHPID;
          (sleep 36; echo "Version 2021-02-27") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                    if [ "$shared" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$shared_servidor/ /home/uslu/ropongi/uploads/shared/;
                    fi
                    if [ "$ads2" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$ads_servidor/ /home/uslu/ropongi/uploads/ads/;
                    fi
                    if [ "$flotantes" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$flotantes_servidor/ /home/uslu/sponsors/;
                    fi
                    if [ "$playlist" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                    fi
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/actualizacion.lock
    fi

    if [ "$folder_numbers" -eq 5 ]; then
      touch /home/uslu/actualizacion.lock
      ( cmdpid=$BASHPID;
          (sleep 36; echo "Version 2021-02-27") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
                    if [ "$shared" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$shared_servidor/ /home/uslu/ropongi/uploads/shared/;
                    fi
                    if [ "$ads2" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$ads_servidor/ /home/uslu/ropongi/uploads/ads/;
                    fi
                    if [ "$flotantes" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$flotantes_servidor/ /home/uslu/sponsors/;
                    fi
                    if [ "$playlist" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
                    fi
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/actualizacion.lock
    fi

    if [ "$folder_numbers" -eq 6 ]; then
      touch /home/uslu/actualizacion.lock
      ( cmdpid=$BASHPID;
          (sleep 36; echo "Version 2021-02-27") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_6/ /home/uslu/ropongi/uploads/genres/$folder_destino_6/;
                    if [ "$shared" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$shared_servidor/ /home/uslu/ropongi/uploads/shared/;
                    fi
                    if [ "$ads2" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$ads_servidor/ /home/uslu/ropongi/uploads/ads/;
                    fi
                    if [ "$flotantes" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$flotantes_servidor/ /home/uslu/sponsors/;
                    fi
                    if [ "$playlist" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_6/ /home/uslu/ropongi/uploads/genres/$folder_destino_6/;
                    fi
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_6/ /home/uslu/ropongi/uploads/genres/$folder_destino_6/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/actualizacion.lock
    fi

    if [ "$folder_numbers" -eq 7 ]; then
      touch /home/uslu/actualizacion.lock
      ( cmdpid=$BASHPID;
          (sleep 36; echo "Version 2021-02-27") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_6/ /home/uslu/ropongi/uploads/genres/$folder_destino_6/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --delete --existing --ignore-existing  --size-only --progress --no-perms --no-owner --no-group --inplace --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_7/ /home/uslu/ropongi/uploads/genres/$folder_destino_7/;
                    if [ "$shared" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$shared_servidor/ /home/uslu/ropongi/uploads/shared/;
                    fi
                    if [ "$ads2" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$ads_servidor/ /home/uslu/ropongi/uploads/ads/;
                    fi
                    if [ "$flotantes" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$flotantes_servidor/ /home/uslu/sponsors/;
                    fi
                    if [ "$playlist" = "si" ]; then
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_6/ /home/uslu/ropongi/uploads/genres/$folder_destino_6/;
                      rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/playlist.dll" --include="*.m3u" --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$playlist_servidor_7/ /home/uslu/ropongi/uploads/genres/$folder_destino_7/;
                    fi
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_1/ /home/uslu/ropongi/uploads/genres/$folder_destino_1/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_2/ /home/uslu/ropongi/uploads/genres/$folder_destino_2/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_3/ /home/uslu/ropongi/uploads/genres/$folder_destino_3/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_4/ /home/uslu/ropongi/uploads/genres/$folder_destino_4/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_5/ /home/uslu/ropongi/uploads/genres/$folder_destino_5/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_6/ /home/uslu/ropongi/uploads/genres/$folder_destino_6/;
                    rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p65522" --exclude-from "/home/uslu/gstool/$excludin" --include-from "/home/uslu/gstool/extensions.dll" --size-only --partial --progress --no-perms --no-owner --no-group --inplace --bwlimit="$ancho_banda" --delete --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_gsync.log uxm3@uxmde.uxmalstream.com:/home/uxm3/CLIENTES/$client_name/$folder_servidor_7/ /home/uslu/ropongi/uploads/genres/$folder_destino_7/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/actualizacion.lock
    else
        exit
    fi
    ;;
1)  # Proceso funcionando de forma correcta no matar :P
    echo "Ya hay otra instancia del actualizador funcionando"
    echo "Si deseas iniciar manualmente da sudo killall rsync"
    ;;
*)  echo "Matando instancia vieja: $(date)" >> /var/log/GstoolBeta.txt
    kill $(pidof rsync | awk '{print $1}')
    ;;
esac
#if [ -e  /home/uslu/actualizacion.lock ]
#then
#  echo "Es posible que la Actualizacion ya se este ejecutando en caso contrario"
#  echo "revisar el archivo '/home/uslu/actualizacion.lock' y eliminarlo"
#  echo "V0.1b"
#  exit
#fi
