subarch: amd64
version_stamp: stormgenz-<DATE>
target: livecd-stage2
rel_type: default
profile: default/linux/amd64/23.0/desktop
snapshot_treeish: <TREEISH>
source_subpath: default/livecd-stage1-amd64-xfce-latest
portage_confdir: <releng dir>/releases/portage/amd64/livegui

livecd/bootargs: overlayfs nodhcp dokeymap dodetect dousb quiet splash zram.num_devices=1
livecd/depclean: no
livecd/fstype: squashfs
livecd/iso: XinnixOS-XFCE-latest.iso
livecd/type: gentoo-release-livecd
livecd/volid: StormGenZ_LiveDVD_<Date>
livecd/readme: Welcome to StormGenZ, making Gentoo GNU/Linux easy for anyone, pro or newbie! Containing the famous calamares installer, a highly customized XFCE desktop, bash aliases in the users .bashrc in their home directory, oh-my-bash to simplify bash usage and more!
livecd/motd: "Welcome to StormGenZ"
livecd/users: stormgenz-user
livecd/xsession: xfce

livecd/fsscript: /home/bennji/catalyst_stormgenz/stage2.sh
livecd/rcadd: udev|sysinit udev-mount|sysinit acpid|default dbus|default gpm|default NetworkManager|default bluetooth|default elogind|boot alsasound|boot ntpd|default lightdm|default cupsd|default sshd|default ntpd|default syslog-ng|default cronie|default bluetooth|&lt;/nowikidefault samba&lt;nowiki&gt;|default
boot/kernel/gentoo/use: atm png truetype usb plymouth
boot/kernel/gentoo/packages:
net-wireless/b43-fwcutter
net-wirless/broadcom-sta
livecd/empty:
	/var/db/repos
	/usr/src

boot/kernel: gentoo

boot/kernel/gentoo/distkernel: yes
boot/kernel/gentoo/dracut_args: --xz --no-hostonly -a dmsquash-live -a mdraid -o btrfs -o crypt -o i18n -o usrmount -o lunmask -o qemu -o qemu-net -o nvdimm -o multipath -o plymouth -i /lib/keymaps /lib/keymaps -I busybox
boot/kernel/gentoo/packages: sys-fs/zfs
