#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[ -f $HOME/.local/bin/statusbar ] && . $HOME/.local/bin/statusbar

eval "$(gpg-agent --daemon --allow-preset-passphrase --write-env-file "$envfile")"

rfkill block all
xset s off -dpms
setxkbmap -option "ctrl:nocaps"

# export GTK_IM_MODULE='ibus'
# export QT_IM_MODULE='ibus'
# export XMODIFIERS='@im=ibus'
export XDG_SESSION_TYPE='x11'

# ibus-daemon -dxrR

xrandr --auto --output HDMI-A-0 --mode 1920x1080 --primary
xrandr --auto --output DisplayPort-2 --mode 1600x900 --left-of HDMI-A-0

dbus-launch --sh-syntax --exit-with-session

eval $(ssh-agent)
pipewire &
mpd &
/usr/local/bin/emacs --daemon &

xwallpaper --maximize "$(/usr/bin/ls -d -1 /hdd/pics/wallpaper/* | shuf -n1)" &

picom --config $HOME/.config/picom/picom.conf -b

exec dwm

