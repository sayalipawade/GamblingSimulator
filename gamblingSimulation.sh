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

#finding the gambler's daily cash
while [ $cash -gt $LOWER_LIMIT ] && [ $cash -lt $UPPER_LIMIT ]
do
	temp=$((RANDOM%2))
	if [ $temp -eq 1 ]
	then
		cash=$((cash+BET))
	else
		cash=$((cash-BET))
	fi
done
every_day_cash=$((cash-STAKE))

	 




