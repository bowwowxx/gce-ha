#!/bin/bash

function slachbot(){

  payload=$(xx)
  curl -X POST --data-urlencode "$payload" https://xx
}

function response_check(){

  case $1 in
     200)
          #slachbot [$1]$2
          ;;
     *)
          slachbot [$1]$2
          ;;
esac
}

server="https://xx"

authoriz=$(curl --write-out %{http_code} --silent --output /dev/null -k -d "xx" "xx")
response_check $authoriz $server/device/login

if [ "$authoriz" != 200 ]; then { echo error;exit 1; } fi


key=$(curl -k -d "xx" "xx")

declare -a arr=("xx" "xx" "xx")

for i in "${arr[@]}"
do
   response=$(curl --write-out %{http_code} --silent --output /dev/null -k -X GET -H "xx" "xx")
   response_check $response $server$i
done
