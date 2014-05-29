#
# VERSION               0.0.1

FROM     ubuntu:14.04
MAINTAINER Jae Choi "jaekun.choi@gmail.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd 
RUN echo 'root:node' |chpasswd

RUN apt-get install -y apt-get install python-software-properties software-properties-common 
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y python g++ make nodejs

EXPOSE 22
CMD    /usr/sbin/sshd -D

