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
