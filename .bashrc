#
# ~/.bashrc
#

source ~/.bashrc_cafreo

# SETTINGS
source /usr/share/doc/pkgfile/command-not-found.bash
[[ $- != *i* ]] && return
HISTSIZE=2000
HISTFILESIZE=2000
# starship
eval "$(starship init bash)"
PS1="\e[1;33m\u@\h \W$ \e[0;0m"
#PS1='[\u@\h \W]\$ '

# COLORS
# ls/lf
eval "$(dircolors ~/.dircolors)";
# fzf
export FZF_DEFAULT_OPTS='--color=fg:#c8cacc,bg:#201c28,hl:#de5f21 --color=fg+:#c8cacc,bg+:#2e2a36,hl+:#f5b83a --color=info:#da6a4c,prompt:#c8cacc,pointer:#f5b83a --color=marker:#f5b83a,spinner:#da6a4c,header:#74747a'

# AUTOSTART
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

# DEFAULT APPS
export OPENER=/usr/bin/xdg-open
export TERMINAL=/usr/bin/kitty
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/brave
export READER=/usr/bin/zathura
export TEXT_EDITOR=/usr/bin/lowriter
export IMAGE_VIEWER=/usr/bin/qimgv
export IMAGE_EDITOR=/usr/bin/gimp
export VIDEO_PLAYER=/usr/bin/mpv
export VIDEO_EDITOR=/usr/bin/kdenlive
export AUDIO_PLAYER=/usr/bin/mpv
export AUDIO_EDITOR=/usr/bin/tenacity

export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl

# CURSOR
export XCURSOR_THEME=pixelfun3
export XCURSOR_SIZE=36

# ALIASES
# pacman/yay
alias pacclean="paccache -rvk2; paccache -ruvk0; sudo pacman -Qdtq | sudo pacman -Rns -; yay -Yc"
alias yayf="yay -Suy --devel; flatpak update; pacclean"
alias paclist="sudo pacman -Qi | sed '/^Depends On/,/^Required By/{ s/^Required By.*$//; H; d }; /^Name/!d; /^Name/{ n;x;}'| sed '/^$/s//==================================================================================/'"
alias paclistin="grep -i installed /var/log/pacman.log / grep -i upgraded hyprland /var/log/pacman.log"
alias pacdep="comm -23 <(pacman -Qtq) <(pacman -Qsq base base-devel)"
# tools
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ssh="kitty +kitten ssh"
alias gduh="gdu / --ignore-dirs /media,/mnt"
alias duff="duf -hide special -output 'mountpoint, size, used, avail, usage, type'"
alias fstype="findmnt -n -o FSTYPE -T ."
alias swaylock="swaylock -C ~/.config/swaylock/config"
alias computer="ollama run dolphin-mistral"
alias mount!="sudo mount -av"
alias ip="curl ifconfig.me"
alias fetch="neofetch"
alias conv2mp4="ffmpeg -i $1 -c:v libx264 -pix_fmt yuv420p -b:v 12M -b:a 192k -c:a aac ${s%.*}.mp4"
alias searchssh="sudo nmap -p 22 192.168.178.0/24"
alias rsync="rsync -arh --info=progress2"
# apps
alias lf=lfcd
alias lfd="lf -config /dev/null"
alias nv="nvim"
alias vim="nvim"
alias ytdl="yt-dlp"
alias ytdla="yt-dlp -x"
alias minexmr='qutebrowser www.redditp.com/r/monerochan &>/dev/null & sudo xmrig'

# FUNCTIONS

function lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

function cv() {
	if [ $# == 2 ];
	then
		mpv $1 --external-file=$2 --lavfi-complex='[vid1] [vid2] hstack [vo]'
	
	elif [ $# == 4 ];
	then
		mpv $1 --external-file=$2 --external-file=$3 --external-file=$4 --lavfi-complex='[vid1] [vid2] hstack [t1] ; [vid3] [vid4] hstack [t2] ; [t1] [t2] vstack [vo]'
	
	else
		printf "   invalid number of files (2 or 4 allowed)"
	fi
}

#function set-app-volume() {
#  local player="$1"
#  local volume="$2"
#  firstPlayerSinkIndex="$(pacmd list-sink-inputs | awk '/index:|application.name |application.process.binary / {print $0};' | grep -iB 1 "$player" | awk '/index:/ {print $2; exit}')"  # get specific app sink
#  [[ $firstPlayerSinkIndex ]] && pacmd set-sink-input-volume "$firstPlayerSinkIndex" "$((volume*65536/100))" # 100% → 65536
#}

function computer-tts() {
	computer $@ | piper-tts -q --model ~/git-clone/piper-voices/en/en_US/lessac/medium/en_US-lessac-medium.onnx --output-raw | ffplay -v -40 -volume 5 -f s16le -ar 22050 -ac 1 -nodisp -autoexit -
	#piper-tts -q --model ~/git-clone/piper-voices/en/en_US/lessac/medium/en_US-lessac-medium.onnx --output-raw | aplay -q -r 22050 -f S16_LE -t raw -
}

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# DEPRECATED

#LS_COLORS='OTHER_WRITABLE=34;46;46:STICKY_OTHER_WRITABLE=31;46;46:rs=0:di=01;33:ln=01;36:mh=00:pi=40;33:so=01;92:do=01;92:bd=40;33;01:cd=40;33;01:or=40;36;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=33;42:st=37;44:ex=01;36:*.tar=01;36:*.tgz=01;36:*.arc=01;36:*.arj=01;36:*.taz=01;36:*.lha=01;36:*.lz4=01;36:*.lzh=01;36:*.lzma=01;36:*.tlz=01;36:*.txz=01;36:*.tzo=01;36:*.t7z=01;36:*.zip=01;36:*.z=01;36:*.dz=01;36:*.gz=01;36:*.lrz=01;36:*.lz=01;36:*.lzo=01;36:*.xz=01;36:*.zst=01;36:*.tzst=01;36:*.bz2=01;36:*.bz=01;36:*.tbz=01;36:*.tbz2=01;36:*.tz=01;36:*.deb=01;36:*.rpm=01;36:*.jar=01;36:*.war=01;36:*.ear=01;36:*.sar=01;36:*.rar=01;36:*.alz=01;36:*.ace=01;36:*.zoo=01;36:*.cpio=01;36:*.7z=01;36:*.rz=01;36:*.cab=01;36:*.wim=01;36:*.swm=01;36:*.dwm=01;36:*.esd=00;36:*.avif=00;92:*.jpg=00;92:*.jpeg=00;92:*.mjpg=00;92:*.mjpeg=00;92:*.gif=00;92:*.bmp=00;92:*.pbm=00;92:*.pgm=00;92:*.ppm=00;92:*.tga=00;92:*.xbm=00;92:*.xpm=00;92:*.tif=00;92:*.tiff=00;92:*.png=00;92:*.svg=00;92:*.svgz=00;92:*.mng=00;92:*.pcx=00;92:*.mov=00;92:*.mpg=00;92:*.mpeg=00;92:*.m2v=00;92:*.mkv=00;92:*.webm=00;92:*.webp=00;92:*.ogm=00;92:*.mp4=00;92:*.m4v=00;92:*.mp4v=00;92:*.vob=00;92:*.qt=00;92:*.nuv=00;92:*.wmv=00;92:*.asf=00;92:*.rm=00;92:*.rmvb=00;92:*.flc=00;92:*.avi=00;92:*.fli=00;92:*.flv=00;92:*.gl=00;92:*.dl=00;92:*.xcf=00;92:*.xwd=00;92:*.yuv=00;92:*.cgm=00;92:*.emf=00;92:*.ogv=00;92:*.ogx=00;92:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:';
#export LS_COLORS
