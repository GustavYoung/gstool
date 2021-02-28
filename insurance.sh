#!/bin/bash
#copyright 2017 Gustavo Santana
#
#
#
#
#
#
#
#
#!/bin/bash
x=`ping -c1 google.com 2>&1 | grep unknown`
if [ ! "$x" = "" ]; then
        echo "30 dias sin internet, Purgando!!!!!!!."
        sudo screen -S uxmalstream -X stuff "add genres corton^M"
        sleep 10
        sudo screen -S uxmalstream -X stuff "set taskgenres monday corton^M"
        sleep 10
        sudo screen -S uxmalstream -X stuff "set taskgenres tuesday corton^M"
        sleep 10
        sudo screen -S uxmalstream -X stuff "set taskgenres wednesday corton^M"
        sleep 10
        sudo screen -S uxmalstream -X stuff "set taskgenres thursday corton^M"
        sleep 10
        sudo screen -S uxmalstream -X stuff "set taskgenres friday corton^M"
        sleep 10
        sudo screen -S uxmalstream -X stuff "set taskgenres saturday corton^M"
        sleep 10
        sudo screen -S uxmalstream -X stuff "set taskgenres sunday corton^M"
        sleep 10
fi
done
