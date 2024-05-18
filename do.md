https://geekscircuit.com/install-docker-docker-compose-on-alpine-linux/

apk update
apk add docker docker-compose git make
rc-update add docker default
/etc/init.d/docker start

git clone https://github.com/stan220/keepass-web-bundle.git && cd "$(basename "$_" .git)"

[//]: # (docker compose up -d --build)
mkdir chmod -R 777 log/ 

[.env.local.php](.env.local.php) change user pass
[docker-compose.yaml](docker-compose.yaml) docker-compose change host

make up

https://geko.cloud/en/nginx-letsencrypt-certbot-docker-alpine/
docker exec -it nginx-container /bin/sh
certbot --nginx -d localhost --register-unsafely-without-email

0 12 * * * /usr/bin/certbot renew --quiet

echo "0 12 * * * /usr/bin/certbot renew --quiet" >> /etc/crontabs/root
rc-service crond start && rc-update add crond
