#!/bin/bash

if [[ -z $ARTIFACT_URL ]]; then
	ARTIFACT_URL=https://nexus3.lukspay.com/repository/lukspay/com/gtm/lukspay/lukspay-amazone-sender/1.0.0/lukspay-amazone-sender-1.0.0.jar
fi

curl $ARTIFACT_URL -o /opt/app-root/lukspay-amazone-sender.jar

java -jar /opt/app-root/lukspay-amazone-sender.jar

exec $@
