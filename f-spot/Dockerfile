# to buid the container:
#  docker build -t yanns/f-spot .

# to publish the container:
#  docker push yanns/f-spot

FROM ubuntu:14.04
MAINTAINER Yann Simon <yann.simon.fr@gmail.com>

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends light-themes f-spot gnome-icon-theme \
    && rm -rf /var/lib/apt/lists/*

CMD [ "f-spot" ]
