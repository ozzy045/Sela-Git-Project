#!/bin/bash

# Exit codes:
# 0: Everything is ok
# 1: Password is not permitted

# The text output will be listed as the password error

# The red, green and clear variables get the relevant color code 

# len gets the inputs length

# Argument -f gets a path to password text file.

red='\033[0;31m'
green='\033[0;32m'
clear="\033[0m"
len="${#1}"


  if test $len -ge 10 ; then

      echo "$1" | grep -q [0-9]

       if test $? -eq 0 ; then

               echo "$1" | grep -q [A-Z]

                  if test $? -eq 0 ; then

                      echo "$1" | grep -q [a-z]

                             if test $? -eq 0 ; then
							 
								echo -e "${green}$1${clear}"
                                echo "Valid password"
						    	exit 0

                     
                         else
						   echo -e "${red}$1${clear}"
                           echo "password must include lower case char"
						   exit 1


                         fi
                     else
					   echo -e "${red}$1${clear}"
                       echo "password must include capital char" 
					   exit 1


                   fi
       else
	     echo -e "${red}$1${clear}"
         echo "password must include numbers"   
	     exit 1


       fi

  else
	echo -e "${red}$1${clear}"
    echo "password length should be greater than or equal 10"
	exit 1


  fi
 fi 