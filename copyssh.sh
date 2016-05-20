#!/bin/bash
clear
echo ""
echo "   _____ ____  _______     __   _____  _____ _    _  "
echo "  / ____/ __ \|  __ \ \   / /  / ____ / ____| |  | | "
echo " | |   | |  | | |__) \ \_/ /  | (___ | (___ | |__| | "
echo " | |   | |  | |  ___/ \   /    \___ \ \___ \|  __  | "
echo " | |___| |__| | |      | |     ____) | ___) | |  | | "
echo "  \_____\____/|_|      |_|    |_____/ \____/|_|  |_| "
echo "                                                     "
echo "                              By - Mark Dinsen-Hansen"
echo ""
echo ""
echo ""
echo "Thank you for using this SSH-Key copy script"
echo ""
echo ""
echo -n "Press ENTER to continue"
read input
clear
echo ""
echo "   _____ ____  _______     __   _____  _____ _    _  "
echo "  / ____/ __ \|  __ \ \   / /  / ____ / ____| |  | | "
echo " | |   | |  | | |__) \ \_/ /  | (___ | (___ | |__| | "
echo " | |   | |  | |  ___/ \   /    \___ \ \___ \|  __  | "
echo " | |___| |__| | |      | |     ____) | ___) | |  | | "
echo "  \_____\____/|_|      |_|    |_____/ \____/|_|  |_| "
echo "                                                     "
echo "                              By - Mark Dinsen-Hansen"
echo ""
echo ""
echo ""
echo -n "Do you want to create new SSH-Keys? [Y/N]: "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        clear
        echo ""
        echo "   _____ ____  _______     __   _____  _____ _    _  "
        echo "  / ____/ __ \|  __ \ \   / /  / ____ / ____| |  | | "
        echo " | |   | |  | | |__) \ \_/ /  | (___ | (___ | |__| | "
        echo " | |   | |  | |  ___/ \   /    \___ \ \___ \|  __  | "
        echo " | |___| |__| | |      | |     ____) | ___) | |  | | "
        echo "  \_____\____/|_|      |_|    |_____/ \____/|_|  |_| "
        echo "                                                     "
        echo "                              By - Mark Dinsen-Hansen"
        echo ""
        echo ""
        echo ""
        ssh-keygen -t rsa


else
        clear
        echo ""
        echo "   _____ ____  _______     __   _____  _____ _    _  "
        echo "  / ____/ __ \|  __ \ \   / /  / ____ / ____| |  | | "
        echo " | |   | |  | | |__) \ \_/ /  | (___ | (___ | |__| | "
        echo " | |   | |  | |  ___/ \   /    \___ \ \___ \|  __  | "
        echo " | |___| |__| | |      | |     ____) | ___) | |  | | "
        echo "  \_____\____/|_|      |_|    |_____/ \____/|_|  |_| "
        echo "                                                     "
        echo "                              By - Mark Dinsen-Hansen"
        echo ""
        echo ""
        echo ""
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
        echo ""
        echo "   _____ ____  _______     __   _____  _____ _    _  "
        echo "  / ____/ __ \|  __ \ \   / /  / ____ / ____| |  | | "
        echo " | |   | |  | | |__) \ \_/ /  | (___ | (___ | |__| | "
        echo " | |   | |  | |  ___/ \   /    \___ \ \___ \|  __  | "
        echo " | |___| |__| | |      | |     ____) | ___) | |  | | "
        echo "  \_____\____/|_|      |_|    |_____/ \____/|_|  |_| "
        echo "                                                     "
        echo "                              By - Mark Dinsen-Hansen"
        echo ""
        echo ""
        echo ""
        echo -n "Receiver Username: "
        read name
        name=${name// /_}

        sudo ssh-copy-id $name@$ip

        clear
        echo ""
        echo "   _____ ____  _______     __   _____  _____ _    _  "
        echo "  / ____/ __ \|  __ \ \   / /  / ____ / ____| |  | | "
        echo " | |   | |  | | |__) \ \_/ /  | (___ | (___ | |__| | "
        echo " | |   | |  | |  ___/ \   /    \___ \ \___ \|  __  | "
        echo " | |___| |__| | |      | |     ____) | ___) | |  | | "
        echo "  \_____\____/|_|      |_|    |_____/ \____/|_|  |_| "
        echo "                                                     "
        echo "                              By - Mark Dinsen-Hansen"
        echo ""
        echo ""
        echo ""
        echo "SSH KEY HAS BEEN COPIED TO $name at $ip!"
        echo -n "Press ENTER to exit! "
        read input
        clear
fi
