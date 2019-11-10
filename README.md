# python-service-example
A simple example for creating a linux systemd service which is a python script

Features:
* Automatic logging with systemd
* Runs automatically at boot

How to adapt:

1. Change the **service name** (service_name="*your_service*") in all .sh files to an expressive service name
2. Adapt the **description** in my_service.service
2. Adapt the **python executable** and **script path** in my_service.service (ExecStart=*executable_path* -u *script_path*)
3. (Optional) adapt the **user** which should run your python script in my_service.service
3. change the name of the my_service.service to the **service name** set in the sh files (e.g. *your_service*.service)

How to get log/status:

Run in bash: <code>service your_service status</code>

Optional Extensions:

* Copy the python script file to a constant location (e.g. /usr/local/bin/*your_service*/) in install.sh and remove that directory in uninstall.sh
* Add a config file for your service to a constant location (e.g. /etc/*your_service*/)
