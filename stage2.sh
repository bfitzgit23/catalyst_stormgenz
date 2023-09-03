#!/bin/bash
merge-usr
dracut --force --no-hostonly --kver $(ls /lib/modules/)
echo "root:xinnixos-user" | chpasswd
chown root:root /etc/sudoers

cp /etc/passwd /.xinnixos-user/etc/passwd
cp /etc/shadow /.xinnixos-user/etc/shadow

echo "xinnixos-user:x:1000:1000::/home/xinnxos-user:/bin/bash" >> /.xinnixos-user/etc/passwd
echo "xinnixos-user:$6$ovJXS/P4rKaURNaD$IUmaP2JW5uiJgrFVr31bEMb6kEF.ARL.x23m.qvyJ3.oRRbJ1qQ/pU5R2VocEzunYqSGF/YvLFGqF5gn0BQY90:19574::::::" >> /.xinnixos-user/etc/shadow

sed s/wheel:x:10:root/wheel:x:10:root,xinnixos-user/ /etc/group > /.xinnixos-user/etc/group
echo "xinnixos-user:x:1000:" >> /.xinnixos-user/etc/group

chown 1000:1000 -R /.xinnixos-user/home/xinnixos-user

groupadd -r autologin
gpasswd -a xinnixos-user autologin

groupadd -r nopasswdlogin
gpasswd -a xinnixos-user nopasswdlogin

cp /usr/share/i18n/SUPPORTED /etc/locale.gen
locale-gen

rm /boot/*.old

#cp /usr/local/bin/xinnixos-installer /usr/local/bin/xinnixos-installer
cp /boot/vmlinuz* /boot/vmlinuz
cp /boot/initramfs* /boot/initramfs.img
cp /boot/System* /boot/System.map
cp /boot/config* /boot/config
cp -R /boot/grub/* /boot/grub/
cp -afR /usr/share/calamares/* /usr/share/calamares/
cp -af /usr/share/applications/calamares.desktop /home/xinnixos-user/Desktop
#cp -af /usr/share/applications/install_xinnixos.Desktop /home/xinnixos-user/Desktop
chown -R xinnixos-user:xinnixos-user /home/xinnixos-user/Desktop/

flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo

chown --from=1001:1001 root:root /etc -R
chown --from=1001:1001 root:root /
chown --from=1001:1001 root:root /boot -R
chown --from=1001:1001 root:root /overlay -R
chown --from=1001:1001 root:root /roots -R
chown --from=1001:1001 root:root /usr -R
chown --from=1001:1001 root:root /var -R

plymouth-set-default-theme natural-gentoo-remastered

grub-mkconfig -o /boot/grub/grub.cfg && dracut --force --no-host-only --kver $(ls /lib/modules/)

eix-update

xdg-user-dirs-update

ksuperkey -e 'Control_L=Escape;Super_L=Alt_L|F1'
