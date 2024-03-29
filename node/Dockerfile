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

# IRI version as used in the file name
ENV IRI_VERSION 1.5.3

# IRI version as used in the path on Github (sometimes less precise, e.g. "1.3" when the version is "1.3.0")
#ENV PATH_VERSION 1.3
ENV PATH_VERSION ${IRI_VERSION}

ENV IRI_JAR_NAME iri-${IRI_VERSION}.jar

# "v" added since 1.2.0
ENV GITHUB_DOWNLOAD_PATH https://github.com/iotaledger/iri/releases/download/v

# Use "sh", "-c", "... $VAR" to effect variable substitution
# https://docs.docker.com/engine/reference/builder/#run
# There likely is an easier way to do this within the Dockerfile.
RUN ["sh", "-c", "echo IRI environment variables:"]
RUN ["sh", "-c", "echo $IRI_VERSION"]
RUN ["sh", "-c", "echo $IRI_JAR_NAME"]

RUN ["sh", "-c", "mkdir /iri"]
RUN ["sh", "-c", "echo curl -L -o /iri/${IRI_JAR_NAME} ${GITHUB_DOWNLOAD_PATH}${PATH_VERSION}/${IRI_JAR_NAME}" ]

RUN ["sh", "-c", "curl -L -o /iri/${IRI_JAR_NAME} ${GITHUB_DOWNLOAD_PATH}${PATH_VERSION}/${IRI_JAR_NAME}" ]


# Verify release
RUN ["sh", "-c", "curl -L -o /iri/${IRI_JAR_NAME}.asc ${GITHUB_DOWNLOAD_PATH}${PATH_VERSION}/${IRI_JAR_NAME}.asc" ]

RUN ["sh", "-c", "curl https://keybase.io/paulhandy/pgp_keys.asc | gpg --import" ]

# Show contents of IRI folder for debugging
RUN ["sh", "-c", "echo Contents of /iri:"]
RUN ["sh", "-c", "ls -la /iri"]

# GPG check disabled. Mechanism has changed: sha256-sum of the files with a GPG sig is published in a file called 
# SHA256SUM.asc. So check needs to become:
# 1. check GPG sig of SHA256SUM.asc
# 2. check whether sha256 ${IRI_JAR_NAME} equals the one in the file (grep {sha256 result} ${IRI_JAR_NAME} SHA256SUM.asc)
# RUN ["sh", "-c", "gpg --verify /iri/${IRI_JAR_NAME}.asc /iri/${IRI_JAR_NAME}"]


COPY config/iri.ini /iri/

# Start any other commands/services here. Last command needs to keep running.

# Start iri with the right data dir
#  -Djava.net.preferIPv4Stack=true to prevent only binding to ipv6 localhost
# Remote authentication, sets HTTP auth which is currently not supported by wallets.
# --remote-auth ovuser:abcde
CMD ["sh", "-c", "service rinetd start && java -Djava.net.preferIPv4Stack=true -jar /iri/${IRI_JAR_NAME} -c /iri/iri.ini --remote ${IRI_ADDITIONAL_OPTIONS}"]


#CMD service rinetd start && tail -f /var/log/dmesg

