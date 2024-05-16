docker compose up -d --build     

openssl req -x509 -nodes -days 9999 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt

docker exec -it keepass-web-container /bin/sh
docker exec -it nginx-container /bin/sh
certbot --nginx -d pass.aliferovich.com --register-unsafely-without-email
certbot --nginx -d dev.aliferovich.com. -d www.dev.aliferovich.com. --register-unsafely-without-email
