#!/bin/bash
#-a

while read directory
do
    rsync -v -R -r -d --delete --progress --exclude 'Fate Stay Night Unlimited Blade Works.mkv' -e ssh ahmed@tifa:$directory /mnt/tifa/
done < rsync-directories.conf
