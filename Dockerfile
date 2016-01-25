FROM ubuntu:12.04
#FROM parkayun/ubuntu-11.04
MAINTAINER Tiago Cogumbreiro

RUN apt-get update && \
    mkdir -p /home && \
    apt-get install -y \
      git \
      ocaml \
      build-essential \
      bison \
      flex \
      indent \
    && \
    git clone https://github.com/cogumbreiro/locksmith/

RUN ln -s /usr/lib/ocaml/libcamlstr.a /usr/lib/ocaml/libstr.a && \
    cd locksmith && \
    ./configure && \
    make && \
    mv locksmith lockpick /usr/bin

WORKDIR /home

VOLUME /home

CMD ["bash"]
