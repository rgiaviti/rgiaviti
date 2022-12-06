#!/usr/bin/bash

wget https://raw.githubusercontent.com/rgiaviti/rgiaviti/main/technical-notes/bt5-linux/rtl8761b_config
wget https://raw.githubusercontent.com/rgiaviti/rgiaviti/main/technical-notes/bt5-linux/rtl8761b_fw

sudo mv rtl8761b_config /lib/firmware/rtl_bt/rtl8761b_config.bin
sudo mv rtl8761b_fw /lib/firmware/rtl_bt/rtl8761b_fw.bin

sudo modprobe btusb
sudo systemctl start bluetooth.service

hciconfig -a

# Source: https://askubuntu.com/questions/1398873/bluetooth-5-0-adapter-help
