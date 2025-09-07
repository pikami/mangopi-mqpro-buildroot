# Buildroot tree for Mango Pi MQ-Pro

This device tree is quite minimal as my main goal was to have a linux device with wifi and working gpio.

Resources used in this tree
- Upstream Linux and OpenSBI
- [smaeul's U-Boot fork](https://github.com/smaeul/u-boot)
- [amazingfate's rtl8723ds patches](https://github.com/amazingfate/rtl8723ds)

### Currently configured GPIO
```
        func   des  pin       pin  des   func
               3v3   1 --o o-- 2   5v
    UNMAPPED  PG13   3 --o o-- 4   5v
    UNMAPPED  PG12   5 --o o-- 6   gnd
   free (39)   PB7   7 --o o-- 8   PB8   uart0.tx (2500000.serial:40)
               gnd   9 --o o-- 10  PB9   uart0.rx (2500000.serial:41)
  free (117)  PD21  11 --o o-- 12  PB5   UNMAPPED
  free (118)  PD22  13 --o o-- 14  gnd
   free (32)   PB0  15 --o o-- 16  PB1   free (33)
               3v3  17 --o o-- 18  PD14  UNMAPPED
  free (108)  PD12  19 --o o-- 20  gnd
    UNMAPPED  PD13  21 --o o-- 22  PC1   UNMAPPED
    UNMAPPED  PD11  23 --o o-- 24  PD10  UNMAPPED
               gnd  25 --o o-- 26  PD15  free (111)
    UNMAPPED  PE17  27 --o o-- 28  PE16  UNMAPPED
   free (42)  PB10  29 --o o-- 30  gnd
   free (43)  PB11  31 --o o-- 32  PC0   UNMAPPED
   free (44)  PB12  33 --o o-- 34  gnd
   free (38)   PB6  35 --o o-- 36  PB2   uart4.tx (2501000.serial:34)
  free (113)  PD17  37 --o o-- 38  PB3   uart4.rx (2501000.serial:35)
               gnd  39 --o o-- 40  PB4   UNMAPPED
```

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
