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

#Print welcome message
echo -e "---------- Credit Card Validator ----------\n"

#Stores the input into the variable called number
number=$1

#Validates the number of arguments passed to the script.
#If more or less than 1 argument is passed, display error and terminate.
if [[ $# -ne 1 ]]; then
  printf "[Error] Invalid number of arguments.\n" >&2
  printf "Correct usage: .\creditCardValidator.sh [credit_card_number]\n" >&2
  printf "\n"
  exit 1
fi

#Validates if the argument passed is an integer using regular expression
#If its not an integer, display error and terminate.
if ! [[ $1 =~ ^[0-9]+$ ]]; then
  printf "[Error] Argument must be a number.\n";
  printf "Correct usage: .\creditCardValidator.sh [credit_card_number]\n" >&2
  printf "\n"
  exit 1
fi

#Print the input number
echo "- Input number: $1"

#Initialize variables
length="${#1}"
sum=0
is_second=0

#Start loop
for (( i=length - 1; i >= 0; i-- )); do

  #Get the current digit at index i
  digit=${1:$i:1}

  #For every second number...
  if (( (length - i) % 2 == 0 )); then

    #Multiply every second digit by 2.
    (( digit *= 2 ))

    #If the length of the digit we multiplied is > 9 (in other words 2 numbers or more), then replace the digit with the sum of those two numbers.
    #Ex: If digit = 15, then make digit = 1+5 = 6
    (( ${#digit} == 2 )) && digit=$(( ${digit:0:1} + ${digit:1:1} ))

  fi

  #Add the digits together
  (( sum += digit ))
done
#End loop


echo -e "- Sum after applying Luhn's Algorithm: $sum\n"

#If the sum mod 10 = 0, then the input is a valid card number as defined by the "modulus 10" algorithm
if [ $((sum % 10)) -eq 0 ]; then
	echo "The card [$1] is a valid card."
else
	echo "The card [$1] is not a valid card."
fi


printf "\n"