https://geekscircuit.com/install-docker-docker-compose-on-alpine-linux/

apk update
apk add docker docker-compose git
rc-update add docker default
/etc/init.d/docker start

git clone https://github.com/stan220/keepass-web-bundle.git && cd "$(basename "$_" .git)"

docker compose up -d --build
