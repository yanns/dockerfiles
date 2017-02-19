Docker container for [f-spot](http://f-spot.org/).

As f-spot is not packaged in current Ubuntu anymore, this container allows to continue using it.

```
docker run -it \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME/.config/f-spot:/root/.config/f-spot \
	-v $HOME/Pictures/Photos:$HOME/Pictures/Photos \
	--name fspot \
	yanns/f-spot
```

Solution to `Gtk-WARNING **: cannot open display: :0`
```
xhost local:root
```
