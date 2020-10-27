#!/bin/bash
#Arguments 1-date, 2-time
#0310, 4PM

if [[ -z $1 ]] | [[ -z $2 ]]; then
	echo "Format: ./roulette_dealer_finder_by_time.sh mmdd hhAM/PM."
	echo "eg: for March 10th at 2am:"
	echo "./roulette_dealer_finder_by_time.sh 0310 2AM"
	exit
fi

#Help file
if [[ $1 == "--help" ]]; then
	echo "Format: ./roulette_dealer_finder_by_time.sh mmdd hhAM/PM."
	echo "eg: for March 10th at 2am:"
	echo "./roulette_dealer_finder_by_time.sh 0310 2AM"
	exit
fi

#check date ($1) is 4 digit number
if [[ $1 != [0-9][0-9][0-9][0-9] ]]; then
	echo "Incorrect argument for date."
	echo "Enter date as mmdd where mm = month and dd = day"
	echo "Please see ./roulette_dealer_finder_by_time.sh --help"
	exit
fi
#Check time input
if [[ $2 != [0-9][a,A,p,p][m,M] ]]; then
        if [[ $2 != [0-1][0-2][a,A,p,P][m,M] ]]; then
        echo "Incorrect argument for time."
	echo "Enter time as hham or hhpm. eg. 2am or 11pm"
        echo "Please see ./roulette_dealer_finder_by_time.sh --help"
        exit
        fi
fi

#get time and am/pm
AMPM=$( echo $2 | tr -d [0-9] | tr '[:lower:]' '[:upper:]' )
TT=$(echo $2 | tr -d [A-Z,a-z] )

if [[ $TT != [0-1][0-9] ]]; then
	TT=$(echo $2 | tr -d [A-Z,a-z] | printf "%02d\n" $TT )
fi

#Get data
grep -i $TT $1"_Dealer_schedule" | grep $AMPM | awk '{print "'$1'", $1, $2, $5, $6}' 
