#!/bin/bash

# Script to check back(python), front(node) server and nginx server
# If the server are running, kill session

# front server
curl -I --silent http://127.0.0.1:3000 >> ~/Ahorrapp/serverstatus/frontstatus.txt
frontcode="$(echo $?)"

# back server
curl -I --silent http://127.0.0.1:8000 >> ~/Ahorrapp/serverstatus/backstatus.txt
backcode="$(echo $?)"

if [ $frontcode -eq 0 ] || [ $backcode -eq 0 ]
then
    echo "Back and Front ok"
else
    tmux kill-session
    tmux kill-session
    # Run front server
    cd ~/Ahorrapp/front-end
    tmux new-session -d 'npm start'
    # Run back server
    cd ~/Ahorrapp//back-end
    tmux new-session -d 'python3 manage.py runserver'
    if [ $frontcode -eq 0 ]
    then
        echo "Back error: Server caido" >> ~/Ahorrapp/serverstatus/date_error.txt
        date >> ~/Ahorrapp/serverstatus/date_error.txt
        (echo -e "Subject: Back Error \n\n"; cat ~/Ahorrapp/serverstatus/date_error.txt) | sendmail 3959@holbertonschool.com
    else
        echo "Front error: Server caido" >> ~/Ahorrapp/serverstatus/date_error.txt
        date >> ~/Ahorrapp/serverstatus/date_error.txt
        (echo -e "Subject: Front Error \n\n"; cat ~/Ahorrapp/serverstatus/date_error.txt) | sendmail 3959@holbertonschool.com
        (echo -e "Subject: Front Error \n\n"; cat ~/Ahorrapp/serverstatus/date_error.txt) | sendmail 3960@holbertonschool.com
        (echo -e "Subject: Front Error \n\n"; cat ~/Ahorrapp/serverstatus/date_error.txt) | sendmail 3964@holbertonschool.com
        (echo -e "Subject: Front Error \n\n"; cat ~/Ahorrapp/serverstatus/date_error.txt) | sendmail 3965@holbertonschool.com
    fi
fi

# NGINX server check
curl -I --silent http://www.ahorrapp.me >> ~/Ahorrapp/serverstatus/nginxstatus.txt
nginxcode="$(echo $?)"

if [ $nginxcode -eq 0 ]
then
    echo "Nginx ok"
else
    echo "Nginx error: Server caido" >> ~/Ahorrapp/serverstatus/date_error.txt
    date >> ~/Ahorrapp/serverstatus/date_error.txt
    (echo -e "Subject: Nginx Error \n\n"; cat ~/Ahorrapp/serverstatus/date_error.txt) | sendmail 3959@holbertonschool.com
    sudo service nginx restart
fi