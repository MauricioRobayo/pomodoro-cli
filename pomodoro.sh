#!/bin/bash 


function countdown()
{

    local bold=$(tput bold)
    local normal=$(tput sgr0)
    local GRAY="\033[0;37m"
    local CYAN="\033[1;36m"
    local NO_COLOUR="\033[0m"

    sec_rem=$2

    while [ $sec_rem -gt 0 ]; do 

        sec_rem=$[ $sec_rem - 1 ]

        seconds=$[ $sec_rem % 60 ]
        minutes=$[ $sec_rem / 60 ]

        case $1 in
            w)
                printf "\r${bold}$i: Work!${normal} [${GRAY}%02d:%02d${NO_COLOUR}]"  $minutes $seconds
                ;;
            sb)
                printf "\r   Short break [${GRAY}%02d:%02d${NO_COLOUR}]"  $minutes $seconds
                ;;
            lb)
                printf "\r   Long break [${GRAY}%02d:%02d${NO_COLOUR}]"  $minutes $seconds
                ;;
        esac

        sleep 1

    done

    case $1 in
        w)
            printf "\r${bold}$i: ${bold}${CYAN}Work done - Yeah!$NO_COLOUR${normal}\n"
            aplay "./assets/break.wav" &>/dev/null &disown
            ;;
        sb)
            printf "\r   ${GRAY}Short break done${NO_COLOUR}     \n"
            aplay "./assets/work.wav" &>/dev/null &disown
            ;;
        lb)
            printf "\r   ${GRAY}Long break done${NO_COLOUR}    \n"
            aplay "./assets/pomodoro.wav" &>/dev/null &disown
            ;;
    esac

}

# default values 
if [ $# = 0 ];then
    pomodoros=4
    work=25 # minutes
    short_break=5 # minutes
    long_break=15 # minutes
else
    pomodoros=$1
    work=$2
    short_break=$3
    long_break=$4
fi

echo "Pomodoro $pomodoros $work $short_break $long_break"

work=$[ $work * 60 ]
short_break=$[ $short_break * 60 ]
long_break=$[ $long_break * 60 ]

for i in $(seq 1 $pomodoros);do
	countdown w $work
	if [ $i -lt $pomodoros ]; then
		countdown sb $short_break
	else
		countdown lb $long_break
	fi
done
