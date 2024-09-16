subarch: amd64
version_stamp: stormgenz-09-15-2024
target: livecd-stage2
rel_type: default
profile: 2default/linux/amd64/23.0/desktop
snapshot_treeish: c34f7dd28806f83646e35a497a6e48f777e9de3c
source_subpath: default/livecd-stage1-amd64-xfce-latest
portage_confdir: /home/bennji/catalyst_stormgenz/config/stages
repos: /home/bennji/catalyst_stormgenz/root_overlay/var/db/repos/guru
/home/bennji/catalyst_stormgenz/root_overlay/var/db/repos/tezeta
/home/bennji/catalyst_stormgenz/root_overlay/var/db/repos/tatsh-overlay
/home/bennji/catalyst_stormgenz/root_overlay/var/db/repos/edgets
/home/bennji/catalyst_stormgenz/root_overlay/var/db/repos/steam-overlay


livecd/bootargs: overlayfs nodhcp dokeymap dodetect dousb quiet splash zram.num_devices=1
livecd/depclean: no
livecd/fstype: squashfs
livecd/iso: StormGenz_latest.iso
livecd/type: gentoo-release-livecd
livecd/volid: StormGenZ_LiveDVD_09-15-2024
livecd/readme: Welcome to StormGenZ, making Gentoo GNU/Linux easy for anyone, pro or newbie! Containing the famous calamares installer, a highly customized XFCE desktop, bash aliases in the users .bashrc in their home directory, oh-my-bash to simplify bash usage and more!
livecd/motd: "Welcome to StormGenZ"
livecd/users: gentoo
livecd/xsession: xfce
livecd/xdm: lightdm
livecd/overlay: /home/bennji/catalyst_stormgenz/root_overlay

livecd/fsscript: /home/bennji/catalyst_stormgenz/stage2.sh
livecd/rcadd: udev|sysinit udev-mount|sysinit acpid|default dbus|default gpm|default NetworkManager|default bluetooth|default elogind|boot alsasound|boot ntpd|default lightdm|default cupsd|default sshd|default ntpd|default syslog-ng|default cronie|default bluetooth|&lt;/nowikidefault samba&lt;nowiki&gt;|default
boot/kernel/gentoo/use: atm png truetype usb plymouth
livecd/empty:
	/var/db/repos
	/usr/src

boot/kernel: gentoo

boot/kernel/gentoo/distkernel: yes
boot/kernel/gentoo/dracut_args: --xz --no-hostonly -a dmsquash-live -a mdraid -o btrfs -o crypt -o i18n -o usrmount -o lunmask -o qemu -o qemu-net -o nvdimm -o multipath -o plymouth -i /lib/keymaps /lib/keymaps -I busybox
boot/kernel/gentoo/packages: net-wireless/broadcom-sta
