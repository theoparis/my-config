#!/bin/sh

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom &
feh --bg-scale /usr/share/backgrounds/archlinux/gritty.png &
xinput set-prop "DELL097D:00 04F3:311C Touchpad" "libinput Disable While Typing Enabled" 0

#exec dwm
gnome-shell

