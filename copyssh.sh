#!/bin/bash
echo "Thank you for using this SSH-Key copy script"
echo ""
echo "Press ENTER to continue"
echo ""
read input
echo ""
echo "Do you want to create new SSH-Keys? [Y/N]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

        ssh-keygen -t rsa


else

        echo "Receiver IP Address:"
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

        echo "Receiver Username"
        read name
        name=${name// /_}

        sudo ssh-copy-id $name@$ip

        echo
        echo
        echo
        echo
        echo "---"
        echo "SSH KEY HAS BEEN COPIED TO $name at $ip"
        echo "---"
        echo
        echo
        echo
        echo

fi
