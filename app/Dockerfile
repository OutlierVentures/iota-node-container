FROM ubuntu:14.04

MAINTAINER Aron van Ammers, aron@outlierventures.io

# Update the image
RUN apt-get update -y

# Get supporting tools
RUN apt-get install curl git python build-essential screen -y \
  && (curl https://install.meteor.com/ | sh)

# Create user but not the homedir. We'll mount it.
#RUN useradd -s /bin/bash aron
RUN useradd aron

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8


