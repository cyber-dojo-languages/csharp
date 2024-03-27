#!/bin/bash -Eeu

# From frolvlad/alpine-mono
apk add --no-cache --virtual=.build-dependencies \
  ca-certificates \
  openssl \
  tar \
  wget \
  zstd

# dist.nuget.org requires TLS 1.2 hence install of openssl above
wget http://dist.nuget.org/win-x86-commandline/latest/nuget.exe
wget "https://archive.archlinux.org/packages/m/mono/mono-6.12.0.206-1-x86_64.pkg.tar.zst" -O "/tmp/mono.pkg.tar.zst"
tar -xaf "/tmp/mono.pkg.tar.zst"
cert-sync /etc/ssl/certs/ca-certificates.crt
apk del .build-dependencies
rm /tmp/*
