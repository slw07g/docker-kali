# docker-kali

A Kali Linux docker container.

# kali-root/

The `kali-root/` folder is used to map persist scripts and tools you may create on kali with the host. This folder is mounted to `/root` in the docker container (the root user's home directory).
The `docker run` command in the `kali` script can be modified to disable this, if desired.

# Credits
This is based on [devxops/kali-docker](https://github.com/devxops/kali-docker).
