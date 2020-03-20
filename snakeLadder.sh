#!/bin/bash -x

#constants
STARTPOSITION=0;
ENDPOSITION=100;

#variables
currentPosition=0;

#start execution here
randomPosition=$(($((RANDOM%6))+1))
