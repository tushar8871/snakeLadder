#!/bin/bash -x

#constants
STARTPOSITION=0;
ENDPOSITION=100;
SNAKE=0;
NOPLAY=1;
PLAY=2;

#variables
currentPosition=0;

#start execution here

while [[ $currentPosition -ne $ENDPOSITION ]]
do
	rollToPlay=$((RANDOM%3))
	case $rollToPlay in
		$SNAKE)
			randomPosition=$(($((RANDOM%6))+1))
			if [[ $currentPosition -eq 0 || $currentPosition -lt $randomPosition ]]
			then
				currentPosition=$currentPosition;
			else
				currentPosition=$((currentPosition-randomPosition))
			fi
			;;
		$PLAY)
			randomPosition=$(($((RANDOM%6))+1))
			currentPosition=$((currentPosition+randomPosition))
			;;
		$NOPLAY)
			currentPosition=$((currentPosition+0))
			;;
	esac
done
