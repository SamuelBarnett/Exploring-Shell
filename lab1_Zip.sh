#!/usr/bin/bash
#============================================================================================
# name: lab1_Zip.sh

# Written by: Samuel Barnett - September 2022

# Purpose: Zips the file that the user enters as an argument. Will check if the user has
#not entered an argument with an if statement.

# Useage: ./lab1_Zip.sh (one argument)

# Description of argument: The file that you want the program to effect.
#============================================================================================
#Describes script to user
echo This is a script to zip a directory
echo 
# -z: checks if the length of the parameter is 0 in this case a string.
# $1 is the first parameter, If it is empty then it will send an error message and exit the program.
if [ -z $1 ]; then
	echo please supply an argument that is the directory you want to zip
	exit 1
fi

# sets the name for the zipped directory. 
ZIPNAME=${LOGNAME}_$1.zip

# confirms name of file with user.
echo creating the zipped directory $ZIPNAME

# Zips the file name and places it inside the home variable.
zip $HOME/$ZIPNAME $HOME/3380/$1/*
