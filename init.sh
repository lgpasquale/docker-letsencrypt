#!/bin/bash

cd /
until certbot certonly --standalone --preferred-challenges http --no-self-upgrade -n --agree-tos $@
do
    echo "Retrying in 60 seconds..."
    sleep 60
done

mkdir -p /var/log/letsencrypt/
touch /var/log/letsencrypt/letsencrypt.log

echo "Running cron..."
cron && tail -f /var/log/letsencrypt/letsencrypt.log
