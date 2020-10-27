#!/bin/bash
#Arguments 1-date, 2-time
#0310, 4PM, GAME

if [[ -z $1 ]] | [[ -z $2 ]] | [[ -z $3 ]]; then
	echo "Format: ./roulette_dealer_finder_by_time_and_game.sh mmdd hhAM/PM Casino_Game"
	echo "Casino_Game is either Blackjack, Roulette or Texas"
	echo "eg: To find the dealer for Blackjack on March 10th at 2am:"
	echo "./roulette_dealer_finder_by_time_and_game.sh 0310 2AM Blackjack"
	exit
fi

#Help file
if [[ $1 == "--help" ]]; then
	echo "Format: ./roulette_dealer_finder_by_time_and_game.sh mmdd hhAM/PM Casino_game"
	echo "Casino_Game is either Blackjack, Roulette, or Texas"
	echo "eg: To find the dealer for Texas Hold Em on March 10th at 2am:"
	echo "./roulette_dealer_finder_by_time_and_game.sh 0310 2AM Texas"
	exit
fi

#check date ($1) is 4 digit number
if [[ $1 != [0-9][0-9][0-9][0-9] ]]; then
	echo "Incorrect argument for date."
	echo "Enter date as mmdd where mm = month and dd = day"
	echo "Please see ./roulette_dealer_finder_by_time_and_game.sh --help"
	exit
fi

#Check time input
if [[ $2 != [0-9][a,A,p,p][m,M] ]]; then
        if [[ $2 != [0-1][0-2][a,A,p,P][m,M] ]]; then
        echo "Incorrect argument for time."
	echo "Enter time as hham or hhpm. eg. 2am or 11pm"
        echo "Please see ./roulette_dealer_finder_by_time_and_game.sh --help"
        exit
        fi
fi

#Check which game
game=$(echo $3 | tr '[:lower:]' '[:upper:]' )
if [[ $game != "ROULETTE" ]] && [[ $game != "BLACKJACK" ]] && [[ $game != "TEXAS" ]]; then
	echo "Incorrect argument for Casino_Game"
	echo "Please choose either Blackjack, Roulette or Texas."
        echo "Please see ./roulette_dealer_finder_by_time_and_game.sh --help"
        exit
fi

if [[ $game = "BLACKJACK" ]]; then
	firstn=('3')
	lastn=('4')
elif [[ $game = "ROULETTE" ]]; then
        firstn=('5')
        lastn=('6')
elif [[ $game = "TEXAS" ]]; then
        firstn=('7')
        lastn=('8')
fi

#get time and am/pm
AMPM=$( echo $2 | tr -d [0-9] | tr '[:lower:]' '[:upper:]' )
TT=$(echo $2 | tr -d [A-Z,a-z] )

if [[ $TT != [0-1][0-9] ]]; then
	TT=$(echo $2 | tr -d [A-Z,a-z] | printf "%02d\n" $TT )
fi

#Get data
grep $TT $1"_Dealer_schedule" | grep $AMPM | awk '{print "'$1'", $1, $2, $"'$firstn'", $"'$lastn'" }'
