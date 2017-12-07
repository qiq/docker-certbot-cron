#!/bin/sh

CRONJOB=/etc/periodic/daily/renew_certificates
echo -e "#!/bin/sh\n/usr/local/bin/certbot -n renew $CERTBOT_ARGS --deploy-hook 'echo -e \"POST /containers/$PROXY_CONTAINER_NAME/kill?signal=SIGHUP HTTP/1.0\r\n\" |nc -U /tmp/docker.sock'" >$CRONJOB
chmod a+x $CRONJOB

exec crond -f -d 0
