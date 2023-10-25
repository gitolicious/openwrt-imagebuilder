#!/bin/bash
set -e

make -C imagebuilder image \
    PROFILE="tplink_archer-c6-v2" \
    PACKAGES="\
        -ath10k-firmware-qca9888-ct \
        ath10k-firmware-qca9888 \
        base-files \
        busybox \
        ca-bundle \
        dnsmasq \
        dropbear \
        firewall4 \
        fstools \
        -kmod-ath10k-ct \
        kmod-ath10k \
        kmod-ath9k \
        kmod-gpio-button-hotplug \
        kmod-nft-offload \
        libc \
        libgcc \
        libustream-wolfssl \
        logd \
        luci \
        mtd \
        netifd \
        nftables \
        odhcp6c \
        odhcpd-ipv6only \
        opkg \
        ppp \
        ppp-mod-pppoe \
        procd \
        procd-seccomp \
        procd-ujail \
        swconfig \
        uboot-envtools \
        uci \
        uclient-fetch \
        urandom-seed \
        urngd \
        wpad-basic-wolfssl \
        \
        curl \
    " \
    FILES="../files"

[[ -z $(find imagebuilder/build_dir/ -iname "*-squashfs-sysupgrade.bin") ]] && (echo; echo "BUILD FAILED"; exit 1)

cat imagebuilder/bin/targets/ath79/generic/sha256sums | grep sysupgrade

echo 
echo "BUILD SUCCESS"
