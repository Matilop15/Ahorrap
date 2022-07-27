#!/bin/bash

# Scprit that execute all files for update all products
cd Ahorrapp/back-end
python3 manage.py disco_update
disco="$(echo $?)"
if [ $disco -eq 0 ]
then
    echo "Disco update ok"
else
    (echo -e "Subject: Disco update error \n\n";) | sendmail 3959@holbertonschool.com

fi

python3 manage.py geant_update
geant="$(echo $?)"
if [ $geant -eq 0 ]
then
    echo "Geant update ok"
else
    (echo -e "Subject: Geant update error \n\n";) | sendmail 3959@holbertonschool.com

fi

python3 manage.py tata_update
tata="$(echo $?)"
if [ $tata -eq 0 ]
then
    echo "Tata update ok"
else
    (echo -e "Subject: Tata update error \n\n";) | sendmail 3959@holbertonschool.com

fi

python3 manage.py tienda_update
tienda="$(echo $?)"
if [ $tienda -eq 0 ]
then
    echo "Tienda update ok"
else
    (echo -e "Subject: Tienda update error \n\n";) | sendmail 3959@holbertonschool.com

fi