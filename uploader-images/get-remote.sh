#!/bin/sh

[ -z "$1" ] || [ -z "$2" ] && echo "$0 [user@]hostname [dir]" >&2 && exit 1

dir="$(dirname "$0")"

nb_sec=0
[ -r "$dir/epoch" ] && read nb_sec < "$dir/epoch"

current=$(date +'%s')

tmp=/tmp/$$-$RAND

ssh "$1" "find '$2' -maxdepth 1 -mmin -$(($nb_sec/60)) -mmin +$(($current/60))" -type f \
| while read f
do
  echo "$1:$f"
done > "$tmp" && echo "$dir/"upload-images >> "$tmp" || exit 3

xargs --arg-file="$tmp" scp &&
echo $current > "$dir/epoch"

ret=$?

rm "$tmp"

exit $ret
