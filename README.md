# BASH
## Script to connect an Android device wirelessly
#### ie:- I use to connect my physical device for flutter dev.
```sh
#! /bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

adb tcpip 5555
printf "${RED}WAITING TO AGREE PERMISSION...\n${NC}"
sleep 3
adb connect $1:5555
flutter devices

```
> Just create a file
> Copy the lines to that file
> Make it executable
> Add the file to your path
> Now execute whenever you want


```sh
touch <filename.sh>
```
```sh
chmod +x <filename>
export PATH="$PATH:<path_to_the_file>"
```
> Execute
``` sh
<filename> 192.168.43.1
```
