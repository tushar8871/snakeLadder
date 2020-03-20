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

rollToPlay=$((RANDOM%3))

case $rollToPlay in
	$SNAKE)
		randomPosition=$(($((RANDOM%6))+1))
		currentPosition=$((currentPosition-randomPosition))
		;;
	$PLAY)
		randomPosition=$(($((RANDOM%6))+1))
		currentPosition=$((currentPosition+randomPosition))
		;;
	$NOPLAY)
		currentPosition=$((currentPosition+0))
		;;
esac
