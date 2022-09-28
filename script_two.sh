sudo mount /dev/sda<your linux install drive number> /media
sudo mount --bind /dev /media/dev
sudo mount --bind /sys /media/sys
sudo mount --bind /proc /media/proc

# to boot into the drive
sudo chroot /media

# install grub
grub-install /dev/sda
