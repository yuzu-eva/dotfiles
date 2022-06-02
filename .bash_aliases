#               __       _           _
#   ___   __ _ / _| ___ | |__   __ _| |__   ___
#  / __| / _' | |_ / _ \|  _ \ / _' |  _ \ / _ \
# | |__ / (_| |  _|  __/| |_) / (_| | |_) |  __/
#  \___|\___._|_|  \___||____/\___._|____/ \___/
#
# Filename:   .bashrc

#################
# Miscellaneous # 
#################

alias cn='clear && neofetch'
alias refreshbash='source ~/.bashrc'
alias fuck='sudo $(history -p !!)'
alias open='xdg-open'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias rsync='rsync -avh --progress'

# Monitor / Resolution settings
alias setlmon-lowres='xrandr --auto --output HDMI-A-0 --mode 640x480 --primary --left-of DisplayPort-2'
alias setlmon-midres='xrandr --auto --output HDMI-A-0 --mode 800x600 --primary --left-of DisplayPort-2'
alias setlmon-default='xrandr --auto --output HDMI-A-0 --mode 1920x1080 --primary --left-of DisplayPort-2'
alias setrmon-lowres='xrandr --auto --output DisplayPort-2 --mode 640x480 --right-of HDMI-A-0'
alias setrmon-midres='xrandr --auto --output DisplayPort-2 --mode 800x600 --right-of HDMI-A-0'
alias setrmon-default='xrandr --auto --output DisplayPort-2 --mode 1600x900 --right-of HDMI-A-0'

# Set Neofetch ASCII
alias neofetch='neofetch --source ~/Documents/ASCII\ Art/lain-ascii.txt'

# Colorize grep output
alias grep='grep --color=auto -i -n'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Extract compressed files with corresponding program
extract() {
    if [ -f $1 ]; then
        case $1 in
        *.tar.bz2) tar xvjf $1 ;;
        *.tar.gz) tar xvzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar e $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xvf $1 ;;
        *.tbz2) tar xvjf $1 ;;
        *.tgz) tar xvzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

##############
# Navigation #
##############

alias hdd='cd /media/Becoming\ a\ Philosopher'

# Function to move multiple directories upwards
up() {
    local dir=""
    local limit="$1"

    # Default to limit of 1
    [ -z "$limit" ] || [ "$limit" -le 0 ] && limit=1

    for ((i = 1; i <= limit; i++)); do
        dir="../$dir"
    done

    # Perform cd. Show error if cd fails
    cd "$dir" || echo "Couldn't go up $limit directories!"
}

# Use exa instead of ls
alias ls='exa -lah --color=always --group-directories-first'

#######
# git #
#######

alias dfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

###################
# Package Manager #
###################

alias aptinstall='sudo apt-get install'
alias aptupdate='sudo apt-get update'
alias aptupgrade='sudo apt-get upgrade'
alias listupgrade='apt list --upgradeable'
alias listinst='apt list --installed'

##########
# yt-dlp #
##########

alias ytmp3='yt-dlp -x --audio-format mp3 -o "/media/Becoming a Philosopher/Music/Youtube Downloads/%(title)s.%(ext)s"'
alias ytvid='yt-dlp -o "/media/Becoming a Philosopher/Videos/Archives/Output/%(title)s.%(ext)s"'
alias ytarchive='yt-dlp --write-description --write-info-json --write-thumbnail --write-sub -o "/media/Becoming a Philosopher/Videos/Archives/%(uploader)s/%(title)s/%(title)s.%(ext)s"'

###########
# Network #
###########

alias restart-network='sudo systemctl restart systemd-resolved.service && sudo service network-manager restart'
alias flush-dns='sudo /etc/init.d/dns-clean start'

#############
# Shortcuts #
#############

alias jpwine='LANG=ja_JP.UTF-8 WINEDEBUG=-all wine'
alias kndds='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Pantsu\ Soft/Kokoro\ no\ Doki\ Doki\ Senpai/lib/windows-i686/Kokoro.exe'
alias vi='nvim'
