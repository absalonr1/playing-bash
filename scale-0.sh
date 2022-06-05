#!/bin/bash
kubectl get ns | awk '{print $1}' | while IFS= read -r line; do
  echo "$line"
  #kubectl scale deploy -n $line --replicas=0 --all
  #counter=$(($counter+1))
done
