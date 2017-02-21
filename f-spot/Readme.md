Docker container for [f-spot](http://f-spot.org/).

As f-spot is not packaged in current Ubuntu anymore, this container allows to continue using it.

## running on linux

```
docker run -it --rm \
	-e DISPLAY=$DISPLAY \
	-e LOCAL_USER_ID=`id -u $USER` \
	-e LOCAL_GROUP_ID=`id -u $GROUP` \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME:/home/user \
	--name fspot \
	yanns/f-spot \
	f-spot
```

Solution to `Gtk-WARNING **: cannot open display: :0`
```
xhost local:root
```

## running on mac

```
xhost +
export XDISPLAY=$(ifconfig en0 | grep "inet " | cut -d " " -f2):0
docker run -it --rm \
	-e DISPLAY=$XDISPLAY \
	-e LOCAL_USER_ID=`id -u $USER` \
	-e LOCAL_GROUP_ID=`id -u $GROUP` \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME:/home/user \
	--name fspot \
	yanns/f-spot \
	f-spot
xhost -
```
