#!/bin/bash
# kumo-salt rpm before-install script to be passed to fpm
# this is in erb template format

NAME=<%= name %>
PREFIX=<%= prefix %>
VERSION=<%= version %>

#logger -t ${NAME}-rpm-bi "Name: $NAME, Prefix: $PREFIX, Version: $VERSION"

exit 0
