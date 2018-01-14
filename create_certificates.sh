#!/bin/sh

/usr/local/bin/certbot -n -m $EMAIL_ADDRESS --agree-tos certonly $CERTBOT_ARGS --webroot --webroot-path /webroot -d $PROXY_DOMAINS
echo -e "POST /containers/$PROXY_CONTAINER_NAME/kill?signal=SIGQUIT HTTP/1.0\r\n" |nc -U /var/run/docker.sock
