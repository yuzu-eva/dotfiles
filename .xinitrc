#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f /home/cafebabe/.local/bin/statusbar ]; then
  . /home/cafebabe/.local/bin/statusbar
fi

export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'

dbus-update-activation-environment \
    --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

rfkill block all

ibus-daemon -dxrR

xrandr --auto --output HDMI-A-0 --mode 1920x1080 --primary
xrandr --auto --output DisplayPort-2 --mode 1600x900 --left-of HDMI-A-0

xset s off -dpms

setxkbmap -option "ctrl:nocaps"

xwallpaper --maximize "$(/usr/bin/ls -d -1 /media/HDD/Pictures/wallpaper/* | shuf -n1)" &

compton --config /home/cafebabe/.config/compton/compton.conf -b

exec dwm

