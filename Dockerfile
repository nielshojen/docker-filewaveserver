FROM centos:centos7

MAINTAINER Niels Højen <niels@hojen.net>

ENV FWSERVER_VERSION 12.7.0

RUN yum -y install wget unzip rsync
RUN wget https://fwdl.filewave.com/$FWSERVER_VERSION/FileWave_Linux_$FWSERVER_VERSION.zip
RUN unzip FileWave_Linux_$FWSERVER_VERSION.zip
RUN rm -f fwbooster-$FWSERVER_VERSION-1.0.x86_64.rpm
RUN yum install -y --nogpgcheck fwxserver-$FWBOOSTER_VERSION-1.0.x86_64.rpm

CMD /usr/local/sbin/fwsxerver

VOLUME /fwxserver
VOLUME /usr/local/etc/fwxserver.conf
VOLUME /usr/local/etc/fwxcodes

EXPOSE 20005
EXPOSE 20006
EXPOSE 20015
EXPOSE 20016
EXPOSE 20017
EXPOSE 20030
EXPOSE 20443
EXPOSE 20445
EXPOSE 20446
