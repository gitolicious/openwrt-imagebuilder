#!/bin/bash
set -e

make -C imagebuilder image \
    PROFILE="tplink_archer-c6-v2" \
    PACKAGES="\
        ath10k-firmware-qca9888-ct \
        base-files \
        busybox \
        ca-bundle \
        dnsmasq \
        dropbear \
        firewall \
        fstools \
        ip6tables \
        iptables \
        kmod-ath10k-ct \
        kmod-ath9k \
        kmod-gpio-button-hotplug \
        kmod-ipt-offload \
        libc \
        libgcc \
        libustream-wolfssl \
        logd \
        luci \
        mtd \
        netifd \
        odhcp6c \
        odhcpd-ipv6only \
        opkg \
        ppp \
        ppp-mod-pppoe \
        procd \
        swconfig \
        uboot-envtools \
        ucert \
        uci \
        uclient-fetch \
        urandom-seed \
        urngd \
        wpad-basic-wolfssl \
        \
        mikrotik-btest \
    " \
    FILES="../files"
cat imagebuilder/bin/targets/ath79/generic/sha256sums | grep sysupgrade
