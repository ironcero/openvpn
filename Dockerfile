FROM ironcero/openvpn-base-docker:latest
MAINTAINER Ignacio Roncero Bazarra <ironcero@gmail.com>

# Proxy configuracion
ENV configFile client.ovpn
ENV credentialFile credentials
ENV root_password root

# Add vpn config file
RUN mkdir /var/openvpn

VOLUME ["/var/openvpn"]


WORKDIR /var/openvpn

# Run OpenVPN
CMD echo root:$root_password | chpasswd & openvpn --config /var/openvpn/$configFile --auth-user-pass /var/openvpn/$credentialFile & /usr/sbin/sshd -D
