#!/bin/bash

topsign='\E[34;34m'"\033[1m\n\n  _____ ____  _______     __   _____  _____ _    _\n / ____/ __ \|  __ \ \   / /  / ____ / ____| |  | |\n| |   | |  | | |__) \ \_/ /  | (___ | (___ | |__| |\n| |   | |  | |  ___/ \   /    \___ \ \___ \|  __  |\n| |___| |__| | |      | |     ____) | ___) | |  | |\n \_____\____/|_|      |_|    |_____/ \____/|_|  |_|\n\n                            By - Mark Dinsen-Hansen \n \n \n \n\033[0m" && tput sgr0
blue="$(tput setaf 4)"
default="$(tput sgr0)"

clear
echo -e "$topsign"
#echo "Thank you for using this SSH-Key copy script"
echo -n "Press ENTER to continue"
read input
clear
echo -e "$topsign"
echo -n "Do you want to create new SSH-Keys? [Y/N]: "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        clear
        echo -e "$topsign"
        ssh-keygen -t rsa


else
        clear
        echo -e "$topsign"
        echo -n "Receiver IP Address: "
        read ip
        if [[ "$ip" =~ ^([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})$ ]]
        then
            for (( i=1; i<${#BASH_REMATCH[@]}; ++i ))
            do
              (( ${BASH_REMATCH[$i]} <= 255 )) || { echo "BAD IP!" >&2; exit 1; }
            done
        else
              echo "BAD IP!" >&2
              exit 1;
        fi
        clear
        echo -e "$topsign"
        echo -n "Reveiver Username: "
        read name
        clear
        echo -e "$topsign"
        name=${name// /_}
        sudo ssh-copy-id $name@$ip
        clear
        echo -e "$topsign"
        echo "SSH KEY HAS BEEN COPIED TO $name at $ip!"
        echo -e "\n\n"
        echo -n "Press ENTER to exit! "
        read input
        clear
fi
