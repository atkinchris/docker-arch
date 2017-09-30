FROM base/archlinux

RUN pacman -Syu --noconfirm \
    docker \
    git \
    make \
    && pacman -Scc

RUN mkdir -p /etc/systemd/system/docker.service.d && echo $'\
[Service]\n\
ExecStart=\n\
ExecStart=/usr/bin/dockerd -H fd:// -s overlay2\n'\
> /etc/systemd/system/docker.service.d/override.conf
