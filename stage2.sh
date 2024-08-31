#!/bin/bash

echo Running StormGenz stage2 fsscript ...

source /etc/profile
env-update
source /tmp/envscript

# No we don't want to run xdm...
sed -e '/^DISPLAYMANAGER=/s/.*/DISPLAYMANAGER="lightdm"/' -i /etc/conf.d/display-manager

# Don't let NM change hostname (this breaks xauth)
echo "[main]
plugins=keyfile 
hostname-mode=none" > /etc/NetworkManager/NetworkManager.conf

# Set up stormgenz user
pushd /home/stormgenz
mkdir -pv .config Desktop

# User face image
wget "https://dev.gentoo.org/~bkohler/livegui/face.icon.png" -O .face.icon

# Desktop icon setups
#DESKTOP_APPS=( org.kde.konsole firefox org.kde.dolphin )
#for i in "${APPS[@]}"; do
#	ln -sv /usr/share/applications/${i}.desktop Desktop/
#done

popd
# Clean up perms
cp -aT /etc/skel/* /home/stormgenz

groupadd -r autologin
gpasswd -a stormgenz autologin

groupadd -r nopasswdlogin
gpasswd -a stormgenz nopasswdlogin

cp -af /usr/share/applications/calamares.desktop /home/stormgenz/Desktop/calamares.desktop
chown stormgenz:users /home/stormgenz/Desktop/calamares.desktop
chmod +x /home/stormgenz/Desktop/calamares.desktop

chage -E -1 lightdm

LC_ALL=C xdg-user-dirs-update --force

chown -R stormgenz:users /home/stormgenz

# Let some tools run as root
mkdir -p /etc/polkit-1/rules.d/
echo 'polkit.addRule(function(action, subject) {
    if (action.id == "org.gnome.gparted") {
        return polkit.Result.YES;
    }
});

