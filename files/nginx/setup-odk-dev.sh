#!/bin/bash




    DH_PATH=/etc/dh/nginx.pem

    SELFSIGN_PATH="/etc/selfsign/live/$DOMAIN"
    echo "writing fresh nginx templates..."
    cp /usr/share/odk/nginx/redirector.conf /etc/nginx/conf.d/redirector.conf
    if [ "$SSL_TYPE" = "letsencrypt" ]; then
    echo "starting nginx for letsencrypt..."
    /bin/bash /scripts/start_nginx_certbot.sh
    fi
  
    exec nginx -g "daemon off;"

