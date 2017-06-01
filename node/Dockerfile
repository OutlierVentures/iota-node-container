FROM ubuntu:16.04

MAINTAINER Aron van Ammers, aron@outlierventures.io

# rinetd for access to Mongo port
RUN apt-get update -y && apt-get install rinetd
COPY config/rinetd.conf /etc/

# Get supporting tools
RUN apt-get update -y && apt-get install curl git python build-essential screen -y \
	&& (curl https://install.meteor.com/ | sh)

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update -y && apt-get install -y nodejs 


# Create user but not the homedir. We'll mount it.
#RUN useradd -s /bin/bash aron
RUN useradd aron

# locale fix for MongoDB (not relevant here)
# Needs to install locales package
#RUN locale-gen en_US.UTF-8
#RUN update-locale LANG=en_US.UTF-8

# Start any other commands/services here. Last command needs to keep running.
CMD service rinetd start && tail -f /var/log/dmesg

