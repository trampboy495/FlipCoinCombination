#!/bin/bash -x
Heads=1
Tails=0
noOfheads=0
noOftails=0
noOfLoops=0
declare -A coinSinglet coinDoublet
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
function Doublet() {
	noOfLoops=0 HH=0 HT=0 TH=0 TT=0
	while [ $noOfLoops -lt 10 ]
	do
		r=`printf "%s\n" {0..1}{0..1} | shuf -n1`
		case $r in
			$Heads$Heads)
				((HH++))
			;;
			$Heads$Tails)
				((HT++))
			;;
			$Tails$Heads)
				((TH++))
			;;
			$Tails$Tails)
				((TT++))
			;;
		esac
		((noOfLoops++))
	done
	HHpercentage=$(($HH*10))
	HTpercentage=$(($HT*10))
	THpercentage=$(($TH*10))
	TTpercentage=$(($TT*10))
	coinDoublet=([HH]=$HHpercentage [HT]=$HTpercentage [TH]=$THpercentage [TT]=$TTpercentage)
}
Singlet
Doublet

