#!/bin/bash -x
Heads=1
Tails=0
noOfheads=0
noOftails=0
noOfLoops=0
declare -A coinSinglet
function Singlet() {
	while [ $noOfLoops -lt 10 ]
	do
		r=$((RANDOM%2))
		if [ $r -eq $Heads ]
		then
			((noOfheads++))
		else
			((noOftails++))
		fi
		((noOfLoops++))
	done
	Headpercentage=$(($noOfheads*10))
	Tailpercentage=$(($noOftails*10))
	coinSinglet["H"]=$Headpercentage
	coinSinglet["T"]=$Tailpercentage
}
Singlet
