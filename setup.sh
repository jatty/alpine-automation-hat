#!/bin/sh

# AutomationHAT is not officially supported for Alpine
# this is my trial and error script for implementing it anyway

apk add python3 python3-dev gcc libc-dev
pip3 install automationhat smbus2
# quick hack for smbus2 requirement
cd /usr/lib/python3.6/site-packages/automationhat
sed -e s/smbus/smbus2/g __init__.py > __init__.py

mount -o remount,rw /media/mmcblk0p1
echo "dtparam=i2c_arm=on" >> /media/mmcblk0p1/usercfg.txt
echo "i2c-dev" >> /etc/modules-load.d/i2c-dev.conf

# gcc wont be included after reboot
lbu include /usr/lib/python3.6
lbu include /etc
lbu commit

reboot
