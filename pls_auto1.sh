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
cd /home/uslu/uxmalstream/uploads/genres/
for dir in */
do
GENRE=$(basename "$dir")
DIR_TO_CHECK="/home/uslu/uxmalstream/uploads/genres/$GENRE"
PATH_TO_EXCLUDE="/home/uslu/uxmalstream/uploads/genres/$GENRE/_playlist.m3u"

OLD_SUM_FILE="/home/uslu/gstool/db/$GENRE.txt"

if [ -e $OLD_SUM_FILE ]
then
    OLD_SUM=`cat $OLD_SUM_FILE`
else
    OLD_SUM="nothing"
fi

NEW_SUM=`find $DIR_TO_CHECK/* \! -path "$PATH_TO_EXCLUDE"  -print0| xargs -0 du -b --time --exclude=$PATH_TO_EXCLUDE | sort -k4,4 | sha1sum | awk '{print $1}'`

if [ "$OLD_SUM" != "$NEW_SUM" ]
then
    echo 'El Contenido ha cambiado generando nueva Playlist'
    sudo screen -S uxmalstream -X stuff "del playlist $GENRE^M"
    sleep 10
    sudo screen -S uxmalstream -X stuff "make random playlist $GENRE^M"
    # update the OLD_STAT_FILE
    # update old sum
    echo $NEW_SUM > $OLD_SUM_FILE
fi
done
