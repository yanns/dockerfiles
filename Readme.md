Docker containers, running GUI programs.

- install docker
```
sudo apt-get install docker.io
```

- add the current user into the `docker` group
```
sudo gpasswd -a ${USER} docker
```

To start a container where we can test our setup:
```
docker run -ti --network host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ubuntu:14.04 bash
$ apt-get update
$ apt-get install -y <package>
$ ...
```

Solution to `Gtk-WARNING **: cannot open display: :0`
```
xhost local:root
```

