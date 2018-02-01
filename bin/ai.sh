#!/bin/bash
# rpm after-install script to be passed to fpm
# this is in erb template format

NAME=<%= name %>
PREFIX=<%= prefix %>
VERSION=<%= version %>

#logger -t ${NAME}-rpm-ai "Name: $NAME, Prefix: $PREFIX, Version: $VERSION"
# rm -f /etc/init.d/helloworld
# ln -s /opt/ruckuswireless/helloworld/HelloWorldMicroservice.jar /etc/init.d/helloworld

exit 0
