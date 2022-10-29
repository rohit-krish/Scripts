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
