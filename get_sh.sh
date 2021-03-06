#!/bin/bash

### Script Name: get_sh.sh
### Author: Massimiliano Aquino
### Last update: 16.05.2017
### Description: This script gets all server hardware (name and uris)

### Recupero gli sh
get_sh() {
  curl -s -k --request GET \
    --url https://${OVIP}/rest/server-hardware \
    --header 'accept: application/json' \
    --header "auth: $ID" \
    --header 'cache-control: no-cache' \
    --header 'content-type: application/json' \
    --header 'x-api-version: 300' | jq '.members[] | "\(.name): \(.uri)"' | sed -e 's/,//' -e 's/ /_/g' -e 's/"//g' -e 's/:_/: /g'
}

### Main

### OneView Synergy Appliance credentials
. ./oneview_config.sh

### Nota!
### Se si utilizza x-api-version 300, il sessionID e' nel field 6.
### Se non si utilzza x-api-version, il sessionID e' nel field 4
ID=$( curl -s -i -k --request POST \
  --url https://${OVIP}/rest/login-sessions \
  --header 'accept: application/json' \
  --header 'accept-language: en-us' \
  --header 'cache-control: no-cache' \
  --header 'content-type: application/json' \
  --header 'x-api-version: 300' \
  --data '{ "userName": "'${OVU}'",  "password": "'${OVPW}'"}' | grep "sessionID" | cut -d '"' -f6 )

###echo -e "sessionID:\t$ID"

echo "### Server Hardware"
get_sh
echo -e "\n"
