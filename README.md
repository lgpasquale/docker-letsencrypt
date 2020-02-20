This image creates and renews letsencrypt ssl certificates.

The whole directory /etc/letsencrypt needs to be mounted as a volume (and be empty the first time the container is run)

```
docker run -d --restart=always \
    --name letsencrypt \
    -p 80:80 \
    -v /opt/letsencrypt/etc/letsencrypt/:/etc/letsencrypt \
    lgpasquale/letsencrypt \
    -m your.email@whatever.com
    -d subdomain1.domain1.com -d subdomain2.domain2.com
```
Make sure port 80 is correctly forwared to the container from all required domains
