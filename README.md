A Kali Linux docker container for HTB.

Kali Linux docker containers do not have tools pre-installed.
This installs common tools used on Kali.
More tools can be added by either modifying the Dockerfile or installing them after running accessing the bash prompt (the tools may not persist if you use the latter method).

To run the docker container, just run `kali.sh`

As this was intended for use with HackTheBox, the docker container also will attempt to connect to an OpenVPN server, if you specify the openVPN profile as the argument.

usage: bash ./kali.sh [-o <ovpn_file>] [-g <github_username>]
-o    | --openvpn         (optional)      OpenVPN connection profile
-g    | --github_user     (optional)      Github username to fetch public keys for, for SSH access
-h    | --help                            Brings up this menu
