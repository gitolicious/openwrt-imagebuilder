#!/bin/bash
set -e

USED_VERSION=$(cat imagebuilder/.config | grep CONFIG_VERSION_REPO | sed 's/.*\/\([0-9.]*\)"/\1/')
LATEST_VERSION=$(curl -sL https://api.github.com/repos/openwrt/openwrt/releases/latest | jq -r .name)
if [[ "${USED_VERSION}" != "${LATEST_VERSION#v}"  ]];then
    echo "You are not using the latest version of the OpenWRT imagebuilder."
    echo "Your version:   $USED_VERSION"
    echo "Latest version: $LATEST_VERSION"
    echo "Consider an upgrade by changing the OPENWRT_VERSION in .devcontainer/devcontainer.json"
fi
