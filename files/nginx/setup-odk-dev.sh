#!/bin/bash

DH_PATH=/etc/dh/nginx.pem
if [ "$SSL_TYPE" != "upstream" ] && [ ! -s "$DH_PATH" ]; then
  openssl dhparam -out "$DH_PATH" 2048
fi

SELFSIGN_PATH="/etc/selfsign/live/$DOMAIN"

echo "writing fresh nginx templates..."
cp /usr/share/odk/nginx/redirector.conf /etc/nginx/conf.d/redirector.conf
CNAME=$( [ "$SSL_TYPE" = "customssl" ] && echo "local" || echo "$DOMAIN") \
nvsubst '$SSL_TYPE $CNAME $SENTRY_ORG_SUBDOMAIN $SENTRY_KEY $SENTRY_PROJECT' \
< /usr/share/odk/nginx/odk.conf.template \
> /etc/nginx/conf.d/odk.conf

if [ "$SSL_TYPE" = "letsencrypt" ]; then
echo "starting nginx for letsencrypt para desarrolladores..."
echo "dev EdwinGarcia"
/bin/bash /scripts/start_nginx_certbot.sh
fi
exec nginx -g "daemon off;"
  
    

