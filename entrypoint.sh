#!/bin/bash

mkdir /dev/net
mknod /dev/net/tun c 10 200
HTB_VPN="/tmp/htb.ovpn"

if [ -f "$HTB_VPN" ]
then
  echo "Connecting to VPN..."
  nohup openvpn "$HTB_VPN" > /tmp/ovpn.txt & 
else
  echo "Skipping openVPN connection; no profile found"
fi

if [ -n $GH_USER ]; then
  mkdir /root/.ssh
  wget -O /root/.ssh/authorized_keys "https://github.com/${GH_USER}.keys"
  chmod -R 700 /root/.ssh
  sshconf=/etc/ssh/sshd_config
  echo "PasswordAuthentication yes" >> $sshconf
  echo "PermitRootLogin prohibit-password" >> $sshconf
  echo "Match User root" >> $sshconf
  echo "PasswordAuthentication no" >> $sshconf
  service ssh start
fi
HERE=$PWD

# Do stuff
git config --global pull.rebase false

# Return to where you were
cd "$HERE"

# Drop to a shell
/bin/bash -i
