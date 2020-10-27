#!/bin/bash

if [[ -f Dealers_working_during_losses ]]; then
	rm Dealers_working_during_losses
fi

while read line;
do
ddate=$(echo $line | awk '{print $1}' | sed 's/_/a/g' | tr -d [a-z,A_Z])
ttime=$(echo $line | awk '{print $2}')
AMPM=$(echo $line | awk '{print $3}')
filen=($ddate"_Dealer_schedule")

grep $ttime $filen | grep $AMPM | awk '{print "'"$ddate"'", $1, $2, $5, $6}' >> Dealers_working_during_losses

done < /home/sysadmin/homework/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Losses


