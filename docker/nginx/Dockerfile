FROM nginx:1.26.0-alpine3.19

RUN apk add --no-cache --update certbot certbot-nginx

ENV NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx

COPY docker/nginx/nginx.conf /etc/nginx/templates/nginx.conf.template
