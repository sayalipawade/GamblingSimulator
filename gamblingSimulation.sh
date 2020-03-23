#!/bin/bash -x
echo "Welcome" 

#constants
STAKE=100
BET=1

#variables
cash=$STAKE
temp=0

#finding the gambler loose or win
temp=$((RANDOM%2))
if [[ $temp -eq 1 ]]
then
	cash=$((cash+(50*cash)/100))
else
	cash=$((cash-(50*cash)/100))
fi




