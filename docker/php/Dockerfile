FROM stan220/keepass-web:latest

RUN apk --no-cache add shadow

ARG HOST_UID
RUN groupmod --gid ${HOST_UID} www-data
RUN usermod --uid ${HOST_UID} --gid ${HOST_UID} www-data

WORKDIR /var/www/keepass-web

RUN rm -rf db
RUN rm .env .env.local.php

USER www-data

CMD composer dump-env prod

CMD ["php-fpm", "-F"]

EXPOSE 9000
