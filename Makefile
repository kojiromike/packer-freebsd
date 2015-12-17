all: build vagrant-add

build: freebsd.json provisioners/*
	packer build -force freebsd.json

vagrant-add: vagrantfile-freebsd-10.2.template packer_virtualbox-iso_virtualbox.box
	vagrant box add -f --name kojiromike/freebsd-10.2 packer_virtualbox-iso_virtualbox.box

clean:
	vagrant destroy -f;rm -rf Vagrantfile .vagrant *.lz4 *.box
