# OpenVPN

## Overview

This repository contains a dockerfile file to automated build. This dockerfile import from ironcero/openvpn-base-docker image to generate a new image copying all necesary files to container.

These necesary files are:
- client.ovpn: Client Configuration File to connect to VPN. You could download this file from OpenVPN address.
- credentials: Credentials file with user/password login. This file only have two lines: first line with username and second line with password.

You can hold any certificate (.pem file) and any ssh connection config file (.ssh file) on same path that dockerfile and docker will copy these files to image on build process.

## Usage

A basic run command is:

`docker run -d --name NAME_OF_CONTAINER -p 11122:22 --privileged --restart always ironcero/openvpn:latest`

Default root password is *root*. If you want to change this password you'll need a environment parameter called root_password. For example:

`docker run -d --name NAME_OF_CONTAINER -p 11122:22 --privileged --restart always -e root_password=mypassword ironcero/openvpn:latest`

Your container will connect always when it start. You could connect to machine into VPN net using this container as tunnel or connecting to container with SSH Client and connecting to machine from container.
