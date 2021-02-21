A Kali Linux docker container for HTB.

Kali Linux docker containers do not have tools pre-installed.
This installs common tools used on Kali.
More tools can be added by either modifying the Dockerfile or installing them after running accessing the bash prompt (the tools may not persist if you use the latter method).

To run the docker container, just run `kali.sh`

As this was intended for use with HackTheBox, the docker container also will attempt to connect to an OpenVPN server, if you specify the openVPN profile as the argument.

For example, `kali.sh htb.ovpn`
