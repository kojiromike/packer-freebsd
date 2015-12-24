VAGRANT_BOX_NAME:='kojiromike/freebsd-10.2'
BOX_FILE='packer_virtualbox-iso_virtualbox.box'

.PHONY: all clean install test

all: $(BOX_FILE)

$(BOX_FILE):
	packer build -force freebsd.json

install: $(BOX_FILE)
	vagrant box add -f --name $(VAGRANT_BOX_NAME) $(BOX_FILE)

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
