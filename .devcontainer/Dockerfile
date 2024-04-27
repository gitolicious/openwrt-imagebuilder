# See here for image contents: https://github.com/devcontainers/images/blob/main/src/python/.devcontainer/Dockerfile

# [Choice] Python version (use -bookworm or -bullseye variants on local arm64/Apple Silicon): 3, 3.12, 3.11, 3.10, 3.9, 3.8, 3-bookworm, 3.12-bookworm, 3.11-bookworm, 3.10-bookworm, 3.9-bookworm, 3.8-bookworm, 3-bullseye, 3.12-bullseye, 3.11-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3-buster, 3.12-buster, 3.11-buster, 3.10-buster, 3.9-buster, 3.8-buster
ARG VARIANT="3-bookworm"
FROM mcr.microsoft.com/devcontainers/python:1-${VARIANT}

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
# COPY requirements.txt /tmp/pip-tmp/
# RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#    && rm -rf /tmp/pip-tmp

# [Optional] Uncomment this section to install additional OS packages.
 RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
     apt-get -y install --no-install-recommends \
            build-essential \
            libncurses5-dev \
            libncursesw5-dev \
            zlib1g-dev \
            gawk \
            git \
            gettext \
            libssl-dev \
            xsltproc \
            rsync \
            wget \
            unzip \
            python3

ARG OPENWRT_VERSION
ARG OPENWRT_TARGET

ENV OPENWRT_VERSION=$OPENWRT_VERSION
ENV OPENWRT_TARGET=$OPENWRT_TARGET
 
RUN su vscode -c " \
        cd ~ && \
        wget https://downloads.openwrt.org/releases/${OPENWRT_VERSION}/targets/${OPENWRT_TARGET}/generic/openwrt-imagebuilder-${OPENWRT_VERSION}-${OPENWRT_TARGET}-generic.Linux-x86_64.tar.xz && \
        tar -J -x -f openwrt-imagebuilder-*.tar.xz && \
        rm openwrt-imagebuilder-*.tar.xz \
    "
