## BASH
#### Script to connect an Android device wirelessly [Can be used for file transferring aswell as for dev]
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
