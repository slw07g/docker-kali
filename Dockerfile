FROM  kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && apt install -y ca-certificates apt-transport-https
RUN apt-get update && apt-get upgrade -yq && \
    apt-get install -y \
    nano \
    gnupg2 \
    iputils-ping traceroute dnsutils telnet whois curl netcat-traditional net-tools iproute2 \
    nmap \
    dnsrecon \
    theharvester \
    siege \
    gobuster \
    speedtest-cli \
    mariadb-client postgresql-client redis-tools \ 
    less \
    vim \
    tmux \
    smbclient \
    ftp \
    chromium \
    kali-linux-default 

# Metasploit
#RUN curl -s https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
#  chmod 755 msfinstall && \
#  ./msfinstall && \
#  rm msfinstall

RUN apt install -y \ 
    openvpn \
    wget \
    seclists \
    zaproxy \
    firefox-esr \
    && \
    mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200 && \
    chmod 600 /dev/net/tun


# Custom scripts
COPY scripts/myip /usr/local/bin/myip

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
