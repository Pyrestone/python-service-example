#!/bin/bash

service_name="my_service"

#Require sudo
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "removing service..."
systemctl stop $service_name
systemctl disable $service_name
echo "done"


echo "removing service from /lib/systemd/system/..."
rm /lib/systemd/system/$service_name.service
echo "done"

echo "reloading services"
systemctl daemon-reload
echo "done"

echo "$service_name uninstalled sucessfully!"
