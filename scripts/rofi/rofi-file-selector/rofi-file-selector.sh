#!/usr/bin/env bash 
# Check version of bash for variable indirection 
case $BASH_VERSION in ''|[123].*|4.[012]) rofi -e "ERROR: Bash 4.3+ needed" ; exit 1;; esac

# Check for required executables
command -v fd >/dev/null 2>&1 || { echo >&2 "I require 'fd' but it's not installed.  Aborting."; exit 1; }
command -v choose >/dev/null 2>&1 || { echo >&2 "I require 'choose' but it's not installed.  Aborting."; exit 1; }
command -v xsel >/dev/null 2>&1 || { echo >&2 "I require 'xsel' but it's not installed.  Aborting."; exit 1; }

SCRIPTPATH=$(realpath "$(dirname "$0")")
: "${XDG_CONFIG_HOME:="$HOME"/.config}"
: "${CONFIG_DIR:="$XDG_CONFIG_HOME/rofi-file-selector/"}"

# To enable mocking in test
: "${_ROFI:=rofi}"
: "${_CHOOSEEXE:="$SCRIPTPATH/chooseexe.sh"}"

MENU=(home)
d_home=("$HOME")
o_home=( )
FD_OPTIONS=( )

if [[ -f "$CONFIG_DIR/config.sh" ]]
then
   source "$CONFIG_DIR/config.sh"
elif [[ -f "$SCRIPTPATH/config.sh" ]]
then
   source "$SCRIPTPATH/config.sh"
fi

if [[ ${#MENU[@]} -gt 1 ]]
then
   res=$(printf "%s\n" "${MENU[@]}" | "$_ROFI" -dmenu)
else
   res="${MENU[0]}"
fi

# declare dirs as being an indirection upon d_$res
declare -n dirs="d_$res"
declare -n files="f_$res"
declare -n options="o_$res"

{ 
   if [[ -n "${files[*]}" ]]
   then
      printf -- '%s\n' "${files[@]}"
   fi
   if [[ -n $dirs ]]
   then
      "$SCRIPTPATH/fd_cache.sh" "${FD_OPTIONS[@]}" "${options[@]}" '.' "${dirs[@]}" 
   fi
}\
   | { "$_ROFI" -theme ~/.config/rofi/config-list-find.rasi  \
    -dmenu -sort -sorting-method fzf -i -p "Choose to open" \
    -mesg "<i>use Ctrl˖d to open parent directory, Ctrl+c to copy filename</i>" \
    -kb-remove-char-forward "Delete" \
    -kb-secondary-copy "" \
    -kb-custom-1 "Ctrl+d" \
    -kb-custom-2 "Ctrl+c" \
    -keep-right; echo " $?" ; } | xargs  -d $'\n' "$_CHOOSEEXE" \


