#!/bin/bash
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-kde
killall xdg-desktop-portal
systemctl --user start xdg-desktop-portal-hyprland &
sleep 2
systemctl --user start xdg-desktop-portal &
