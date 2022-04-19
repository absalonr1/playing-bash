## export dash
```
curl -X GET "https://app.datadoghq.com/api/v1/dash/${dash_id}?api_key=${api_key}&application_key=${app_key}" > dash2.json
```

## import  dash
```
curl -X POST -H "Content-type: application/json" -d @dash2.json "https://app.datadoghq.com/api/v1/dash?api_key=${api_key}&application_key=${app_key}"
```
## manual fixes

MOve 'graph' and 'title' elements at the same level of 'dash'