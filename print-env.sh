#!/bin/bash
env | while IFS= read -r line; do
  value=${line#*=}
  name=${line%%=*}
  echo "$name:$value" >> env-vars.txt
done

