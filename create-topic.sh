#!/bin/sh

while IFS="" read -r p || [ -n "$p" ]
do
  #printf '%s\n' "$p"
  ccloud kafka topic create $p --partitions 3 --environment env-k21yg --cluster lkc-w85zw --config retention.ms=2592000000,cleanup.policy=delete,max.message.bytes=2097164,retention.bytes=-1
done < topics.txt
