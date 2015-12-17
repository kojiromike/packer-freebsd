all: build vagrant-add

build: freebsd.json provisioners/*
	packer build -force freebsd.json

vagrant-add: Vagrantfile.template packer_virtualbox-iso_virtualbox.box
	vagrant box add -f --name kojiromike/freebsd-10.2 packer_virtualbox-iso_virtualbox.box
