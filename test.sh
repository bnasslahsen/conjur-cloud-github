#!/bin/bash

set -a
source ".env"
set +a

response="$(curl -k -s -w '%{http_code}' --request POST $CONJUR_URL --header 'Content-Type: application/x-www-form-urlencoded' --header "Accept-Encoding: base64" --data-urlencode "jwt=$CI_JOB_JWT")"
http_code=${response: -3}

if [[ $http_code -ne 200 ]]; then
  echo "Github Authentication failed $response"
  exit 1
else
  echo "Github Authentication successful !"
fi
