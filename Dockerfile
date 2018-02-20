FROM centos:centos7

MAINTAINER Niels Højen <niels@hojen.net>

ENV FWSERVER_VERSION 12.7.0

RUN yum -y install wget unzip rsync initscripts
RUN wget https://fwdl.filewave.com/$FWSERVER_VERSION/FileWave_Linux_$FWSERVER_VERSION.zip
RUN unzip FileWave_Linux_$FWSERVER_VERSION.zip
RUN rm -f fwbooster-$FWSERVER_VERSION-1.0.x86_64.rpm
RUN yum install -y --nogpgcheck fwxserver-$FWSERVER_VERSION-1.0.x86_64.rpm

ADD run.sh /run.sh

VOLUME /fwxserver
VOLUME /usr/local/etc

EXPOSE 20005
EXPOSE 20006
EXPOSE 20015
EXPOSE 20016
EXPOSE 20017
EXPOSE 20030
EXPOSE 20443
EXPOSE 20445
EXPOSE 20446

CMD [ "/run.sh" ]
