FROM stan220/keepass-web:latest

WORKDIR /var/www/keepass-web

RUN rm -rf db
RUN rm /var/www/keepass-web/.env
RUN rm /var/www/keepass-web/.env.local.php

COPY .env.local.php /var/www/keepass-web/.env.local.php
