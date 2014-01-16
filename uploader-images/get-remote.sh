#!/bin/sh

# pre code pour la mise à jour à distance

#sur le pc distant à rediriger vers le pc local (avec ssh ?)
read nb_sec < "$fichier_epoch"

current=$(date +'%s')

find -maxdepth 1 -mmin -$(($nb_sec/60)) -mmin +$(($current/60)) \
| while read f
do
	#recuperer le fichier distant
	ssh-cp "$f" image-uploader/
done

echo $current > "$fichier_epoch"
