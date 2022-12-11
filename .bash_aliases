#             __      _           _          
#   ___ __ _ / _| ___| |__   __ _| |__   ___ 
#  / __/ _` | |_ / _ \ '_ \ / _` | '_ \ / _ \
# | (_| (_| |  _|  __/ |_) | (_| | |_) |  __/
#  \___\__,_|_|  \___|_.__/ \__,_|_.__/ \___|
#

#################
# Miscellaneous # 
#################

alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias refresh='source ~/.bashrc'
alias fuck='sudo $(history -p !!)'
alias open='xdg-open'
alias rsync='rsync -avh --progress'
alias cwp='xwallpaper --maximize "$(/usr/bin/ls -1 -d /hdd/pics/wallpaper/* | shuf -n1)"'
alias fd='fdfind'

# Control Audio
alias headset='pactl set-default-sink alsa_output.pci-0000_29_00.0.analog-stereo'
alias speakers='pactl set-default-sink alsa_output.pci-0000_31_00.4.analog-stereo'
alias setvol='pactl set-sink-volume @DEFAULT_SINK@'

# Monitor / Resolution settings, mainly for playing old-ass games
alias setlmon-lowres='xrandr --auto --output HDMI-A-0 --mode 640x480 --primary'
alias setlmon-midres='xrandr --auto --output HDMI-A-0 --mode 800x600 --primary'
alias setlmon-default='xrandr --auto --output HDMI-A-0 --mode 1920x1080 --primary'
alias setrmon-lowres='xrandr --auto --output DisplayPort-2 --mode 640x480 --left-of HDMI-A-0'
alias setrmon-midres='xrandr --auto --output DisplayPort-2 --mode 800x600 --left-of HDMI-A-0'
alias setrmon-default='xrandr --auto --output DisplayPort-2 --mode 1600x900 --left-of HDMI-A-0'

alias cn='clear;macchina'

# Colorize grep output
alias grep='grep --color=auto -i'

alias ls='ls -hl --color=always --group-directories-first'

alias nnn='nnn -Hde'

# Convert date from YYYYMMDD to YYYY-MM-DD
date-convert() {
    for i in *; do
        mv "${i}" "$(echo "${i}" |
        sed 's/\([0-9][0-9][0-9][0-9]\)\([0-9][0-9]\)\([0-9][0-9]\)/\1-\2-\3/')"
    done;
}

# Reverse date from DD-MM-YYYY to YYYY-MM-DD
date-reverse() {
    for i in *; do
        mv "${i}" "$(echo "${i}" |
        sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)/\3-\1-\2/')"
    done;
}

# Convert video files to webm
mkwebm() {
    ffmpeg -i "${1}" -crf 1 -b:v 1M -c:a libvorbis "${1%.*}".webm
}

# record primary monitor with audio output and input
record() {
    ffmpeg -s 1920x1080 \
        -framerate 60 -f x11grab -i :0.0+1600 \
        -f pulse -ac 2 -ar 44100 -i alsa_output.pci-0000_29_00.0.analog-stereo.monitor \
        -f pulse -ac 1 -ar 44100 -i alsa_input.usb-SunplusIT_Inc_FHD_Camera_Microphone_01.00.00-02.analog-stereo \
        -filter_complex amix=inputs=2 \
        -vcodec libx265 -s 1920x1080 \
        -acodec libvorbis -ab 128k \
        ~/vids/$1.mkv
}

#######
# git #
#######

alias commit='git commit -m'
alias fetch='git fetch'
alias upstream='git push --set-upstream origin'
alias remote='git remote add origin'
alias pull='git pull origin'
alias push='git push origin'

# Shortcut for dotfiles repo
alias dfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

###################
# Package Manager #
###################

alias aptin='sudo apt install'
alias aptup='sudo apt update && sudo apt upgrade'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptrm='sudo apt remove'
alias aptsr='apt search'
alias listup='apt list --upgradeable'
alias listin='apt list --installed'

##########
# yt-dlp #
##########

alias ytvid='yt-dlp -o "/hdd/vids/random/%(title)s.%(ext)s" --remux-video "mkv"'
alias ytarchive='yt-dlp -o "/hdd/vids/archives/%(uploader)s/%(upload_date)s - %(title)s/%(title)s.%(ext)s" --remux-video "mkv"'

# Function to specify filename, so I can avoid total chaos in my library
ytmp3() {
    read -p "Enter filename: " name;
    yt-dlp -x --audio-format mp3 --download-archive "/hdd/music/Archive_goodMusic.txt" \
        --embed-metadata -o "/hdd/music/Youtube Downloads/$name.%(ext)s" $1
}

###########
# Network #
###########

alias flush-dns='sudo /etc/init.d/dns-clean start'

#############
# Shortcuts #
#############

alias jpwine='LANG=ja_JP.UTF-8 WINEDEBUG=-all wine'
alias emacs='emacsclient -c --socket-name=/tmp/emacs1000/server'
