FROM debian:stable

MAINTAINER Luca Pasquale

RUN apt-get update && apt-get -y install cron certbot

ADD crontab /etc/cron.d/letsencrypt
RUN chmod 0755 /etc/cron.d/letsencrypt

# Create the log file to be able to run tail
RUN touch /var/log/letsencrypt-cron.log

ADD init.sh /init.sh
RUN chmod 0755 /init.sh

EXPOSE 80

ENTRYPOINT ["/init.sh"]
CMD ["--help"]

