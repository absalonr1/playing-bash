#!/bin/bash

# verifica si existe ingress y obtiene correlativo (group.order + 1)
GROUP_ORDER="0"
INGRESS_NAME="ingress-container-notification"
NAMESPACE="dev-ns-containers"
EXISTE_INGRESS=$(kubectl get ingress -n $NAMESPACE -o json | jq -r ".items[] | select(.metadata.name == \"$INGRESS_NAME\") | .metadata.name")

echo "\$(kubectl get ingress -n $NAMESPACE -o json | jq -r \".items[] | select(.metadata.name == \\\"$INGRESS_NAME\\\") | .metadata.name\")"

if [[ ${#EXISTE_INGRESS} > 0 ]]
then  
	echo "Si existia $INGRESS_NAME" 
	GROUP_ORDER=$(kubectl get ingress -n $NAMESPACE -o json | jq -r ".items[] | select(.metadata.name == \"$INGRESS_NAME\")  |.metadata.annotations.\"alb.ingress.kubernetes.io/group.order\"" )

	GROUP_ORDER="$(($GROUP_ORDER+1))"

else 
	echo "No existia $INGRESS_NAME" 
	GROUP_ORDER="1"
fi

echo "GROUP_ORDER: $GROUP_ORDER"

#ingress name:  'ingress-${{ github.event.repository.name }}${{ inputs.suffix }}'
#namespace:  ${{ steps.get-prefix.outputs.prefix }}${{ inputs.namespace }}
