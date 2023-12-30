# Checks for active connections on ssh and Project Zomboid
# If no connections are found, shut down the server

ssh_ESTABLISHED=$(netstat | grep :ssh | grep ESTABLISHED)

if [[ -n $ssh_ESTABLISHED ]]; then
    exit 0
fi


port_16262=$(timeout 300 tcpdump -c 1 port 16262 2>/dev/null)

if [[ -z $port_16262 ]]; then
    systemctl stop zomboid.service
    shutdown
fi
