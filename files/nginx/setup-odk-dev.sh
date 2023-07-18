#!/bin/bash




    DH_PATH=/etc/dh/nginx.pem
    echo "writing fresh nginx templates..."
    cp /usr/share/odk/nginx/redirector.conf /etc/nginx/conf.d/redirector.conf
    # remove letsencrypt challenge reply, but keep 80 to 443 redirection
    perl -i -ne 'print if $. < 7 || $. > 14' /etc/nginx/conf.d/redirector.conf
    echo "starting nginx for custom ssl and self-signed certs..."
  
    exec nginx -g "daemon off;"

