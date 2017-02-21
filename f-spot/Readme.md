Docker container for [f-spot](http://f-spot.org/).

As f-spot is not packaged in current Ubuntu anymore, this container allows to continue using it.

## running on linux

```
docker run -it --rm \
	-e DISPLAY=$DISPLAY \
	-e LOCAL_USER_ID=`id -u $USER` \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME/.config/f-spot:/home/user/.config/f-spot \
	-v $HOME/Pictures/Photos:/home/user/Pictures/Photos \
	--name fspot \
	yanns/f-spot
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
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME/.config/f-spot:/home/user/.config/f-spot \
	-v $HOME/Pictures/Photos:/home/user/Pictures/Photos \
	--name fspot \
	yanns/f-spot \
	f-spot
xhost -
```

