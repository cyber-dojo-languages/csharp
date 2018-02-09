#!/bin/sh
set -e

# From frolvlad/alpine-mono

apk add --no-cache --virtual=.build-dependencies wget ca-certificates tar xz
wget "https://www.archlinux.org/packages/extra/x86_64/mono/download/" -O "/tmp/mono.pkg.tar.xz"
tar -xJf "/tmp/mono.pkg.tar.xz"
cert-sync /etc/ssl/certs/ca-certificates.crt
apk del .build-dependencies
rm /tmp/*
