FROM nginx:1.26.0-alpine3.19

RUN apk add --no-cache certbot certbot-nginx

# Copy for selfsigned certificate
#COPY docker/nginx/nginx-selfsigned.crt /etc/nginx/ssl/nginx-selfsigned.crt
#COPY docker/nginx/nginx-selfsigned.key /etc/nginx/ssl/nginx-selfsigned.key

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
