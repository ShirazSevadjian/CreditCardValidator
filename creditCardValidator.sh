#!/bin/bash


#==================== creditCardValidator.sh ====================#
# - Author: Shiraz Sevadjian
#
# - Description: 
#   Bash script to validate credit card numbers using
#   Luhn's Algorithm also known as the "modulus 10" algorithm
#
# - Usage:
#   "./creditCardValidator.sh [credit_card_number]"
#   Example: ./creditCardValidator.sh 4100212036180976
#================================================================# 


#Clear the screen
clear && printf '\e[3J'

echo "================================================================"
echo ""

COLUMNS=$(tput cols) 
title="
     ___ ___  __   __    _ _    _      _            
    / __/ __|_\ \ / /_ _| (_)__| |__ _| |_ ___ _ _  
   | (_| (_|___\ V / _\` | | / _\` / _\` |  _/ _ \'_| 
    \___\___|   \_/\__,_|_|_\__,_\__,_|\__\___/_|"                                                
 

printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"


#Stores the input into the variable called number
number=$1

#Validates the number of arguments passed to the script.
#If more or less than 1 argument is passed, display error and terminate.
if [[ $# -ne 1 ]]; then
  printf "[Error] Invalid number of arguments.\n" >&2
  printf "Correct usage: .\creditCardValidator.sh [credit_card_number]\n" >&2
  exit 1
fi

#Validates if the argument passed is an integer using regular expression
#If its not an integer, display error and terminate.
if ! [[ $1 =~ ^[0-9]+$ ]] ; 
  then 
    printf "[Error] Argument must be a number.\n"; 
    printf "Correct usage: .\creditCardValidator.sh [credit_card_number]\n" >&2
    exit 1
fi



echo "Input number: $1"











