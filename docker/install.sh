#!/bin/bash -Eeu

# From frolvlad/alpine-mono
apk add --no-cache --virtual=.build-dependencies \
  ca-certificates \
  openssl \
  tar \
  wget \
  xz

# dist.nuget.org requires TLS 1.2 hence install of openssl above
wget http://dist.nuget.org/win-x86-commandline/latest/nuget.exe
wget "https://archive.archlinux.org/packages/m/mono/mono-6.4.0.198-1-x86_64.pkg.tar.xz" -O "/tmp/mono.pkg.tar.xz"
tar -xJf "/tmp/mono.pkg.tar.xz"
cert-sync /etc/ssl/certs/ca-certificates.crt
apk del .build-dependencies
rm /tmp/*
