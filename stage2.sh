#!/bin/bash

echo Running gentoo stage2 fsscript ...

source /etc/profile
env-update
source /tmp/envscript

# No we don't want to run xdm...
sed -e '/^DISPLAYMANAGER=/s/.*/DISPLAYMANAGER="lightdm"/' -i /etc/conf.d/display-manager

# Don't let NM change hostname (this breaks xauth)
echo "[main]
plugins=keyfile 
hostname-mode=none" > /etc/NetworkManager/NetworkManager.conf

# Set up gentoo user
pushd /home/gentoo
mkdir -pv .config Desktop

# User face image
cp /etc/skel/.face /home/gentoo/.faace

# Desktop icon setups
#DESKTOP_APPS=( org.kde.konsole firefox org.kde.dolphin )
#for i in "${APPS[@]}"; do
#	ln -sv /usr/share/applications/${i}.desktop Desktop/
#done

popd
# Clean up perms
cp -avRT /etc/skel/* /home/gentoo

groupadd -r autologin
gpasswd -a gentoo autologin

groupadd -r nopasswdlogin
gpasswd -a gentoo nopasswdlogin

cp -af /usr/share/applications/calamares.desktop /home/gentoo/Desktop/calamares.desktop
chown gentoo:users /home/gentoo/Desktop/calamares.desktop
chmod +x /home/gentoo/Desktop/calamares.desktop

chage -E -1 lightdm

LC_ALL=C xdg-user-dirs-update --force

chown -R gentoo:users /home/gentoo

plymouth-set-default-theme natural-gentoo-remastered

# Let some tools run as root
mkdir -p /etc/polkit-1/rules.d/
echo 'polkit.addRule(function(action, subject) {
    if (action.id == "org.gnome.gparted") {
        return polkit.Result.YES;
    }
});

