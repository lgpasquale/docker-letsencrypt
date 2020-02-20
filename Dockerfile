FROM debian:buster

MAINTAINER Luca Pasquale

RUN apt-get update && apt-get -y install cron certbot

# Disable log rotation, so that we can tail one logfile in init.sh
RUN mkdir -p /root/.config/letsencrypt
RUN echo "max-log-backups = 0" > /root/.config/letsencrypt/cli.ini

COPY init.sh /init.sh
RUN chmod 0755 /init.sh

EXPOSE 80

ENTRYPOINT ["/init.sh"]
CMD ["--help"]

