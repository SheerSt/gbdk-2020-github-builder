# Container image that runs your code
FROM ubuntu

RUN apt-get install software-properties-common
RUN apt-get update

RUN add-apt-repository ppa:ubuntu-toolchain-r/ppa
RUN apt-get update
RUN apt-get install gcc-4.9 g++-4.9

ADD https://github.com/Zal0/gbdk-2020/releases/download/4.0.2/gbdk-linux64.tar.gz /usr/lib/gbdk.tar.gz
RUN tar -xvf /usr/lib/gbdk.tar.gz -C /usr/lib/

COPY ./ /usr/src/gb-app
WORKDIR /usr/src/gb-app

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]