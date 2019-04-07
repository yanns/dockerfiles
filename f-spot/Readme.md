Docker container for [f-spot](http://f-spot.org/).

As f-spot is not packaged in current Ubuntu anymore, this container allows to continue using it.

## running on linux

```
docker run -it --rm \
	--network host \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--user "$(id -u):$(id -g)" \
	-v /etc/passwd:/etc/passwd:ro \
	-v $HOME:/home/$USER \
	-v /media/$USER:/media/user \
	--name fspot \
	yanns/f-spot \
	f-spot
```

Solution to `Gtk-WARNING **: cannot open display: :0`
```
xhost local:root
```

### integration

In `/usr/share/applications/f-spot.desktop`

```
[Desktop Entry]
Version=1.0
Name=F-Spot
GenericName=Photo Manager
X-GNOME-FullName=F-Spot Photo Manager
Comment=Organize, enjoy, and share your photos
Exec=run-f-spot
Icon=f-spot
StartupNotify=true
Terminal=true
Type=Application
Categories=Graphics;Photography;GNOME;GTK;
X-GNOME-Bugzilla-Bugzilla=GNOME
X-GNOME-Bugzilla-Product=f-spot
X-GNOME-Bugzilla-Component=General
X-GNOME-Bugzilla-Version=0.8.2
X-GNOME-DocPath=f-spot/f-spot.xml
X-Ubuntu-Gettext-Domain=f-spot

```

(`Terminal=false` for some reasons does not work) 

and
`sudo cp run-f-spot.sh /usr/bin/run-f-spot`

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
