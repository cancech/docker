#!/bin/bash

if ! id -nG "$USER" | grep -qw "docker"; then
	echo "Must be in the docker group to perform these actions"
	exit
fi

docker-compose pull
docker-compose down
docker-compose up -d
