#!/bin/bash
if [ -f data.file ]; then rm data.file; fi
now=$(date +%s)
yesterday=$(date -d "yesterday" +%s)
for timestamp in $(seq $yesterday 60 $now); do
  echo "http $(($RANDOM % 10)) $timestamp" >> data.file
done
tail data.file
