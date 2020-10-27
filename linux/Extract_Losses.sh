#!/bin/bash
#extract losses from Players 

grep '-' 03* | awk '{print $NFR }' | sed s/:/' '/ > Roulette_Losses
awk '{print $1, $2, $3}' Roulette_Losses > Notes_Player_Analysis
echo "Mylie Schmidt" >> Notes_Player_Analysis
grep -i 'mylie' Roulette_Losses | wc -l >> Notes_Player_Analysis
