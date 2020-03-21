#!/bin/bash -x

#constants
STARTPOSITION=0;
ENDPOSITION=100;
SNAKE=0;
NOPLAY=1;
PLAY=2;

#variables
currentPosition=0;
numberOfTimes=1;
winTimes=0;

#declare array to store win position
declare -A positionArray


#function for array 

function diePosition(){
	positionArray[$numberOfTimes]=$1;
	((numberOfTimes++))
}

#function for player turn
function playerTurn(){
	winTimes=0;
	numberOfTimes=1;
	currentPosition=0;
	while [[ $currentPosition -ne $ENDPOSITION ]]
	do
		rollToPlay=$((RANDOM%3))
		case $rollToPlay in
			$SNAKE)
				randomPosition=$(($((RANDOM%6))+1))
				if [[ $currentPosition -eq 0 || $currentPosition -lt $randomPosition ]]
				then
					diePosition $currentPosition
					currentPosition=$currentPosition;
				else
					diePosition $currentPosition
					currentPosition=$((currentPosition-randomPosition))
				fi
				;;
			$PLAY)
				randomPosition=$(($((RANDOM%6))+1))
				if [ $((ENDPOSITION-currentPosition)) -eq $randomPosition ]
				then
					diePosition $currentPosition
					currentPosition=$((currentPosition+randomPosition))
					((winTimes++))
				elif [ $((ENDPOSITION-currentPosition)) -lt $randomPosition ]
				then
					diePosition $currentPosition
					currentPosition=$currentPosition
					((winTimes++))
				else
					diePosition $currentPosition
					currentPosition=$((currentPosition+randomPosition))
					((winTimes++))
				fi
				;;
			$NOPLAY)
				diePosition $currentPosition
				currentPosition=$((currentPosition+0))
				;;
		esac
	done
	echo $winTimes
}


#start execution
player1WinTime=$( playerTurn $(()) )
player2WinTime=$( playerTurn $(()) )

if [[ $player1WinTime -lt $player2WinTime ]] 
then
	echo "Player 1 wins !"
else
	echo "Player 2 wins !"
fi
