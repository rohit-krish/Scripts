# 1. BASH
## Script to connect an Android device wirelessly
#### ie:- I use this script to connect my physical device for flutter dev.
```sh
#! /bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color
sec=5

adb tcpip 5555

while [ $sec -ge 1 ];do
    echo -ne "${RED}WAITING TO AGREE PERMISSION ...($sec)\033[0K\r${NC}"
    let "sec=sec-1"
    sleep 1
done

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
