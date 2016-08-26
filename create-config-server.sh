#!/usr/bin/env bash

echo -n "Creating Config Server..."
{
  cf create-service -c '{ "git": { "uri": "https://github.com/papicella/PasApplesConfig", "label": "master"  } }' p-config-server standard config-server-pas
} &> /dev/null
until [ `cf service config-server-pas | grep -c "succeeded"` -eq 1  ]
do
  echo -n "."
done
echo
echo "Config Server created....."