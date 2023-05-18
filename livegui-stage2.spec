subarch: amd64
version_stamp: xfce-latest
target: livecd-stage2
rel_type: default
profile: default/linux/amd64/17.1/desktop
snapshot: stable.tar.bz2
source_subpath: default/livecd-stage1-amd64-xfce-latest
portage_confdir: /home/ben/releng/releases/portage/livegui
portage_overlay: /home/ben/releng/releases/overlays/common/root_overlay/var/db/repos/gogooverlay/
/home/ben/releng/releases/overlays/common/root_overlay/var/db/repos/r7l/
/home/ben/releng/releases/overlays/common/root_overlay/var/db/repos/steam-overlay/
/home/ben/releng/releases/overlays/common/root_overlay/var/db/repos/waffle-builds/
/home/ben/releng/releases/overlays/common/root_overlay/var/db/repos/stefantalpalaru/
/home/ben/releng/releases/overlays/common/root_overlay/var/db/repos/tezeta/
/home/ben/releng/releases/overlays/common/root_overlay/var/db/repos/bell07/

livecd/bootargs: overlayfs dokeymap dodetect dousb quiet splash zram.num_devices=1 apparmor=1 security=apparmor
livecd/depclean: no
livecd/fstype: squashfs
livecd/iso: livegui-amd64-latest.iso
livecd/type: gentoo-release-livecd
livecd/fsops: -comp zstd
livecd/motd: "Welcome to XinnixOS-Gentoo-XFCE"
livecd/type: generic-livecd
livecd/volid: XinnixOS-Gentoo LiveDVD latest
livecd/xsession: xfce
livecd/xdm: lightdm

livecd/fsscript: /home/ben/releng/releases/specs/amd64/livegui/files/fsscript-stage2.sh
livecd/rcadd: udev|sysinit udev-mount|sysinit acpid|default dbus|default gpm|default NetworkManager|default bluetooth|default elogind|boot alsasound|boot ntpd|default
livecd/unmerge: net-misc/netifrc

livecd/empty:
	/var/db/repos
	/usr/src

boot/kernel: gentoo-kernel-bin

boot/kernel/gentoo-kernel-bin/sources: gentoo-sources
boot/kernel/gentoo-kernel-bin/config: livecd-stage2.config /home/ben/releng/releases/kconfig/amd64/livegui-amd64-5.15.23.config

boot/kernel/gentoo-kernel-bin/packages:
	sys-kernel/dracut
	net-wireless/broadcom-sta
	sys-firmware/broadcom-bt-firmware
	sys-kernel/linux-firmware
	media-sound/alsa-utils
	media-sound/pulseaudio
	sys-fs/ntfs3g
	x11-drivers/xf86-video-amdgpu
	x11-drivers/nvidia-drivers
	x11-drivers/xf86-input-libinput
	x11-drivers/xf86-video-intel
boot/kernel/gentoo-kernel-bin/use: atm png truetype usb plymouth
