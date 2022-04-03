#!/bin/bash
env | while IFS= read -r line; do
# ${parameter#pattern} Searches from front to back parameter until the first occurrence of pattern is found and deletes the result.
  value=${line#*=}
  # ${parameter%%pattern} Searches from back to front of parameter until the last occurrence of pattern is found and deletes the result.
  name=${line%%=*}
  echo "$name:$value" >> env-vars.txt
done

