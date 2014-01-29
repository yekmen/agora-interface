#!/bin/sh

[ -z "$1" ] && echo "$0 [user@]hostname" >&2 && exit 1

dir="$(dirname "$0")"

nb_sec=0
[ -r "$dir/epoch" ] && read nb_sec < "$dir/epoch"

current=$(date +'%s')

ssh "$1" "find -maxdepth 1 -mmin -$(($nb_sec/60)) -mmin +$(($current/60))" \
| while read f
do
	#recuperer le fichier distant
	scp "$1:$f" "$dir/"image-uploader/
done

echo $current > "$dir/epoch"
