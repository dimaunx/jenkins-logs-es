#!/bin/bash

set -euo pipefail

kibana_api=http://kibana:5601

default_index="/tmp/default_index.json"
cat > ${default_index} << EOF
{
  "attributes": {
    "title": "logstash-*",
    "timeFieldName": "@timestamp"
  }
}
EOF

while [[ "$(curl -s -o /dev/null -w '%{http_code}' ${kibana_api}/status)" != "200" ]]; do
    echo Still waiting for ${kibana_api} to be available...
    sleep 5
done

until curl -X POST "${kibana_api}/api/saved_objects/index-pattern/logstash" -H "Content-Type: application/json" -H "kbn-xsrf: true" -d@${default_index}
do
    sleep 2
    echo Retrying default index patern creation...
done
rm -f ${default_index}