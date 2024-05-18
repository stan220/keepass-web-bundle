FROM syncthing/syncthing:1.27.7 AS build

#USER root
RUN apk add --no-cache yq tini inotify-tools && \
    rm -rf /var/cache/apk/*

RUN adduser --disabled-password -h /home/sync sync_user

RUN mkdir -p /home/sync/data
RUN mkdir -p /home/sync/db
RUN mkdir -p /home/sync/config
RUN #chown 1000:1000 -R /var/syncthing

COPY docker/syncthing/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY docker/syncthing/check-folder.sh /usr/local/bin/check-folder.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/check-folder.sh

ENV STHOMEDIR=/home/sync/config
ENV STGUIADDRESS=0.0.0.0:8385

ENV HOME="/home/sync"
ENV STHOMEDIR="/home/sync/.config"

EXPOSE 8385/tcp
EXPOSE 8385/udp

EXPOSE 22000/tcp
EXPOSE 22000/udp
EXPOSE 21027/udp

WORKDIR /home/sync

ENTRYPOINT ["tini"]

CMD ["entrypoint.sh"]

HEALTHCHECK --interval=1m \
  CMD curl -fkLsS -m 2 127.0.0.1:8385/rest/noauth/health | grep -o --color=never OK && ping -c 1 1.1.1.1 1>/dev/null || exit 1
