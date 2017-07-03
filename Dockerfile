FROM ironcero/openvpn-base-docker:latest
MAINTAINER Ignacio Roncero Bazarra <ironcero@gmail.com>

# Proxy configuracion
ENV configFile client.ovpn
ENV credentialFile credentials
ENV root_password root

# Add vpn config file
ADD $configFile /root/.
ADD $credentialFile /root/.
ADD *.pem /root/.
ADD *.ssh /root/.
RUN echo root:$root_password | chpasswd

WORKDIR /root

# Run OpenVPN
CMD openvpn --config /root/$configFile --auth-user-pass /root/$credentialFile & echo root:$root_password | chpasswd & /usr/sbin/sshd -D
