# Buildroot tree for Mango Pi MQ-Pro

This device tree is quite minimal as my main goal was to have a linux device with wifi and working gpio.

Resources used in this tree
- Upstream Linux and OpenSBI
- [smaeul's U-Boot fork](https://github.com/smaeul/u-boot)
- [amazingfate's rtl8723ds patches](https://github.com/amazingfate/rtl8723ds)

### Build instructions

This repo contains buildroot as a submodule so make sure initialize submodules
```sh
git clone --recurse-submodules git@github.com:pikami/mangopi-mqpro-buildroot.git
```

Build file system image
```sh
source build-env
cd buildroot
cp $BR2_EXTERNAL/configs/mqpro_defconfig .config
make
```

The build produces a flashable sd card image
```sh
dd if=output/images/sdcard.img of=/dev/sdX bs=4M status=progress conv=fsync
```
