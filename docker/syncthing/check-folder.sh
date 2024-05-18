while ! eval "curl --silent --fail localhost:8385/rest/noauth/health &>/dev/null"; do
    sleep 1
done

if ! eval "su-exec sync_user syncthing cli config folders list | grep -q my"
then
    eval "su-exec sync_user syncthing cli config folders add --id my --path /home/sync/db"
fi


while true ; do
    sleep 60
done
