#!/bin/bash
set -e

ROUTER_IP_ENV_FILE=.vscode/ROUTER_IP.env
[ -f "${ROUTER_IP_ENV_FILE}" ] && source $ROUTER_IP_ENV_FILE
if [ -z "${OPENWRT_IP}" ]; then
    read -p "router IP/hostname: " OPENWRT_IP
    echo "OPENWRT_IP=$OPENWRT_IP" > $ROUTER_IP_ENV_FILE
fi

mkdir -p files/etc/config
scp root@$OPENWRT_IP:/etc/config/network files/etc/config/
scp root@$OPENWRT_IP:/etc/config/wireless files/etc/config/
scp root@$OPENWRT_IP:/etc/config/system files/etc/config/
scp root@$OPENWRT_IP:/etc/shadow files/etc/

mkdir -p files/etc/dropbear
scp root@$OPENWRT_IP:/etc/dropbear/authorized_keys files/etc/dropbear/
scp root@$OPENWRT_IP:/etc/dropbear/dropbear_ed25519_host_key files/etc/dropbear/
scp root@$OPENWRT_IP:/etc/dropbear/dropbear_rsa_host_key files/etc/dropbear/
