#!/bin/bash
kubectl get ns --no-headers=true | awk '{print $1}' | while IFS= read -r line; do
  if [[ $line =~ .*-ns-.* ]]; then
    echo "Ingress de ns: $line:"
    kubectl get ingress -n $line --no-headers=true | awk '{print $1}' | while IFS= read -r innerline; do
      echo "\t$innerline"
      echo "kubectl -n $line annotate $innerline alb.ingress.kubernetes.io/group.order-"
    done
  else
    echo "$line NOT matched"
  fi;
  #kubectl scale deploy -n $line --replicas=1 --all
  #counter=$(($counter+1))
done