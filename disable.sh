#!/bin/bash


service_name="my_service"

#Require sudo
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "stopping and disabling $service_name service..."
systemctl daemon-reload
systemctl stop $service_name
systemctl disable $service_name
echo "done"

echo "$service_name disabled sucessfully!"
