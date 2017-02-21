# to buid the container:
#  docker build -t yanns/f-spot .

# to publish the container:
#  docker push yanns/f-spot

FROM yanns/gosu
MAINTAINER Yann Simon <yann.simon.fr@gmail.com>

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends f-spot \
    && rm -rf /var/lib/apt/lists/* \

CMD [ "f-spot" ]
