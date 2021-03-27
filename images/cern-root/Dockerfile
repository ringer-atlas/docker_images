FROM tensorflow/tensorflow:2.4.1-gpu


LABEL maintainer "Joao Victor da Fonseca Pinto <jodafons@lps.ufrj.br>"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TERM screen
USER root
SHELL [ "/bin/bash", "-c" ]


RUN ls
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    python-3.7 \
    python3-pip \
    fonts-freefont-otf \
    git \
    wget \
    dpkg-dev \
    g++ \
    gcc \
    binutils \
    xlibmesa-glu-dev \
    libmysqlclient-dev \
    libx11-dev \
    libxpm-dev \
    libxft-dev \
    libxext-dev \
    gfortran \
    libssl-dev \
    libpcre3-dev \
    libglew1.5-dev \
    libftgl-dev \
    libldap2-dev \
    python-dev \
    libxml2-dev \
    libkrb5-dev \
    libgsl0-dev \
    libqt4-dev \
    libfftw3-dev \
    libcfitsio-dev \
    graphviz-dev \
    libavahi-compat-libdnssd-dev \
    libboost-all-dev \
    vim \
    librange-v3-dev \
    libboost-python-dev && \
    apt-get clean && \
    rm /var/lib/apt/lists/*

# Vim tuning
RUN git clone "https://github.com/amix/vimrc.git" "${HOME}/.vim_runtime"
WORKDIR "${HOME}/.vim_runtime/"
RUN source install_awesome_vimrc.sh

# Installing cmake
WORKDIR /usr
RUN wget --progress=dot:giga https://cmake.org/files/v3.17/cmake-3.19.7-Linux-x86_64.sh -P /usr/
RUN chmod 755 /usr/cmake-3.17.2-Linux-x86_64.sh
RUN ./cmake-3.17.2-Linux-x86_64.sh --skip-license
RUN ln -sf /usr/bin/python3.7 /usr/bin/python

# Install ROOT
WORKDIR /opt
RUN git clone https://github.com/root-project/root.git
WORKDIR /opt/root
RUN git checkout v6-16-00 && mkdir buildthis 
WORKDIR /opt/root/buildthis
RUN CPU_N=$(grep -c ^processor /proc/cpuinfo) && cmake  --Dpython_version=3 .. && make -j$CPU_N

# Clear root installation
RUN mkdir -p /opt/buildthis
RUN \
    mv /opt/root/buildthis/lib /opt/buildthis/. && \
    mv /opt/root/buildthis/include /opt/buildthis/. && \
    mv /opt/root/buildthis/bin /opt/buildthis/. && \
    mv /opt/root/buildthis/etc /opt/buildthis/.
RUN \
    rm -rf /opt/root && \
    mkdir -p /opt/root && \
    mv /opt/buildthis /opt/root/.

RUN ln -sf /usr/bin/pip3 /usr/bin/pip

WORKDIR /
COPY setup_root.sh .
RUN chmod 777 /setup_root.sh
