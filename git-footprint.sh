#!/bin/sh

insertions=0
deletions=0

while read line
do
  insertion="$(cut -d' ' -f4 <<< $line)"
  let insertions+=${insertion:-0}

  deletion="$(cut -d' ' -f6 <<< $line)"
  let deletions+=${deletion:-0}
done

echo "$insertions insertions, $deletions deletions"
