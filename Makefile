VAGRANT_BOX_NAME:='kojiromike/freebsd-10.2'
BOX_FILE=$(wildcard *.box *.lz4)
# 'packer_virtualbox-iso_virtualbox.box'

.PHONY: clean vagrant-add

all: $(BOX_FILE) vagrant-add

$(BOX_FILE): freebsd.json provisioners/*
	packer build -force freebsd.json

vagrant-add: vagrantfile-freebsd-10.2.template packer_virtualbox-iso_virtualbox.box
	vagrant box add -f --name $(VAGRANT_BOX_NAME) packer_virtualbox-iso_virtualbox.box

clean:
	vagrant destroy -f; \
	rm -rf .vagrant $(BOX_FILE)

test: all
	mkdir -p test/manifests; \
	cp vagrantfile-freebsd-10.2.template test/Vagrantfile; \
	cd test; \
	touch manifests/default.pp; \
	vagrant up; \
	vagrant destroy -f;
