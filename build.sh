sudo catalyst -f stage1-openrc.spec
sudo catalyst -f stage3-openrc.spec
sudo catalyst -f stage4-openrc.spec

tar2sqfs root.img < /var/tmp/catalyst/builds/default/stage4-amd64-openrc-\@TIMESTAMP\@.tar.xz
