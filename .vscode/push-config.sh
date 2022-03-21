#!/bin/bash
set -e

ROUTER_IP_ENV_FILE=.vscode/ROUTER_IP.env
[ -f "${ROUTER_IP_ENV_FILE}" ] && source $ROUTER_IP_ENV_FILE
if [ -z "${OPENWRT_IP}" ]; then
    read -p "router IP/hostname: " OPENWRT_IP
    echo "OPENWRT_IP=$OPENWRT_IP" > $ROUTER_IP_ENV_FILE
fi

scp files/etc/config/network root@$OPENWRT_IP:/etc/config/
scp files/etc/config/wireless root@$OPENWRT_IP:/etc/config/
scp files/etc/config/system root@$OPENWRT_IP:/etc/config/
