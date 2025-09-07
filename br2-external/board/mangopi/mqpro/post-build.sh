#!/bin/sh

set -e

TARGET_DIR=$1

mkdir -p ${TARGET_DIR}/boot

cp -v output/images/Image ${TARGET_DIR}/boot/
cp -v output/images/sun20i-d1-mangopi-mq-pro.dtb ${TARGET_DIR}/boot/

# mmcblk0p1
cat > ${TARGET_DIR}/boot/boot.cmd <<'EOF'
setenv bootargs "earlycon=sbi console=ttyS0,115200 root=/dev/mmcblk0p1 rdinit=/sbin/init"
load mmc 0:1 0x40200000 /boot/Image
load mmc 0:1 0x4fa00000 /boot/sun20i-d1-mangopi-mq-pro.dtb
booti 0x40200000 - 0x4fa00000
EOF

mkimage -C none -A riscv -T script \
  -d ${TARGET_DIR}/boot/boot.cmd ${TARGET_DIR}/boot/boot.scr
