FROM ubuntu:15.04
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
      python \
      ocaml-findlib \
      libyojson-ocaml-dev && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
      ln -s /usr/lib/ocaml/libcamlstr.a /usr/lib/ocaml/libstr.a

RUN git clone https://github.com/cogumbreiro/locksmith/ && \
    cd /locksmith && \
    ./configure

RUN cd /locksmith && make && \
    mv locksmith lockpick /usr/bin

WORKDIR /home

VOLUME /home

CMD ["bash"]
