#from ubuntu:20.04
from kalilinux/kali:latest
RUN export DEBIAN_FRONTEND=noninteractive && \
  dpkg --add-architecture i386 && \
  apt update && \
  apt upgrade -y && \
  apt install -y \
    build-essential \
    curl \
    file \
    inetutils-ping \
    procps \
    software-properties-common \
    wine \
    wine32 && \
  ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime 
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt install -y \
    exploitdb \
    git-core \
    kali-tools-top10 \
    ncat \
    netcat \
    openvpn \ 
    python3-pip \
    smbclient \
    tcpdump \
    tmux \
    unrar \
    vim &&\
  pip3 install pycryptodome && \
  mkdir /dev/net && \ 
  mknod /dev/net/tun c 10 200
#RUN git clone https://github.com/offensive-security/exploitdb.git /opt/exploit-database && \
#    ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit && \
#    cp -n /opt/exploit-database/.searchsploit_rc ~/     
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
