#             __      _           _          
#   ___ __ _ / _| ___| |__   __ _| |__   ___ 
#  / __/ _` | |_ / _ \ '_ \ / _` | '_ \ / _ \
# | (_| (_| |  _|  __/ |_) | (_| | |_) |  __/
#  \___\__,_|_|  \___|_.__/ \__,_|_.__/ \___|
#

## MISCELLANEOUS

# various shortcuts
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias refresh='source ~/.bashrc'
alias fuck='sudo $(history -p !!)'
alias open='xdg-open'
alias rsync='rsync -avh --progress'
alias cwp='xwallpaper --maximize "$(/usr/bin/ls -1 -d /hdd/pics/wallpaper/* | shuf -n1)"'
alias fd='fdfind'
alias mutt='pushd ~/.mutt/attachments; mutt; popd'
alias jpwine='LANG=ja_JP.UTF-8 WINEDEBUG=-all wine'
alias emacs='emacsclient -c -a "emacs"'
alias cn='clear;macchina'

# cp mv and rm always verbose
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

# Colorize grep output
alias grep='grep --color=auto -i'

# color ls, always full info and human readable; group dirs
alias ls='ls -hl --color=always --group-directories-first'
alias la='ls -a'

# Control Audio
alias headset="wpctl set-default $(wpctl status | grep 'Headphones' | cut -b11-12)"
alias speakers="wpctl set-default $(wpctl status | grep 'Speakers' | cut -b11-12)"
alias setvol='pactl set-sink-volume @DEFAULT_SINK@'

# Monitor / Resolution settings, mainly for playing old-ass games
alias setlmon-lowres='xrandr --auto --output HDMI-A-0 --mode 640x480 --primary'
alias setlmon-midres='xrandr --auto --output HDMI-A-0 --mode 800x600 --primary'
alias setlmon-default='xrandr --auto --output HDMI-A-0 --mode 1920x1080 --primary'
alias setrmon-lowres='xrandr --auto --output DisplayPort-2 --mode 640x480 --left-of HDMI-A-0'
alias setrmon-midres='xrandr --auto --output DisplayPort-2 --mode 800x600 --left-of HDMI-A-0'
alias setrmon-default='xrandr --auto --output DisplayPort-2 --mode 1600x900 --left-of HDMI-A-0'

## FUNCTIONS FOR CONVERTING DATE TO ISO 8601

# convert date from YYYYMMDD to YYYY-MM-DD
date-convert() {
    for i in *; do
        mv "${i}" "$(echo "${i}" |
        sed 's/\([0-9][0-9][0-9][0-9]\)\([0-9][0-9]\)\([0-9][0-9]\)/\1-\2-\3/')"
    done;
}

# reverse date from DD-MM-YYYY to YYYY-MM-DD
date-reverse() {
    for i in *; do
        mv "${i}" "$(echo "${i}" |
        sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)/\3-\1-\2/')"
    done;
}

## RECORDING, DOWNLOADING AND CONVERTING VIDEO

# record primary monitor with audio output and input
record() {
    ffmpeg -s 1920x1080 \
        -framerate 60 -f x11grab -i :0.0+1600 \
        -f pulse -ac 2 -ar 44100 -i alsa_output.pci-0000_29_00.0.analog-stereo.monitor \
        -f pulse -ac 1 -ar 44100 -i alsa_input.usb-SunplusIT_Inc_FHD_Camera_Microphone_01.00.00-02.analog-stereo \
        -filter_complex amix=inputs=2 \
        -vcodec libx265 -s 1920x1080 \
        -acodec libvorbis -ab 128k \
        ~/vids/"$1".mkv
}

# shortcuts for most used yt-dlp calls
alias ytvid='yt-dlp -o "/hdd/vids/random/%(title)s.%(ext)s" --remux-video "mkv"'
alias ytreact='yt-dlp -o "/hdd/pics/reactions/gif/%(title)s.%(ext)s" --recode-video "webm"'
alias ytarchive='yt-dlp -o "/hdd/vids/archives/%(uploader)s/%(upload_date)s - %(title)s/%(title)s.%(ext)s" --remux-video "mkv"'

# function to specify filename, so I can avoid total chaos in my library
ytmp3() {
    read -p "Enter filename: " name;
    yt-dlp -x --audio-format mp3 --download-archive "/hdd/music/Archive_goodMusic.txt" \
        --embed-metadata -o "/hdd/music/Youtube Downloads/$name.%(ext)s" $1
}

# convert video files to webm
mkwebm() {
    ffmpeg -i "${1}" -crf 1 -b:v 1M -c:a libvorbis "${1%.*}".webm
}

## GIT

# general shortcuts
alias commit='git commit -m'
alias fetch='git fetch'
alias upstream='git push --set-upstream origin'
alias remote='git remote add origin'
alias pull='git pull origin'
alias push='git push origin'

# shortcut for dotfiles repo
alias dfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dcomm='dfiles commit -m'
alias dpush='dfiles push origin'

## PACKAGE MANAGER

alias aptin='sudo apt install'
alias aptup='sudo apt update && sudo apt upgrade'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptrm='sudo apt remove'
alias aptsr='sudo apt search'
alias aptsh='sudo apt show'
alias listup='sudo apt list --upgradeable'
alias listin='sudo apt list --installed'
