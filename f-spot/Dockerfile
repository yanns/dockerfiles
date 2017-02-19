# to buid the container:
#  docker build -t yanns/f-spot .

# to run the container:
#  docker run -it \
#	-e DISPLAY=$DISPLAY \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-v $HOME/.config/f-spot:/root/.config/f-spot \
#	-v $HOME/Pictures/Photos:$HOME/Pictures/Photos \
#	--name fspot \
#	yanns/f-spot

# Solution to "Gtk-WARNING **: cannot open display: :0"
#  xhost local:root


FROM ubuntu:14.04
MAINTAINER Yann Simon <yann.simon.fr@gmail.com>

RUN apt-get update && apt-get install -y f-spot gnome-icon-theme

# Autorun chrome
ENTRYPOINT [ "f-spot" ]
CMD [ "--photodir=/home/partage/Photos" ]


