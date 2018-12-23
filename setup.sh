#!/bin/sh

# AutomationHAT is not officially supported for Alpine
# this is my trial and error script for implementing it anyway

apk add python3 python3-dev gcc libc-dev
pip3 install automationhat pysmbus
mount -o remount,rw /media/mmcblk0p1
echo "dtparam=i2c_arm=on" >> /media/mmcblk0p1/usercfg.txt
lbu commit
