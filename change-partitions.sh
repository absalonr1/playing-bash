#!/bin/sh

# Elimina todos los topicos y los crea de nuevo con solo 1 particion


noprod_env="env-npy2k"
cluster_qa="lkc-3pq52"
cluster_dev="lkc-djkvy"

env=$noprod_env
cluster=$cluster_qa

# confluent kafka topic list --cluster $cluster --environment $env 
count=0
cat topics_dev.txt | awk '{print $1}' | while IFS= read -r line; do
  count=$(( count + 1 ))
  #if [[ $count > 2 ]] 
  #then
    #echo "$line $count"
    #confluent kafka topic delete $line --cluster $cluster --environment $env
    confluent kafka topic create $line --partitions 1 --cluster $cluster --environment $env --config retention.ms=2592000000,cleanup.policy=delete,max.message.bytes=2097164,retention.bytes=-1
  #fi
  
done
