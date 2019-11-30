#!/bin/bash
# macstatus.sh - A status line generator for macos
#
# >>>>> Adjust to your personal setup. <<<<<
#
# Author  : Rahul Martim Juliato (rahul.juliato@gmail.com)
#
# Version 1   -  30 November 2019 - Initial Release
#
# Output example: [C:myIP] [L:0.60] [D:57%] [M:150M] [S:Mute] [B:50%] [01.09.2017 15:07]



#Variables
MESSAGE="
Usage: $(basename "$0") [option]

[options]
--help		Shows this message
--version	Shows current version
"


#Processing options
case "$1" in 
	--help)
	    	echo "$MESSAGE"
	    	exit 0
	    	;;

	--version)
		echo 
		sed -n "2p" "$0" | tr -d "#"
		echo
		grep -e "^# Aut" "$0" | cut -d ":" -f 2 | tr -d "#"
		grep -e "^# Ver" "$0" | tail -n 1 | cut -d "-" -f 1,2 | tr -d "#"
		echo
		exit 0
		;;
esac

	 
#Gets all info
BATT=$( pmset -g batt | tail -n 1 | cut -d ")" -f 2 | cut -d "%" -f 1 | xargs )%
CONN=$( ifconfig | grep inet | grep broad | xargs | cut -d " " -f2 )
VOLU=$( [ $( osascript -e 'set mutado to output muted of (get volume settings)' ) == "true" ] && printf "Muted" || echo $( osascript -e 'set ovol to output volume of (get volume settings)' )% )
USAG=$( df -h | grep /System/Volumes/Data$ | xargs | cut -d " " -f 5 )
MEMO=$( top -l 1 | grep -E "^CPU|^Phys" | tail -1 | xargs | cut -d "(" -f2 | cut -d " " -f 1 )
LOAD=$( uptime | cut -d "," -f3-4 | cut -d ":" -f2 | cut -d "," -f    1-3 | tr ',' '.' | tr -d " " )
DATE=$( date +%d.%m.%Y\ %H:%M )


#Format and display info
echo [C:$CONN] [L:$LOAD] [D:$USAG] [M:$MEMO] [S:$VOLU] [B:$BATT] [$DATE]
