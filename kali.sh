#!/bin/bash
DOCKER_NAME="kali_hack"
DOCKER_TAG="kali:hack"
DOCKER_OPTS=""
docker build . -t $DOCKER_TAG
if [ $# -gt 0 ]
then
  OVPN=`eval echo $(eval echo $1)`
  DOCKER_OPTS=" -v $OVPN:/tmp/htb.ovpn $DOCKER_OPTS"
fi

# Add a persistent docker volume, kali-staging
DOCKER_OPTS=" -v kali-staging:/root/staging:rw $DOCKER_OPTS"

docker run --rm --name $DOCKER_NAME -it --sysctl net.ipv6.conf.all.disable_ipv6=0 --cap-add=NET_ADMIN  $DOCKER_OPTS  $DOCKER_TAG /bin/bash
