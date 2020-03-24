#!/bin/bash

if  [[ $(git config --global user.name) == "" ]]
then
    echo "It seems Git is not configured on this machine. Please provide the following information.\n"
    read -p 'Set git user.name: ' username       
    git config --global user.name "${username}"     
fi

if [[ $(git config --global user.email) == "" ]]
then
    read -p "Set git user.email: " usermail
    git config --global user.email $usermail
fi


