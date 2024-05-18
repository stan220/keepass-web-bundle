#!/bin/sh

set -e

export HOME="/home/sync"
export STHOMEDIR="/home/sync/.config"

ln -s $STHOMEDIR /var/syncthing/config
mkdir -p $HOME
chown -R sync_user $HOME

su-exec sync_user syncthing generate \
    --no-default-folder \
    --skip-port-probing \
    --gui-user=$HTTP_BASIC_AUTH_USERNAME \
    --gui-password=$HTTP_BASIC_AUTH_PASSWORD \

printf "\n Adjusting Syncthing Default Settings"
yq -i -p xml -o xml '.configuration.gui.+@sendBasicAuthPrompt = "true"' $STHOMEDIR/config.xml
yq -i -p xml -o xml '.configuration.gui.address = "0.0.0.0:8385"' $STHOMEDIR/config.xml
yq -i -p xml -o xml '.configuration.defaults.device.+@introducer = "true"' $STHOMEDIR/config.xml

#mkdir -p /home/sync/db
#chmod 777 /home/sync/db

su-exec sync_user syncthing --no-restart --reset-deltas --no-default-folder &

check-folder.sh &

wait -n
