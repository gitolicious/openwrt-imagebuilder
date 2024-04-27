#!/bin/bash
set -e

ROOT_DIR=$(dirname $(realpath "$0"))/..

if [ -f ${ROOT_DIR}/imagebuilder/.config ]; then
    USED_VERSION=$(cat ${ROOT_DIR}/imagebuilder/.config | grep CONFIG_VERSION_REPO | sed 's/.*\/\([0-9.]*\)"/\1/')
else
    echo "Image not yet downloaded."
    USED_VERSION=${OPENWRT_VERSION}
fi

LATEST_VERSION=$(curl -sL https://api.github.com/repos/openwrt/openwrt/releases/latest | jq -r .name)

if [[ "${USED_VERSION}" != "${LATEST_VERSION#v}"  ]];then
    echo "You are not using the latest version of the OpenWRT imagebuilder."
    echo "Your version:   $USED_VERSION"
    echo "Latest version: $LATEST_VERSION"
    echo "Consider an upgrade by changing the OPENWRT_VERSION in .devcontainer/devcontainer.json"
fi
