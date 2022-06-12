#!/bin/bash
kubectl get ns --no-headers=true | awk '{print $1}' |  while IFS= read -r line; do
  if [[ $line =~ .*-ns-.* ]]; then
    
    kubectl get deployment -n $line --no-headers=true | awk '{print $1}' | while IFS= read -r deploy; do
      kubectl scale deployment $deploy -n $line --replicas=0 --all
    done
  else
    echo "$line NOT matched"
  fi;
  #kubectl scale deploy -n $line --replicas=1 --all
  #counter=$(($counter+1))
done