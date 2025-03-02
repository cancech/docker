#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "Illegal usage: create.sh <url> <token> <runner-name>"
	exit
fi

docker build --build-arg URL=$1 --build-arg TOKEN=$2 --build-arg NAME=$3 -t $3 . && docker run -d --restart=always --name $3 $3
