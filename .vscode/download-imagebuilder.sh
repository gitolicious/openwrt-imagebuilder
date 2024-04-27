#!/bin/bash
set -e

ROOT_DIR=$(dirname $(realpath "$0"))/..
DL_DIR=${ROOT_DIR}/dl

wget --directory-prefix=${DL_DIR} https://downloads.openwrt.org/releases/${OPENWRT_VERSION}/targets/${OPENWRT_TARGET}/generic/openwrt-imagebuilder-${OPENWRT_VERSION}-${OPENWRT_TARGET}-generic.Linux-x86_64.tar.xz

tar -J -x -f ${DL_DIR}/openwrt-imagebuilder-*.tar.xz -C ${DL_DIR}
rm ${DL_DIR}/openwrt-imagebuilder-*.tar.xz

rm -rf ${ROOT_DIR}/imagebuilder
mv ${DL_DIR}/openwrt-imagebuilder-*-*-generic.Linux-x86_64 ${ROOT_DIR}/imagebuilder
bash ${ROOT_DIR}/.vscode/check-version.sh
