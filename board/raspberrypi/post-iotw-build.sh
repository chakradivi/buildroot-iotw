#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

if [ -e ${TARGET_DIR}/etc/inittab ]; then
  if ! grep -R "insert broadcom wireless driver" ${TARGET_DIR}/etc/inittab ; then
    sed -e '/# now run any rc scripts/i\
\n#\ insert\ broadcom\ wireless\ driver\ module\n::sysinit:/sbin/modprobe\ brcmfmac\n' -i ${TARGET_DIR}/etc/inittab
  fi
fi
