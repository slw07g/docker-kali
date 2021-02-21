#!/bin/bash
HTB_VPN="$HOME/Downloads/htb.ovpn"
DOCKER_TAG="kali:hack"
DOCKER_OPTS=""
docker build . -t $DOCKER_TAG
if [ $# -gt 0 ]
then
  OVPN=`eval echo $(eval echo $1)`
  DOCKER_OPTS=" -v $OVPN:/tmp/htb.ovpn $DOCKER_OPTS"
fi

docker run -it --sysctl net.ipv6.conf.all.disable_ipv6=0 --cap-add=NET_ADMIN  $DOCKER_OPTS  $DOCKER_TAG /bin/bash
