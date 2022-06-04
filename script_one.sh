# Script 1
#! /bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color
SEC=3

adb tcpip 5555

while [ $SEC -ge 1 ];do
    echo -ne "${RED}WAITING TO AGREE PERMISSION ...($SEC)\033[0K\r${NC}"
    let "SEC=SEC-1"
    sleep 1
done

printf "\033[0K\r"

adb connect $1:5555
flutter devices
