subarch: amd64
version_stamp: stormgenz-2024-08-31
target: livecd-stage2
rel_type: default
profile: default/linux/amd64/23.0/desktop
snapshot_treeish: 3bb0eb438dd6b079945498ffcddf13f0475b9fcc
source_subpath: default/livecd-stage1-amd64-xfce-latest
portage_confdir: /home/bennji/cataylst-xinnixos/config/stages/
repos: /home/bennji/catalyyst_stormgenz/overlay/var/db/repos/edgets
      /home/bennji/catalyyst_stormgenz/root_overlay/var/db/repos/guru
      /home/bennji/catalyyst_stormgenz/root_overlay/var/db/repos/steam-overlay
    /home/bennji/catalyyst_stormgenz/root_overlay/var/db/repos/tatsh-overlay

livecd/bootargs: overlayfs nodhcp dokeymap dodetect dousb quiet splash zram.num_devices=1
livecd/depclean: no
livecd/fstype: squashfs
livecd/iso: /home/bennji/Desktop/XinnixOS-XFCE-latest.iso
livecd/type: gentoo-release-livecd
livecd/volid: StormGenZ_LiveDVD_2024-08-31
livecd/readme: Welcome to StormGenZ, making Gentoo GNU/Linux easy for anyone, pro or newbie! Containing the famous calamares installer, a highly customized XFCE desktop, bash aliases in the users .bashrc in their home directory, oh-my-bash to simplify bash usage and more!
livecd/motd: "Welcome to StormGenZ"
livecd/root_overlay: /home/bennji/catalyst_stormgenz/root_overlay
livecd/overlay: /home/bennji/catalyst_stormgenz/root_overlay
livecd/users: stormgenz-user
livecd/xsession: xfce

livecd/fsscript: /home/bennji/catalyst_stormgenz/stage2.sh
livecd/rcadd: udev|sysinit udev-mount|sysinit acpid|default dbus|default gpm|default NetworkManager|default bluetooth|default elogind|boot alsasound|boot ntpd|default lightdm|default cupsd|default sshd|default ntpd|default syslog-ng|default cronie|default bluetooth|default samba|default
boot/kernel/gentoo/use: atm png truetype usb plymouth
boot/kernel/gentoo/packages:
	media-libs/alsa-oss
	media-sound/alsa-utils
	media-sound/pulseaudio
### Masked (~amd64)
#	net-dialup/fcdsl
### Masked (~amd64)
#	net-dialup/fritzcapi
### Masked (~amd64)
#	net-dialup/slmodem
### No longer exists
#	net-misc/br2684ctl
### Masked (~amd64)
#	net-wireless/acx
	net-wireless/hostap-utils
#	net-wireless/ipw3945
#	net-wireless/madwifi-ng-tools
#	net-wireless/rt2500
### Masked (~amd64)

livecd/empty:
	/var/db/repos
	/usr/src

boot/kernel: gentoo

boot/kernel/gentoo/distkernel: yes
boot/kernel/gentoo/dracut_args: --xz --no-hostonly -a dmsquash-live -a mdraid -o btrfs -o crypt -o i18n -o usrmount -o lunmask -o qemu -o qemu-net -o nvdimm -o multipath -o plymouth -i /lib/keymaps /lib/keymaps -I busybox
boot/kernel/gentoo/packages: sys-fs/zfs

livecd/root_overlay: /home/bennji/catalyyst_stormgenz/root_overlay
