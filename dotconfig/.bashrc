#
# ~/.bashrc
#

source ~/.bashrc_cafreo

# SETTINGS
source /usr/share/doc/pkgfile/command-not-found.bash
[[ $- != *i* ]] && return
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"
HISTSIZE=8000
HISTFILESIZE=8000
# starship
eval "$(starship init bash)"
PS1="\e[1;33m\u@\h \W$ \e[0;0m"

# COLORS
# ls/lf
eval "$(dircolors ~/.dircolors)";
# fzf
export FZF_DEFAULT_OPTS='--color=fg:#c8cacc,bg:#201c28,hl:#de5f21 --color=fg+:#c8cacc,bg+:#2e2a36,hl+:#f5b83a --color=info:#da6a4c,prompt:#c8cacc,pointer:#f5b83a --color=marker:#f5b83a,spinner:#da6a4c,header:#74747a'

# DEFAULT APPS
export OPENER=/usr/bin/xdg-open
export TERMINAL=/usr/bin/kitty
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/bat
export BROWSER=/usr/bin/mullvad-browser
export PDF_READER=/usr/bin/zathura
export PDF_EDITOR=/usr/bin/evince
export TEXT_EDITOR=/usr/bin/lowriter
export IMAGE_VIEWER=/usr/bin/qimgv
export IMAGE_EDITOR=/usr/bin/gimp
export VIDEO_PLAYER=/usr/bin/mpv
export VIDEO_EDITOR=/usr/bin/flowblade
export AUDIO_PLAYER=/usr/bin/mpv
export AUDIO_EDITOR=/usr/bin/tenacity

export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl
export PATH=$PATH:$(go env GOPATH)/bin

# CURSOR
export XCURSOR_THEME=pixelfun3
export XCURSOR_SIZE=36

# ALIASES
# system
alias start="sudo systemctl start"
alias restart="sudo systemctl restart"
alias stop="sudo systemctl stop"
alias status="sudo systemctl status"
# pacman/yay
alias pacclean="paccache -rvk2; paccache -ruvk0; sudo pacman -Qdtq | sudo pacman -Rns -; yaycache -rvk3; yaycache -ruvk0; yay -Yc; flatpak uninstall --unused; sudo flatpak repair"
alias yayf="yay -Suy --devel; flatpak update; pacclean"
alias yayd="yay -Rns"
alias paclist="sudo pacman -Qi | sed '/^Depends On/,/^Required By/{ s/^Required By.*$//; H; d }; /^Name/!d; /^Name/{ n;x;}'| sed '/^$/s//==================================================================================/'"
alias paclistin="grep -i installed /var/log/pacman.log / grep -i upgraded hyprland /var/log/pacman.log"
alias paclistdep="comm -23 <(pacman -Qtq) <(pacman -Qsq base base-devel)"
# tools
alias ls='ls -alh --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ssh="kitty +kitten ssh"
alias gduh="gdu / --ignore-dirs /media,/mnt,/srv,/export"
alias duff="duf -hide special -output 'mountpoint, size, used, avail, usage, type'"
alias fstype="findmnt -n -o FSTYPE -T ."
alias computer="ollama run llama3.1"
alias computer2="ollama run dolphin-mistral"
alias computerf='ollama list | awk -F: "NR>1 && !/reviewer/ {system(\"ollama pull \"$1)}"'
alias mount!="sudo mount -av"
alias cip="curl ifconfig.me"
alias fetch="neofetch"
alias searchssh="sudo nmap -p 22 192.168.178.0/24"
alias rsync="rsync -arh --info=progress2"
alias br='source ~/.bashrc'
# apps
alias lf=lfcd
alias lfd="lf -config /dev/null"
alias nv="nvim"
alias vim="nvim"
alias ytdl="yt-dlp"
alias ytdla="yt-dlp -x"
#alias minexmr='qutebrowser www.redditp.com/r/monerochan &>/dev/null & sudo xmrig'
alias waybarr='killall -SIGUSR2 waybar'

# FUNCTIONS
# lf wrapper script
function lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}
# compare videos
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
# llm tts
function computer-tts() {
	computer $@ | piper-tts -q --model ~/git-clone/piper-voices/en/en_US/lessac/medium/en_US-lessac-medium.onnx --output-raw | ffplay -v -40 -volume 5 -f s16le -ar 22050 -ac 1 -nodisp -autoexit -
	#piper-tts -q --model ~/git-clone/piper-voices/en/en_US/lessac/medium/en_US-lessac-medium.onnx --output-raw | aplay -q -r 22050 -f S16_LE -t raw -
}
