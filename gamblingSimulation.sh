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
declare -A total_won_Amount
declare -A total_lost_Amount
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
total_won_Amount[$days]=$totalWinningCash
total_lost_Amount[$days]=$totalLoosingCash
done
echo "${total_won_Amount[@]}"
echo "${total_lost_Amount[@]}"

#Finding the luckiest day
max=${total_won_Amount[1]}
for (( i=1;i<=${#total_won_Amount[@]};i++ ))
do
	if [[ ${total_won_Amount[$i]} -gt $max ]]
	then
			max=${total_won_Amount[$i]}
			lucky_day=$i
	fi
done

#Finding the unluckiest day
max=${total_lost_Amount[1]}
for (( i=1;i<=${#total_lost_Amount[@]};i++ ))
do
   if [[ ${total_lost_Amount[$i]} -gt $max ]]
   then
         max=${total_lost_Amount[$i]}
         unlucky_day=$i
   fi
done

#finding out gambler playing for next month or stop gambling
total_won=$((total_won+$totalWinningCash))
total_lost=$((total_lost+$totalLoosingCash))
if [[ $total_won -gt $total_lost ]]
then
	total_Amount1=$((total_won-total_lost))
	echo "Gambler playing for next month"
else
	total_Amount1=$((total_lost-total_won))
	echo "Stop gambling"
fi
