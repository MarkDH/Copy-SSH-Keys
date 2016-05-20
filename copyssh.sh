#!/bin/bash

ssh-keygen -t rsa

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
