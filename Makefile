DOCKER_IMAGE := $(USER)/openmpi-builder

default: binary

download: packages
	wget http://www.open-mpi.org/software/ompi/v1.7/downloads/openmpi-1.7.3.tar.gz
	tar -xf openmpi-1.7.3.tar.gz -C $(CURDIR)/packages
packages:
	mkdir packages
image: 
	docker build -rm -t $(DOCKER_IMAGE) .
binary: image packages
	docker run -rm -i -t -privileged  -v "$(CURDIR)/packages:/packages/" "$(DOCKER_IMAGE)"