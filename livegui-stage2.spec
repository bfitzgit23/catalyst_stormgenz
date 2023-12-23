subarch: amd64
version_stamp: xinnixos-xfce-2023-12-23
target: livecd-stage2
rel_type: default
profile: default/linux/amd64/17.1/desktop
snapshot_treeish: 3bb0eb438dd6b079945498ffcddf13f0475b9fcc.sqfs
source_subpath: default/livecd-stage1-amd64-xfce-latest
portage_confdir: /home/ben/cataylst-xinnixos/config/stages/
repos: /home/ben/catalyst-xinnixos/overlay/var/db/repos/edgets
      /home/ben/catalyst-xinnixos/root_overlay/var/db/repos/guru
      /home/ben/catalyst-xinnixos/root_overlay/var/db/repos/steam-overlay
    /home/ben/catalyst-xinnixos/root_overlay/var/db/repos/tatsh-overlay

livecd/bootargs: overlayfs nodhcp dokeymap dodetect dousb quiet splash zram.num_devices=1
livecd/depclean: no
livecd/fstype: squashfs
livecd/iso: /home/ben/Desktop/XinnixOS-XFCE-latest.iso
livecd/type: gentoo-release-livecd
livecd/volid: XinnixOS-XFCE_LiveDVD_2023-11-01
livecd/readme: Welcome to XinnixOS, making Gentoo GNU/Linux easy for anyone, pro or newbie! Containing the famous calamares installer, a highly customized XFCE desktop, bash aliases in the users .bashrc in their home directory, oh-my-bash to simplify bash usage and more!
livecd/motd: "Welcome to XinnixOS-XFCE"
livecd/root_overlay: /home/ben/cataylst-xinnixos/root_overlay
livecd/overlay: /home/ben/cataylst-xinnixos/overlay
livecd/users: xinnixos-user
livecd/xsession: xfce
livecd/xdm: lightdm
livecd/gk_mainargs: --plymouth --plymouth-theme=vortex-gentoo

livecd/fsscript: /home/ben/cataylst-xinnixos/stage2.sh
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
	/var/tmp
	/var/empty
	/var/run
	/var/state
	/var/cache/edb/dep
	/tmp
	/root/.ccache
	/usr/share/genkernel/pkg/x86/cpio

livecd/rm:
	/etc/*.old
	/root/.viminfo
	/var/log/*.log
	/usr/share/genkernel/pkg/x86/*.bz2

boot/kernel: gentoo

boot/kernel/gentoo/sources: gentoo-sources
boot/kernel/gentoo/config: /home/ben/cataylst-xinnixos/kconfig/xinnixos-6.6.7-XinnixOS

livecd/root_overlay: /home/ben/catalyst-xinnixos/root_overlay
