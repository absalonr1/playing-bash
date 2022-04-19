#!/bin/bash
rm services.json
rm names.txt
rm sub-json.json
rm formulas.json

curl  http://localhost:8001/services > services.json
jq -r '.data[].name' services.json > names.txt
counter=1
cat names.txt | while IFS= read -r line; do
  echo "{\"formula\": \"query$counter\"}," >> formulas.json
  echo "{\"query\": \"avg:kong.http.status.count{service:$line,code:20*}.as_count()\",\"data_source\": \"metrics\",\"name\": \"query$counter\"}," >> sub-json.json
  counter=$(($counter+1))
done
