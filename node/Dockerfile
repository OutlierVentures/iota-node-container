FROM ubuntu:16.04

MAINTAINER Aron van Ammers, aron@outlierventures.io

# rinetd for access to Mongo port
RUN apt-get update -y && apt-get install rinetd
COPY config/rinetd.conf /etc/

# Get supporting tools
RUN apt-get update -y && apt-get install curl git python build-essential screen -y

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update -y && apt-get install -y nodejs 

# Create user but not the homedir. We'll mount it.
#RUN useradd -s /bin/bash aron
RUN useradd aron

# Start any other commands/services here. Last command needs to keep running.
CMD service rinetd start && tail -f /var/log/dmesg

