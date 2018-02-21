FROM debian:jessie
MAINTAINER A. AJJEMAMI adilajjemami@gmail.com

# Install Essentials ...
RUN echo "===> Install essentials ..." 
RUN apt-get update 
RUN apt-get clean


# Install default packages ...
RUN echo "===> Install default packages ..." \ 
 && apt-get install -y curl \
 && apt-get install -y git \
 && apt-get install -y sudo \
 && apt-get install -y zip \
 && apt-get install -y build-essential \
 && apt-get clean 


# Install docker ...
RUN echo "===> Install docker and docker-compose..." \
    && apt-get install apt-transport-https ca-certificates -y \
    && sh -c "echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list" \
    && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && apt-get update \
    && apt-cache policy docker-engine \
    && apt-get install -y docker-engine \
    && service docker start\
    && curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && docker -v \
    && docker-compose -v

# Install nodejs 9.x ...
RUN echo "===> Install nodejs 9.x ..." \
    && curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && node -v