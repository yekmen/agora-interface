#!/bin/sh

[ -z "$1" ] || [ -z "$2" ] && echo "$0 [user@]hostname [dir]" >&2 && exit 1

dir="$(dirname "$0")"

current=$(date +'%s')
nb_sec=$current
[ -r "$dir/epoch" ] && read nb_sec < "$dir/epoch" && nb_sec=$(($current-$nb_sec))

tmp=/tmp/syn-$$

ssh "$1" "find '$2' -maxdepth 1 -mmin -$(($nb_sec/60))" -type f \
| while read f
do
  echo "$1:$f"
done > "$tmp"

cat $tmp

ret=0

read firstline < "$tmp"
if [ $? = 0 ] ; then
  echo "$dir"/upload-images >> "$tmp" &&
  xargs --arg-file="$tmp" scp &&
  echo $current > "$dir/epoch"
  ret=$?
fi

rm "$tmp"

exit $ret
