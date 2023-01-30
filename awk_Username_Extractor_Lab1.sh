#!/usr/bin/bash
#======================================================================================

# Name: awk_Username_Extractor_Lab1.sh

# Written by: Samuel Barnett

# Purpose: This is a script to find the most common username being attacked and display the name
# and the number of times it was attacked.

# Useage: ./awk_Username_Extractor_Lab1.sh (one argument)

# Description of argument: The file that you want the program to effect.
#======================================================================================

# Print a message for the user to alert them of what the script is doing.
echo Please enter an file where you want to find the most attacked IP addresses
echo
# Make a temporary file for the top 10 most targeted usernames.
TMPFILE=$(mktemp /tmp/top_10_target_names_XXXXXX.txt)

# Checks if the user has an argument for while file they want to search, if not then it gives an error message and exits.
if [ -z $1 ]; then
	echo You have no argument
	exit 1
fi
# Prints a progress message for the user.
echo finding file...

# Command that uses grep to look for enteries with Failed password for in the give file. It then uses awk to split the columns by
# spaces and prints any username that is not invalid user. it then sorts, counts, and displays the top then more targeted names. Then it
# outputs it to a temporary file to read off.
grep -e "Failed password for" /home/COIS/3380/$1 | awk -F ' ' '$0 !~ /invalid user/ {print $9}'| sort | uniq -c | sort -nr | head -n 10 > $TMPFILE 

### reads off temporary file.
cat $TMPFILE

### removes temporary file now that it's no longer needed.
rm $TMPFILE
