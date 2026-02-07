FROM alpine:latest

MAINTAINER Rawad Hilal <rawadhilal88@gmail.com>

COPY ./bin /usr/local/bin

RUN set -xe && \
    apk add --update --no-cache bash easy-rsa git iptables openssl openvpn && \
    ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin && \
    chmod 774 /usr/local/bin/*

# Needed by scripts
ENV OPENVPN="/etc/openvpn" \
    EASYRSA="/usr/share/easy-rsa" \
    EASYRSA_PKI="/etc/openvpn/pki" \
    EASYRSA_VARS_FILE="/etc/openvpn/vars"

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

WORKDIR /etc/openvpn
CMD ["startopenvpn"]
