FROM debian:stable

MAINTAINER Luca Pasquale

RUN apt-get update && apt-get -y install git
RUN apt-get -y install cron

RUN git clone https://github.com/letsencrypt/letsencrypt /letsencrypt && \
    /letsencrypt/letsencrypt-auto --help


ADD crontab /etc/cron.d/letsencrypt
RUN chmod 0755 /etc/cron.d/letsencrypt

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

ADD init.sh /init.sh
RUN chmod 0755 /init.sh

EXPOSE 80

ENTRYPOINT ["/init.sh"]
CMD ["--help"]
    
