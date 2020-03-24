#!/bin/bash -x
echo "Welcome" 

#constants
STAKE=100
BET=1
DAYS=20
UPPER_LIMIT=$(($STAKE+(50*STAKE)/100))
LOWER_LIMIT=$(($STAKE-(50*STAKE)/100))

#variables
cash=$STAKE
temp=0
every_day_cash=0
monthly_cash=0

#calculating gamblers total amount after 20 days
for(( days=1;days<=20;days++))
do
	while [ $cash -gt $LOWER_LIMIT ] && [ $cash -lt $UPPER_LIMIT ]
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
done
echo $cash
echo "Total Winning Amount:$totalWinningCash"
echo "Total Lost Amount:$totalLoosingCash"
	



	 




