#!/bin/bash
# kumo-salt rpm after-remove script to be passed to fpm
# this is in erb template format

NAME=<%= name %>
PREFIX=<%= prefix %>
VERSION=<%= version %>

#logger -t ${NAME}-rpm-ar "Name: $NAME, Prefix: $PREFIX, Version: $VERSION"
rm -f /etc/init.d/helloworld

exit 0
