# to buid the container:
#  docker build -t yanns/gosu .

#  docker push yanns/gosu

# test it:
#  docker run -it yanns/gosu bash
#  Starting with UID:GID : 9001:9001
#  user@846a9433b8d0:/$ id
#  uid=9001(user) gid=9001(user) groups=9001(user)
#
#  docker run -it -e LOCAL_USER_ID=`id -u $USER` -e LOCAL_GROUP_ID=`id -u $GROUP` yanns/gosu bash
#  Starting with UID:GID : 1000:1000
#  user@0f623a17b74f:/$ id
#  uid=1000(user) gid=1000(user) groups=1000(user)

FROM ubuntu:14.04
MAINTAINER Yann Simon <yann.simon.fr@gmail.com>

ENV GOSU_VERSION 1.10
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates wget \
    && rm -rf /var/lib/apt/lists/* \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apt-get purge -y --auto-remove ca-certificates wget

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
