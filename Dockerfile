FROM base

# This is so that we don't get Upstart error messages
# (specific to running Ubuntu in chroot environment)
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -s /bin/true /sbin/initctl
RUN dpkg-divert --local --rename --add /sbin/mknod && ln -s /bin/true /sbin/mknod

# Fake a fuse install
RUN apt-get install libfuse2
RUN cd /tmp ; apt-get download fuse
RUN cd /tmp ; dpkg-deb -x fuse_* .
RUN cd /tmp ; dpkg-deb -e fuse_*
RUN cd /tmp ; rm fuse_*.deb
RUN cd /tmp ; echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst
RUN cd /tmp ; dpkg-deb -b . /fuse.deb
RUN cd /tmp ; dpkg -i /fuse.deb

# Download the various packages needed
RUN apt-get update;apt-get --yes install autotools-dev autoconf automake g++ gfortran build-essential 
RUN mkdir -p /scripts /packages

# Add the control script to the image. 
ADD ./compile /scripts/

CMD ["/scripts/compile"]
