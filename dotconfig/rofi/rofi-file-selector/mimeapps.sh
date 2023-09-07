#!/usr/bin/env bash 
###
### mimeapps.sh — Choose an appllication able to open the given file, or open
### it with the given application
###
### Usage:
###   mimeapp.sh [-m|--mime-type mime/type] <file> [<app name>]
###
### Options:
###   <file>         File to open
###   <app name>     App to use for openning the file
###   --mime-type|m  specify the file mime-type
###   -h             Show this message.
set -e
set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
   set -o xtrace
fi
help() {
   sed -rn 's/^### ?//;T;p' "$0"
}

SCRIPTPATH=$(realpath "$(dirname "$0")")

help() {
   sed -rn 's/^### ?//;T;p' "$0"
}

TEMP=$(getopt -o 'hm:' --long 'help,mime-type:' -n 'ropen' -- "$@")

if [ $? -ne 0 ]; then
   echo 'Terminating...' >&2
   exit 1
fi

# Note the quotes around "$TEMP": they are essential!
eval set -- "$TEMP"
unset TEMP

keep=""
mimetype=""
while true; do
   case "$1" in
      '-m'|'--mime-type')
	 mimetype="--mime-type $2"
	 shift 2; continue
	 ;;
      '-h'|'--help')
	 help
	 exit 0
	 ;;
      '--')
	 shift ; break
	 ;;
      *)
	 echo 'Internal error!' >&2
	 exit 1
	 ;;
   esac
done

main() {
   export ROFI_RETV
   #export XDG_DATA_DIRS=/home/clabaut/.local/share/applications:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share
   #env > /tmp/log
   if [[ "$#" -lt 2 ]]
   then
      "$SCRIPTPATH/mimeapps" $mimetype "$1" 
   else
      coproc ( "$SCRIPTPATH/mimeapps" $mimetype "$1" "$2" > /dev/null 2>&1 )
   fi
}

main "$@"
