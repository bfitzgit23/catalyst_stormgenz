subarch: amd64
version_stamp: stormgenz-2024-08-31
target: livecd-stage2
rel_type: default
profile: default/linux/amd64/23.0/desktop
snapshot_treeish: 3bb0eb438dd6b079945498ffcddf13f0475b9fcc
source_subpath: default/livecd-stage1-amd64-xfce-latest
portage_confdir: /home/gentoo/cataylst-xinnixos/config/stages/
repos: /home/gentoo/catalyyst_stormgenz/overlay/var/db/repos/edgets
      /home/gentoo/catalyyst_stormgenz/root_overlay/var/db/repos/guru
      /home/gentoo/catalyyst_stormgenz/root_overlay/var/db/repos/steam-overlay
    /home/gentoo/catalyyst_stormgenz/root_overlay/var/db/repos/tatsh-overlay

livecd/bootargs: overlayfs nodhcp dokeymap dodetect dousb quiet splash zram.num_devices=1
livecd/depclean: no
livecd/fstype: squashfs
livecd/iso: /home/gentoo/Desktop/XinnixOS-XFCE-latest.iso
livecd/type: gentoo-release-livecd
livecd/volid: XinnixOS-XFCE_LiveDVD_2024-02-26
livecd/readme: Welcome to XinnixOS, making Gentoo GNU/Linux easy for anyone, pro or newbie! Containing the famous calamares installer, a highly customized XFCE desktop, bash aliases in the users .bashrc in their home directory, oh-my-bash to simplify bash usage and more!
livecd/motd: "Welcome to XinnixOS-XFCE"
livecd/root_overlay: /home/gentoo/cataylst-xinnixos/root_overlay
livecd/overlay: /home/gentoo/cataylst-xinnixos/root_overlay
livecd/users: xinnixos-user
livecd/xsession: xfce
livecd/xdm: lightdm
livecd/gk_mainargs: --plymouth --plymouth-theme=vortex-gentoo

livecd/fsscript: /home/gentoo/cataylst-xinnixos/stage2.sh
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
boot/kernel/gentoo/config: /home/gentoo/cataylst-xinnixos/kconfig/xinnixos-6.6.7-XinnixOS

livecd/root_overlay: /home/gentoo/catalyyst_stormgenz/root_overlay
