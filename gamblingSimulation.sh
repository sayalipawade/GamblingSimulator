#!/bin/bash -x
echo "Welcome" 

#constants
STAKE=100
BET=20
DAYS=20
UPPER_LIMIT=$(($STAKE+(50*STAKE)/100))
LOWER_LIMIT=$(($STAKE-(50*STAKE)/100))

#variables
cash=$STAKE
temp=0
every_day_cash=0
monthly_cash=0
totalWinningCash=0
totalLoosingCash=0
win=0
loose=0
total_won=0
total_lost=0

#Finding the days won and lost and by how much
for(( days=1;days<=20;days++))
do
	cash=$STAKE
	while [[ $cash -gt $LOWER_LIMIT && $cash -lt $UPPER_LIMIT ]]
	do
   	temp=$((RANDOM%2))
   	if [ $temp -eq 1 ]
   	then
			cash=$((cash+BET))
			totalWinningCash=$((totalWinningCash+BET))
		else
      	cash=$((cash-BET))
			totalLoosingCash=$((totalLoosingCash+BET))
		fi
	done
	total_won=$((total_won+$totalWinningCash))
	total_lost=$((total_lost+$totalLoosingCash))
	if [[ $total_won -gt $total_lost ]]
	then
		total_Amount1=$((total_won-total_lost))
		((win++))
	else
		total_Amount1=$((total_lost-total_won))
		((loose++))
	fi
done
echo "Winning days:$win"
echo "Loosing days:$loose"
echo "Total amount:$total_Amount1"
	 




