#
# author: Michael Brockus.
# gmail: mailto:michaelbrockus@gmail.com
#
FROM fedora:rawhide

ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

RUN dnf -y update && dnf upgrade --refresh \
    && dnf -y install \
       sudo \
       python3-devel \
       python3-pip \
       mono-devel \
       gcc \
       gcc-c++ \
       gdc \
       rustc \
       mesa-libGLU \
       java-latest-openjdk-devel \
       git \
       ccache \
       cppcheck \
       cargo \
       openssl-devel \
    && dnf -y clean all

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.58.0 \
       pyinstaller==4.0 \
       scan-build==2.0.19 \
       ninja==1.10.0.post2 \
       cmake==3.18.2.post1 \
       PyQt5==5.15.1 \
       pytest==6.1.2 \
       pytest-mock==3.3.1 \
       pytest-xdist==2.1.0 \
       pytest-benchmark==3.2.3 \
       discord.py==1.6.0 \
       python-dotenv==0.15.0
