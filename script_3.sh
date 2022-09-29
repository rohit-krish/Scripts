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
