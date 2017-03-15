i2pd-docker
===========

This docker file will download latest i2pd from [its Github](https://github.com/PurpleI2P/i2pd/releases/latest) and install it into a container.

How to install
=======================

* The easiest way to install is using Docker hub:

```
$ docker pull hexaedron/i2pd
```

* Or, if you would like to build the image by yourself, clone this repository and build it:

```
$ mkdir i2pd-docker
$ cd i2pd-docker
$ git clone https://github.com/hexaedron/i2pd-docker.git
$ docker build -t i2pd .
```

How to run
=======================
Just use the `i2pd_docker_start.sh`/`i2pd_docker_stop.sh` scripts from this repository to start and stop the container.
Or, if you prefer doing all the work manually, just type
```
$ docker run --name=i2pd  -td -p 7070:7070 -p 4444:4444 -p 4447:4447 -p 9439:9439 hexaedron/i2pd
```

The console should now be accessible at port 7070 on your host and the http and socks proxies are at ports 4444 and 4447 respectively.

**Please note, that console and proxy services are accessible by everyone, so you may wish to write some iptables rules to limit access to them.**


Troubleshooting
=======================
To view logs of the i2pd daemon, type
```
$ docker logs -t hexaedron/i2pd
```

Comments and feature requests are always welcome.

