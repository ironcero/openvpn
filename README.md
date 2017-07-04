# OpenVPN

## Overview

This repository contains a dockerfile file to automated build. This dockerfile import from ironcero/openvpn-base-docker image to generate a new image using /var/openvpn path as volume to config OpenVPN connection.

Then you'll need a folder in your system to mount as volume in OpenVPN image. This folder needs following files:
- client.ovpn: Client Configuration File to connect to VPN. You could download this file from OpenVPN address.
- credentials: Credentials file with user/password login. This file only have two lines: first line with username and second line with password.

You could hold any certificate (.pem file) and any ssh connection config file (.ssh file) on same path.

## Run

A basic run command is: 

`docker run -d --name NAME_OF_CONTAINER -p 11122:22 --privileged --restart always -v FOLDER_WITH_CONFIGURATION_FILES:/var/openvpn ironcero/openvpn:latest`

Default root password is *root*. If you want to change this password you'll need a environment parameter called root_password. For example:

`docker run -d --name NAME_OF_CONTAINER -p 11122:22 --privileged --restart always -v FOLDER_WITH_CONFIGURATION_FILES:/var/openvpn -e root_password=mypassword ironcero/openvpn:latest`


# Usage

Your container will connect always when it start. You could connect to machine into VPN net using this container as tunnel or connecting to container with SSH Client and connecting to machine from container.

If you want to connect to any service of VPN (for example MySQL) you'll need configure your service connection with a tunnel over SSH (using openvpn docker container). If your service client hasn't option to configure a connection over SSH you could make your own tunnel. How?

Only you need to connect to container via SSH and configure a tunnel in this connection. Think that container are in vpn net and has connection to the service you need.
