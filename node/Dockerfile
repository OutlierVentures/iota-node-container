FROM ubuntu:16.04

MAINTAINER Aron van Ammers, aron@outlierventures.io

# rinetd for access to Mongo port
RUN apt-get update -y && apt-get install rinetd
COPY config/rinetd.conf /etc/

# Get supporting tools
RUN apt-get update -y && apt-get install software-properties-common curl git python build-essential screen net-tools telnet -y

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update -y && apt-get install -y nodejs 

# Create user but not the homedir. We'll mount it.
#RUN useradd -s /bin/bash aron
RUN useradd aron

# Install Java 8
RUN add-apt-repository -y ppa:webupd8team/java
# Silent install, accept license https://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get update -y && apt-get install -y oracle-java8-installer

# Install iri
ENV IRI_VERSION 1.1.4.1
ENV IRI_JAR_NAME iri-${IRI_VERSION}.jar

# Use "sh", "-c", "... $VAR" to effect variable substitution
# https://docs.docker.com/engine/reference/builder/#run
# There likely is an easier way to do this within the Dockerfile.
RUN ["sh", "-c", "echo IRI environment variables:"]
RUN ["sh", "-c", "echo $IRI_VERSION"]
RUN ["sh", "-c", "echo $IRI_JAR_NAME"]

RUN ["sh", "-c", "mkdir /iri"]
RUN ["sh", "-c", "echo curl -L -o /iri/${IRI_JAR_NAME} https://github.com/iotaledger/iri/releases/download/${IRI_VERSION}/${IRI_JAR_NAME}" ]

RUN ["sh", "-c", "curl -L -o /iri/${IRI_JAR_NAME} https://github.com/iotaledger/iri/releases/download/${IRI_VERSION}/${IRI_JAR_NAME}" ]

COPY config/iri.ini /iri/

# Start any other commands/services here. Last command needs to keep running.

# Start iri with the right data dir
#  -Djava.net.preferIPv4Stack=true to prevent only binding to ipv6 localhost
CMD ["sh", "-c", "service rinetd start && java -Djava.net.preferIPv4Stack=true -jar /iri/${IRI_JAR_NAME} -c /iri/iri.ini --remote"]
# --remote-auth iotatoken:...

#CMD service rinetd start && tail -f /var/log/dmesg

