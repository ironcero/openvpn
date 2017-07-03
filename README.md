# openvpn
VPN Client Docker image


This repository contains a dockerfile file to automated build. This dockerfile import from ironcero/openvpn-base-docker image to generate a new image copying all necesary files to container.

These necesary files are:
- client.ovpn: Client Configuration File to connect to VPN. You could download this file from OpenVPN address.
- credentials: Credentials file with user/password login. This file only have two lines: first line with username and second line with password.
