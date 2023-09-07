#!/bin/bash
# for the ability to open links in a browser from a flatpack app
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal
systemctl --user start xdg-desktop-portal-gtk &
sleep 2
systemctl --user start xdg-desktop-portal &
