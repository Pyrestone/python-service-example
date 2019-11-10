#!/bin/bash

service_name="my_service"

#Require sudo
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "adding service to /lib/systemd/system/..."
cp ${service_name}.service /lib/systemd/system/
chmod 644 /lib/systemd/system/$service_name.service
echo "done"

echo "starting and enabling $service_name service..."
systemctl daemon-reload
systemctl start $service_name
systemctl enable $service_name
echo "done"

echo "$service_name installed sucessfully!"
