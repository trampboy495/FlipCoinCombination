#!/bin/bash -x
Heads=0
Tails=0
r=$((RANDOM%2))
if [ $r -eq $Heads ]
then
	echo "Heads"
else
	echo "Tails"
fi


