#!/bin/bash
set -e

ROUTER_IP_ENV_FILE=.vscode/ROUTER_IP.env
[ -f "${ROUTER_IP_ENV_FILE}" ] && source $ROUTER_IP_ENV_FILE
if [ -z "${OPENWRT_IP}" ]; then
    read -p "router IP/hostname: " OPENWRT_IP
    echo "OPENWRT_IP=$OPENWRT_IP" > $ROUTER_IP_ENV_FILE
fi

export FILENAME=$(basename imagebuilder/bin/targets/ath79/generic/openwrt-*-ath79-generic-tplink_archer-c6-v2-squashfs-sysupgrade.bin)
echo $FILENAME
ssh root@$OPENWRT_IP mkdir -p /tmp/sysupgrade
scp bin/targets/ath79/generic/* root@$OPENWRT_IP:/tmp/sysupgrade
ssh root@$OPENWRT_IP 'cd /tmp/sysupgrade && sha256sum -c /tmp/sysupgrade/sha256sums'
ssh root@$OPENWRT_IP sysupgrade --force -v /tmp/sysupgrade/$FILENAME
