#!/bin/bash
name=$1
if [[ ! -z $name ]]; then
	echo -e "\n========================================================================================\n"
	sudo docker run -P -d -v /vagrant:/var/www:ro --name="$1" node_server
	echo "Server name - $1"
	echo -e "\n========================================================================================\n"
else
	echo "Please specify the name of the container"
	exit
fi
