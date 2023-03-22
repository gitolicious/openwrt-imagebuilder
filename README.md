# openWrt image builder

This helper repo automates image builds for OpenWrt routers using [VS Code Dev Container](https://code.visualstudio.com/docs/remote/containers) and the [openWrt image builder](https://openwrt.org/docs/guide-user/additional-software/imagebuilder).

The resulting image will have all up-to-date packages in it, making package updates possible for memory restricted devices.

As an optional extra, by downloading a stable configuration and including it into the firmware image, it is an easy rollback by [resetting the device](https://openwrt.org/docs/guide-user/troubleshooting/failsafe_and_factory_reset#factory_reset) when messing things up in day-to-day configuration experiments and locking yourself out of the router.

## How to use

All tasks are defined as VS Code tasks. They can be started from the "Task Explorer"

* _get config_:
  * downloads config files from the router
  * ⚠️ make sure all your relevant config files are included in the task
  * ⚠️ this includes passwords and SSH keys - do not share them publicly
* _make image_:  
  * compiles the firmware image including the config files downloaded previously
* _perform upgrade_:
  * uploads the compiled image and installs it keeping all previous configs, except the ones included in the image
* _perform reset upgrade_:
  * uploads the compiled image and installs it overwriting all previous configs
  * ⚠️ all configurations not downloaded and included into the image will be lost 
* _push config_:
  * uploads the config files from the `files` folder separataly
  * use this to test your local config before compiling it into a firmware image

To customize the build, adapt the packages included and services enabled. Check the default packages by selecting your model at the [OpenWrt Firmware Selector](https://firmware-selector.openwrt.org/) (extend _Customize installed packages and/or first boot script_, check the list of _Installed Packages_) and copy the package list to `PACKAGES` at `.vscode/make-image.sh`.

### Examples

* Make a network switch image by disabling router-specific services: add this to `make-image.sh`

  ```sh
      DISABLED_SERVICES="\
          firewall \
          dnsmasq \
          odhcpd \
      " \
  ```