#!/bin/bash

DH_PATH=/etc/dh/nginx.pem
if [ "$SSL_TYPE" != "upstream" ] && [ ! -s "$DH_PATH" ]; then
  openssl dhparam -out "$DH_PATH" 2048
fi

echo "writing fresh nginx templates..."
cp /usr/share/odk/nginx/redirector.conf /etc/nginx/conf.d/redirector.conf


if [ "$SSL_TYPE" = "letsencrypt" ]; then
  echo "starting nginx for letsencrypt mode developt..."
  echo "by EdwinGarcia"
  /bin/bash /scripts/start_nginx_certbot.sh
  exec nginx -g "daemon off;"
fi
  
    

