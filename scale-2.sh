#!/bin/bash
kubectl get ns | awk '{print $1}' | while IFS= read -r line; do
  if [[ $line =~ .*-ns-.* ]]; then
    #echo "$line matched"
    echo "kubectl scale deploy -n $line --replicas=0 --all"
  else
    echo "$line NOT matched"
  fi;
  #kubectl scale deploy -n $line --replicas=1 --all
  #counter=$(($counter+1))
done