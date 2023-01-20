FROM debian:11

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y \
    apt-utils

RUN apt-get install -y \
    git \
    zip \
    wget \
    automake \
    build-essential

RUN apt-get install -y \
    libpng-dev \
    libgl-dev \
    libxrandr-dev \
    libasound2-dev \
    libxcursor-dev \
    gnutls-dev \
    libjpeg-dev \
    libopus-dev \
    libspeex-dev \
    libvorbis-dev \
    libavcodec-dev \
    libspeexdsp-dev \
    libswscale-dev \
    libsdl-dev \
    libopusfile-dev \
    libadplug-dev \
    libavformat-dev \
    libtool

RUN useradd nuclide
RUN mkdir /nuclide
RUN chown nuclide:nuclide /nuclide
USER nuclide
WORKDIR /nuclide

RUN git clone https://github.com/veravisions/nuclide /nuclide

RUN ./build_engine.sh

RUN rm -rf src/
RUN rm -rf .git/
