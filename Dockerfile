# sshd
#
# VERSION               0.0.1

FROM     ubuntu
MAINTAINER Jae Choi "jaekun.choi@gmail.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN DEBCONF_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y curl

# Use nave instead of installing `npm` from the repository. Using nave has less
# dependencies and makes it easier to get the latest version of nodejs/npm.
ADD https://github.com/isaacs/nave/raw/v0.4.5/nave.sh /usr/local/bin/nave
RUN chmod 755 /usr/local/bin/nave

# Install shadowsocks
RUN nave install stable && \
    nave use stable npm install -g shadowsocks@1.4.12

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd 
RUN echo 'root:pass' |chpasswd

EXPOSE 22
CMD    /usr/sbin/sshd -D
