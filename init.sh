#!/bin/bash

cd /
if [ ! -d /etc/letsencrypt/live ]; then
    certbot certonly --standalone --preferred-challenges http --no-self-upgrade $@
fi

mkdir -p /var/log/letsencrypt/
touch /var/log/letsencrypt/letsencrypt.log

cron && tail -f /var/log/letsencrypt/letsencrypt.log
