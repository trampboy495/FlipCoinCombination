#!/bin/bash -x
Heads=1
Tails=0
noOfheads=0
noOftails=0
noOfLoops=0
declare -A coinSinglet coinDoublet coinTriplet
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
	coinSinglet=([H]=$Headpercentage [T]=$Tailpercentage)
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
function Triplet() {
	noOfLoops=0
	HHH=0 HTT=0 THH=0 THT=0 HTH=0 HHT=0 TTH=0 TTT=0
        while [ $noOfLoops -lt 10 ]
        do
                r=`printf "%s\n" {0..1}{0..1}{0..1} | shuf -n1`
                case $r in
                        $Heads$Heads$Heads)
                                ((HHH++))
                        ;;
                        $Heads$Tails$Tails)
                                ((HTT++))
                        ;;
                        $Tails$Heads$Tails)
                                ((THT++))
                        ;;
                        $Tails$Tails$Heads)
                                ((TTH++))
                        ;;
			$Tails$Heads$Heads)
				((THH++))
			;;
			$Heads$Tails$Heads)
				((HTH++))
			;;
			$Heads$Heads$Tails)
				((HHT++))
			;;
			$Tails$Tails$Tails)
				((TTT++))
			;;
                esac
                ((noOfLoops++))
        done
        HHHpercentage=$(($HHH*10))
        HTHpercentage=$(($HTH*10))
        THHpercentage=$(($THH*10))
        TTHpercentage=$(($TTH*10))
	HHTpercentage=$(($HHT*10))
	THTpercentage=$(($THT*10))
	HTTpercentage=$(($HTT*10))
	TTTpercentage=$(($TTT*10))
        coinTriplet=([HHH]=$HHHpercentage [HTH]=$HTHpercentage [THH]=$THHpercentage [TTH]=$TTHpercentage \
	[HHT]=$HHTpercentage [THT]=$THTpercentage [HTT]=$HTTpercentage [TTT]=$TTTpercentage)
}
Singlet
Doublet
Triplet
