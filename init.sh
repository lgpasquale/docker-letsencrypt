#!/bin/bash

cd /letsencrypt
if [ ! -d /etc/letsencrypt/live ]; then
    ./letsencrypt-auto certonly --standalone --standalone-supported-challenges http-01 $@
fi

cron && tail -f /var/log/letsencrypt-cron.log
