#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f $HOME/.local/bin/statusbar ]; then
  . $HOME/.local/bin/statusbar
fi

# exec ck-launch-session dbus-launch --exit-with-session /usr/local/bin/dwm

# export GTK_IM_MODULE='ibus'
# export QT_IM_MODULE='ibus'
# export XMODIFIERS='@im=ibus'

rfkill block all

# ibus-daemon -dxrR

xrandr --auto --output HDMI-A-0 --mode 1920x1080 --primary
xrandr --auto --output DisplayPort-2 --mode 1600x900 --left-of HDMI-A-0

xset s off -dpms

setxkbmap -option "ctrl:nocaps"

xwallpaper --maximize "$(/usr/bin/ls -d -1 /hdd/pics/wallpaper/* | shuf -n1)" &

picom --config $HOME/.config/picom/picom.conf -b

exec dwm

