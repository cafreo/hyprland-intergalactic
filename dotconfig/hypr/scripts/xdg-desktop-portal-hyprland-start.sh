#!/bin/bash
sleep 4
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal
systemctl --user start xdg-desktop-portal-hyprland &
sleep 4
systemctl --user start xdg-desktop-portal &
