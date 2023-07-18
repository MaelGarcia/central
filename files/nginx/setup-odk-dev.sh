#!/bin/bash




    # remove letsencrypt challenge reply, but keep 80 to 443 redirection
    perl -i -ne 'print if $. < 7 || $. > 14' /etc/nginx/conf.d/redirector.conf
    echo "starting nginx for custom ssl and self-signed certs..."
  
    exec nginx -g "daemon off;"

