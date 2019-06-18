FROM cyberdojofoundation/alpine_glibc
LABEL maintainer=jon@jaggersoft.com

# From frolvlad/alpine-mono
RUN \
apk add --no-cache --virtual=.build-dependencies \
  ca-certificates \
  tar \
  wget \
  xz && \
\
wget "https://archive.archlinux.org/packages/m/mono/mono-5.20.1.19-1-x86_64.pkg.tar.xz" -O "/tmp/mono.pkg.tar.xz" && \
tar -xJf "/tmp/mono.pkg.tar.xz" && \
cert-sync /etc/ssl/certs/ca-certificates.crt && \
apk del .build-dependencies && \
rm /tmp/*