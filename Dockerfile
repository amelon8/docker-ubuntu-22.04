FROM ubuntu:22.04
MAINTAINER Bob Le "amelon@gmail.com"


#------------------------------------------------------------------------------
# Core tools
#------------------------------------------------------------------------------

RUN apt update \
    && apt install -y \
              build-essential software-properties-common language-pack-en-base \
              vim git curl \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y python3.11 python3-pip python-is-python3 \
    && pip install --upgrade pip

#------------------------------------------------------------------------------
# Miscellaneous
#------------------------------------------------------------------------------

# Adjust timezone from UTC to PST
RUN mv /etc/localtime /etc/localtime.old \
    && ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

RUN mkdir /code
