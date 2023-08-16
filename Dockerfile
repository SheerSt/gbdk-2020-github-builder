# Container image that runs your code
FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y make
RUN apt-get install -y python3-pip
RUN python3 -m pip install img2gb
ADD https://github.com/gbdk-2020/gbdk-2020/releases/download/4.0.6/gbdk-linux64.tar.gz gbdk-linux64.tar.gz
RUN tar -xvf gbdk-linux64.tar.gz -C /opt # --strip-components=1 gbdk/bin gbdk/lib gbdk/include
ENV PATH="/opt/gbdk/bin:/opt/gbdk/lib:/opt/gbdk/include:${PATH}"
RUN ls /opt

WORKDIR /github/workspace
RUN ls

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
