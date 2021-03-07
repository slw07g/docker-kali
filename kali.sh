#!/bin/bash
DOCKER_NAME="kali_hack"
DOCKER_TAG="kali:hack"
DOCKER_OPTS=""
docker build . -t $DOCKER_TAG

usage()
{
  cat << EOF
usage: bash ./kali.sh [-o <ovpn_file>] [-g <github_username>]
-o    | --openvpn         (optional)      OpenVPN connection profile
-g    | --github_user     (optional)      Source branch
-h    | --help                            Brings up this menu
EOF
}

while [ -n "$1" ]; do
    echo "Parsing arg ${1}"
    case $1 in
        -o | --openvpn )
            shift
	    OVPN=`eval echo $(eval echo $1)`
	    DOCKER_OPTS=" -v ${1}:/tmp/htb.ovpn $DOCKER_OPTS"
        ;;
        -g | --github_user )
            shift
            gh_user=$1
	    DOCKER_OPTS=" -e GH_USER=$gh_user -p2222:22 $DOCKER_OPTS"
	;;
        -h | --help )    usage
            exit
        ;;
        * )              usage
            exit 1
    esac
    shift
done

# Add a persistent docker volume, kali-staging
DOCKER_OPTS=" -v kali-staging:/root/staging:rw $DOCKER_OPTS"

docker run --rm --name ${DOCKER_NAME}2 -it --sysctl net.ipv6.conf.all.disable_ipv6=0 --cap-add=NET_ADMIN  $DOCKER_OPTS  $DOCKER_TAG /bin/bash
