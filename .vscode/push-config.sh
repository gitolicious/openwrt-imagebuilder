#!/bin/bash
set -e

ROOT_DIR=$(dirname $(realpath "$0"))/..

ROUTER_IP_ENV_FILE=${ROOT_DIR}/.vscode/ROUTER_IP.env
[ -f "${ROUTER_IP_ENV_FILE}" ] && source $ROUTER_IP_ENV_FILE
if [ -z "${OPENWRT_IP}" ]; then
    read -p "router IP/hostname: " OPENWRT_IP
    echo "OPENWRT_IP=$OPENWRT_IP" > $ROUTER_IP_ENV_FILE
fi

scp ${ROOT_DIR}/files/etc/config/network root@$OPENWRT_IP:/etc/config/
scp ${ROOT_DIR}/files/etc/config/wireless root@$OPENWRT_IP:/etc/config/
scp ${ROOT_DIR}/files/etc/config/system root@$OPENWRT_IP:/etc/config/
