## 1. Script to connect an Android device wirelessly
#### ie:- I use this script to connect my physical device for flutter dev.
```sh
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


```
> - Just create a file<br>
> - Copy the lines to that file<br>
> - Make it executable<br>
> - Add the file to your path<br>
> - Now execute whenever you want<br>


```sh
touch <filename.sh>
```
```sh
chmod +x <filename>
export PATH="$PATH:<path_to_the_file>"
```
> Execute
``` sh
<filename> <your_local_ip>
```
## 2. Script to install grub boot loader if it crashed
### first you need to boot into a live linux system
### then run the commands into the terminal and shutdown the system remove the mediam used for the live system
