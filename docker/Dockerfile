FROM  cyberdojofoundation/alpine_glibc
LABEL maintainer=jon@jaggersoft.com

ADD install.sh /

RUN /install.sh && \
    rm -f /install.sh
