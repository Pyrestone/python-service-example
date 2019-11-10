#!/bin/bash

service_name="my_service"

#Require sudo
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "starting and enabling $service_name service..."
systemctl daemon-reload
systemctl start $service_name
systemctl enable $service_name
echo "done"

echo "$service_name service enabled sucessfully!"
