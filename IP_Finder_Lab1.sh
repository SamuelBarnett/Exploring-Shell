#!/usr/bin/bash
#====================================================================================
# Name : IP_Finder_Lab1.sh

# Written by: Samuel Barnett

# Purpose : This is a script to find the most common username being attacked and then find the
# source of that attack geographically.

# Useage : ./IP_Finder_Lab1.sh (one argument)

# Description of argument: The file that you want the program to effect.
#====================================================================================

### Print a message for the user to alert them of what the script is doing.
echo Please enter an file where you want to find the most attacked IP addresses
echo
### Make a temporary file for the top 10 most targeted IPs.
TMPFILE=$(mktemp /tmp/top_ten_ip_XXXXXX.txt)

### Checks if the user puts in a first argument and puts an error message if they have not
if [ -z $1 ]; then
	echo You have no argument
	exit 1
fi
### A progress message for the user.
echo finding file...

### command using grep to find the IP addresses that have Failed password for in the name. Then, extracting the IP address using grep.
### It then sorts then found IPs, counts the unique IPs, sorts them by number, displays the top 10 IPs, and outputs to a temporary file.
grep -e "Failed password for" /home/COIS/3380/$1 | grep -o -e "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"| sort | uniq -c | sort -nr | head -n 10 > $TMPFILE 

### Reads off the Top ten Ip addresses.
cat $TMPFILE

### Removes temporary file.
rm $TMPFILE

