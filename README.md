OpenMPI Builder
===============

Compile OpenMPI with ease using Docker
-------------------------------------

Our goal is to make compiling OpenMPI a breeze. Assuming that you have Docker installed,
just type the following into your terminal:

```bash
    $ make image
    $ make binary
```

You'll find the finished package under `packages`.
If you need to download OpenMPI, just type `make download` first.

Docker
------

Installing [Docker](https://www.docker.io) is pretty simple. If you're running
Ubuntu, just type the following into your terminal:

```bash
    $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
    $ sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
    $ sudo apt-get update
    $ sudo apt-get install lxc-docker
```

Afterwards, type `docker info` to verify everything installed correctly. If you're
not running Ubuntu, head over to the [Docker](https://www.docker.io) homepage
for additional instructions.
