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
            aplay ./assets/yeehaaw.wav &>/dev/null &disown
            ;;
        sb)
            printf "\r   ${GRAY}Short break done${NO_COLOUR}     \n"
            aplay ./assets/gong.wav &>/dev/null &disown
            ;;
        lb)
            printf "\r   ${GRAY}Long break done${NO_COLOUR}    \n"
            aplay ./assets/gong.wav &>/dev/null &disown
            ;;
    esac

}

work=$[ $2 * 60 ]
short_break=$[ $3 * 60 ]
long_break=$[ $4 * 60 ]

echo "Pomodoro $1 $2 $3 $4"

for i in $(seq 1 $1);do
	countdown w $work
	if [ $i -lt $1 ]; then
		countdown sb $short_break
	else
		countdown lb $long_break
	fi
done
