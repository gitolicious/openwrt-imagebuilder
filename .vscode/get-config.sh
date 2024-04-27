#!/bin/bash
set -e

ROOT_DIR=$(dirname $(realpath "$0"))/..

ROUTER_IP_ENV_FILE=${ROOT_DIR}/.vscode/ROUTER_IP.env
[ -f "${ROUTER_IP_ENV_FILE}" ] && source $ROUTER_IP_ENV_FILE
if [ -z "${OPENWRT_IP}" ]; then
    read -p "router IP/hostname: " OPENWRT_IP
    echo "OPENWRT_IP=$OPENWRT_IP" > $ROUTER_IP_ENV_FILE
fi

mkdir -p ${ROOT_DIR}/files/etc/config
scp root@$OPENWRT_IP:/etc/config/network ${ROOT_DIR}/files/etc/config/
scp root@$OPENWRT_IP:/etc/config/wireless ${ROOT_DIR}/files/etc/config/
scp root@$OPENWRT_IP:/etc/config/system ${ROOT_DIR}/files/etc/config/
scp root@$OPENWRT_IP:/etc/shadow ${ROOT_DIR}/files/etc/

mkdir -p ${ROOT_DIR}/files/etc/dropbear
scp root@$OPENWRT_IP:/etc/dropbear/authorized_keys ${ROOT_DIR}/files/etc/dropbear/
scp root@$OPENWRT_IP:/etc/dropbear/dropbear_ed25519_host_key ${ROOT_DIR}/files/etc/dropbear/
scp root@$OPENWRT_IP:/etc/dropbear/dropbear_rsa_host_key ${ROOT_DIR}/files/etc/dropbear/
