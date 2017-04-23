#!/bin/bash 


function countdown()
{

    local bold=$(tput bold)
    local gray=$(tput setaf 8)
    local cyan=$(tput setaf 6)
    local reset=$(tput sgr0)
    local cl_line=$(tput el) # clear to end of line

    local sec_rem=$2
    local seconds=0
    local minutes=0  

    while [[ $sec_rem -gt 0 ]]; do 

        sec_rem=$(( $sec_rem - 1 ))
        seconds=$(( $sec_rem % 60 ))
        minutes=$(( $sec_rem / 60 ))

        case $1 in
            w)
                printf "\r${bold}$i: Work!${normal} [${gray}%02d:%02d${reset}]"  $minutes $seconds
                ;;
            sb)
                printf "\r   Short break [${gray}%02d:%02d${reset}]"  $minutes $seconds
                ;;
            lb)
                printf "\r   Long break [${gray}%02d:%02d${reset}]"  $minutes $seconds
                ;;
        esac

        sleep 1

    done

    case $1 in
        w)
            printf "\r${bold}$i: ${cyan}Work done - Yeah!${reset}\n"
            aplay "${appdir}/assets/break.wav" &>/dev/null &disown
            ;;
        sb)
            printf "\r${cl_line}   ${gray}Short break done${reset}\n"
            aplay "${appdir}/assets/work.wav" &>/dev/null &disown
            ;;
        lb)
            printf "\r${cl_line}   ${reset}Long break done${reset}\n"
            aplay "${appdir}/assets/pomodoro.wav" &>/dev/null &disown
            ;;
    esac

}

# exit if argumentos not equal to zero or four
if ! [ $# -eq 0 -o $# -eq 4 ];then
   echo "Usage ${0##*/}: [pomodoros work short_break long_break]"
   exit 1
fi

# get realpath of script to load assets
realpath=$(realpath ${0})
appdir=${realpath%/*}

# default values 
pomodoros=${1:-4}
work=${2:-25}
short_break=${3:-5}
long_break=${4:-15}
    
# be nice, tell user what he is facing ahead
echo "Pomodoro $pomodoros $work $short_break $long_break"

# convert everything to seconds
work=$(( $work * 60 ))
short_break=$(( $short_break * 60 ))
long_break=$(( $long_break * 60 ))

# lets go!
for ((i=1; i<=pomodoros; i++));do
	countdown w $work
	if [ $i -lt $pomodoros ]; then
		countdown sb $short_break
	else
		countdown lb $long_break
	fi
done
