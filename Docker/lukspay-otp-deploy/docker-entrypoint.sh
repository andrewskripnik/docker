#!/bin/bash

if [[ -z $ARTIFACT_URL ]]; then
	ARTIFACT_URL=https://nexus3.lukspay.com/repository/lukspay/com/gtm/lukspay/lukspay-amazone-sender/1.0.0/lukspay-amazone-sender-1.0.0.tar
fi

cd /opt/app-root/

curl $ARTIFACT_URL -o /opt/app-root/lukspay-amazone-sender.tar

tar -xvf /opt/app-root/lukspay-amazone-sender.tar -C /opt/app-root/
/opt/app-root/lukspay-amazone-sender-1.0.0/bin/lukspay-amazone-sender

#exec $@
