set -e

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

echo "Install SteamCMD"
echo steam steam/license note '' | debconf-set-selections
echo steam steam/question select 'I AGREE' | debconf-set-selections
add-apt-repository -y multiverse
dpkg --add-architecture i386
apt update
NEEDRESTART_MODE=a apt install -y steamcmd

echo "Install Project Zomboid dedicated server"
mkdir -p /opt/pzserver
/usr/games/steamcmd +runscript $PWD/update_zomboid.txt

echo "Enable zomboid.service"
cp zomboid.service /usr/lib/systemd/system/zomboid.service
cp zomboid.socket /usr/lib/systemd/system/zomboid.socket
systemctl enable zomboid.service --now

echo "Set up auto shutdown script"
NEEDRESTART_MODE=a apt install -y net-tools
cp auto_shutdown.sh /opt/auto_shutdown.sh
cp cron /etc/cron.d/cron
