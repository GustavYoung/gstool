#!/bin/bash
# Actualizacion dummy realtime.
# Version Alpha 0.2 bugfix 015
#FOR YOUR EYES ONLY CODE PENDING OF APLYING LICENSE PROTECTION
#Copyright 2017 Gustavo Santana
#For internal use only
#
#bugs? contact at gus.santana(at)icloud.com
currsh=$0
currpid=$$
runpid=$(lsof -t $currsh| paste -s -d " ")
if [[ $runpid == $currpid ]]
then
        touch /home/uslu/realtime.lock
          ((sleep 3; echo "Ram OK") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p3113" --exclude "*.m3u" --include-from "/home/uslu/gstool/extensions.dll" --partial --bwlimit=1000 --delete --progress --log-file=/home/uslu/gstool/updatelogs/$(date +%Y%m%d)_realt.log uxmal-ftp@uxm3.uxmalstream.com:/home/uxm-giornale/ftp/ /home/uslu/gsign/imgs/dia/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/realtime.lock
      exit;
else
    echo -e "\nPID($runpid)($currpid) ::: At least one of \"$currsh\" is running !!!\n"
    false
    exit 1
fi
