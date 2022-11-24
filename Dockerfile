FROM ghcr.io/linuxserver/openssh-server

ENV PUID=1000
ENV PGID=1000
ENV TZ=Europe/Zurich
ENV SUDO_ACCESS=false
ENV PASSWORD_ACCESS=false
ENV USER_NAME=tunnel
EXPOSE 2222
VOLUME /config

RUN /bin/sed -i 's/^AllowTcpForwarding no/AllowTcpForwarding yes/' /etc/ssh/sshd_config
RUN /bin/sed -i 's/^#UseDNS no/UseDNS no/' /etc/ssh/sshd_config