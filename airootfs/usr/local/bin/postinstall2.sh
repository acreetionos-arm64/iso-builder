# post script for  acreetion os cinnamon edition
# written by: Darren Clift
# copyright (C) 2025

# Get true home directory

 name=$(ls -1 /home)
 REAL_NAME=/home/$name

# make directories!

mkdir /home/$name/.config
mkdir /home/$name/.config/nemo
mkdir -p /usr/share/backgrounds
mkdir -p /usr/share/backgrounds

# change owners to corrected users

chown -R $name:$name /home/$name/.config
chown -R $name:$name /middle.png

# copy files

cp -r /cinnamon-configs/.bashrc /home/$name/.bashrc
cp -r /cinnamon-configs/.bashrc /root
cp -r /cinnamon-configs/AcreetionOS.txt /root
cp -r /cinnamon-configs/AcreetionOS.txt /home/$name/AcreetionOS.txt
cp -r /backgrounds /usr/share/backgrounds
cp /etc/pacman2.conf pacman.conf
cp /mkinitcpio/mkinitcpio.conf /etc/mkinitcpio.conf
cp /mkinitcpio/archiso.conf /etc/mkinitcpio.conf.d
cp /cinnamon-configs/.nanorc /home/$name/.nanorc

# fix root problems and sets echo password field. 

chsh -s /bin/bash root
echo "Defaults pwfeedback" | sudo EDITOR='tee -a' visudo >/dev/null 2>&1

# Fix network issues!

mv /resolv.conf /etc/resolv.conf
chattr +i /etc/resolv.conf
chattr +i /etc/os-release

# remove copy dirs and files

rm -rf /backgrounds
rm -rf /mkinitcpio
rm -rf cinnamon-configs
