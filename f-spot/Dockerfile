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

RUN apt-get update && \
    apt-get install -y --no-install-recommends light-themes f-spot gnome-icon-theme && \
    mkdir /root/.themes && \
    mkdir /root/.icons && \
    ln -s /usr/share/themes/Ambiance '/root/.themes/Adwaita' && \
    ln -s /usr/share/icons/ubuntu-mono-dark '/root/.icons/Adwaita' && \
    rm -rf /var/lib/apt/lists/*

# Autorun chrome
ENTRYPOINT [ "f-spot" ]
CMD [ "--photodir=/home/partage/Photos" ]


