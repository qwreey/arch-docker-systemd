FROM archlinux

STOPSIGNAL SIGRTMIN+3
ENV container docker

RUN --mount=type=cache,target=/var/cache/pacman pacman -Suy --noconfirm
RUN systemctl mask systemd-machine-id-commit.service
RUN sed 's/#LogLevel=info/LogLevel=warning/' -i /etc/systemd/system.conf
COPY root /

ENTRYPOINT /sbin/init quiet loglevel=3
