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
### then run the commands into the terminal and shutdown the system remove the medium used for the live system

```sh
#! /bin/bash

sudo mount /dev/sda<your linux install drive number> /media
sudo mount --bind /dev /media/dev
sudo mount --bind /sys /media/sys
sudo mount --bind /proc /media/proc

# to boot into the drive
sudo chroot /media

# install grub
grub-install /dev/sda


```

## 3. Script to install and setup VSFTPD server

```sh
#! /bin/bash

# Install VSFTPD SERVER
sudo apt install vsftpd
sudo service vsftpd status


# configure firewall
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw allow 990/tcp
sudo ufw allow openssh
sudo ufw enable
sudo ufw status


# create FTP user
sudo adduser ftpuser
sudo mkdir /home/ftpuser/ftp
sudo chown nobody:nogroup /home/ftpuser/ftp
sudo chmod a-w /home/ftpuser/ftp
sudo mkdir /home/ftpuser/ftp/files
sudo chown ftpuser:ftpuser /home/ftpuser/ftp/files


# VSFTPD server configuration
text="listen=NO \nlisten_ipv6=YES \nanonymous_enable=NO \nlocal_enable=YES \nwrite_enable=YES \nlocal_umask=022 \ndirmessage_enable=YES \nuse_localtime=YES \nxferlog_enable=YES \nconnect_from_port_20=YES \nchroot_local_user=YES \nsecure_chroot_dir=/var/run/vsftpd/empty \npam_service_name=vsftpd \nforce_dot_files=YES \npasv_min_port=40000 \npasv_max_port=50000 \nuser_sub_token=$USER \nlocal_root=/home/$USER/ftp"
mv /etc/vsftpd.conf /etc/vsftpd.conf.origin # saving the defalut configuration to new file
sudo echo $text > /etc/vsftpd.conf


# start the service
sudo systemctl restart vsftpd.service
```

[Checkout the playlist more more info](https://www.youtube.com/playlist?list=PLeiTQKKRIIRoKMuCrsb80Rx2E1F2g6RbT)
<br>

## 3. Script to create a flutter project with some boiler plate setup

```sh
RED='\e[0;1;31m'
NC='\e[0m' # No Color
YELLOW='\e[0;1;33m'
LIGTHGREEN='\e[0;1;92m'
LIGHTBLUE='\e[0;1;94m'

echo "${LIGHTBLUE}"

if [ "$1" != "" ]; then
    flutter create $1

    echo "${YELLOW}Initial flutter setup ready!${NC}"

    rm "$1/lib/main.dart"
    mkdir "$1/lib/pages"
    mkdir "$1/lib/theme"
    mkdir "$1/lib/utils"
    mkdir "$1/lib/widgets"

    # HOME_PAGE DONE
    echo "import 'package:flutter/material.dart';\n\nclass HomePage extends StatelessWidget {\n  const HomePage({Key? key}) : super(key: key);\n\n  @override\n  Widget build(BuildContext context) {\n    return Scaffold();\n  }\n}" > "$1/lib/pages/home_page.dart"

    # THEME DONE
    echo "import 'package:flutter/material.dart';\nimport 'package:flutter/services.dart';\n\nclass MyThemes {\n  static final darkTheme = ThemeData(\n    brightness: Brightness.dark,\n    primarySwatch: Colors.indigo,\n    scaffoldBackgroundColor: Colors.grey.shade900,\n    appBarTheme: AppBarTheme(\n      elevation: 0,\n      centerTitle: true,\n      foregroundColor: Colors.white,\n      backgroundColor: Colors.grey.shade900,\n      systemOverlayStyle: SystemUiOverlayStyle(\n        statusBarColor: Colors.grey.shade900,\n        statusBarIconBrightness: Brightness.light,\n      ),\n    ),\n  );\n  static final lightTheme = ThemeData(\n    brightness: Brightness.light,\n    primarySwatch: Colors.indigo,\n    scaffoldBackgroundColor: Colors.grey.shade100,\n    appBarTheme: AppBarTheme(\n      elevation: 0,\n      centerTitle: true,\n      foregroundColor: Colors.black,\n      backgroundColor: Colors.grey.shade100,\n      systemOverlayStyle: SystemUiOverlayStyle(\n        statusBarColor: Colors.grey.shade100,\n        statusBarIconBrightness: Brightness.dark,\n      ),\n    ),\n  );\n}"  > "$1/lib/theme/theme.dart"

    # MAIN DONE
    echo "import 'package:flutter/material.dart';\nimport 'package:flutter/services.dart';\nimport 'package:$1/theme/theme.dart';\nimport 'package:$1/pages/home_page.dart';\n\n\nmain() {\n  WidgetsFlutterBinding.ensureInitialized();\n  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);\n  return runApp(const App());\n}\n\nclass App extends StatelessWidget {\n  const App({Key? key}) : super(key: key);\n\n  @override\n  Widget build(BuildContext context) {\n    return MaterialApp(\n      debugShowCheckedModeBanner: false,\n      theme: MyThemes.lightTheme,\n      darkTheme: MyThemes.darkTheme,\n      home: HomePage(),\n    );\n  }\n}" > "$1/lib/main.dart"

    echo "${LIGTHGREEN}DONE!${NC}"
else
    echo "${RED}\nProvide the application name!${NC}"
fi

```
<br>
