FROM centos:centos7

MAINTAINER Niels Højen <niels@hojen.net>

ENV FWSERVER_VERSION 13.3.1
ENV FWSERVER_BACKUP 0

VOLUME /usr/local/etc
VOLUME /usr/local/filewave
VOLUME /usr/local/filewave/fwxserver
VOLUME /backup

RUN yum -y install wget unzip rsync initscripts
RUN yum install -y --nogpgcheck https://fwdl.filewave.com/${FWSERVER_VERSION}/fwxserver-${FWSERVER_VERSION}-1.0.x86_64.rpm

ADD backup_server_osx_linux.sh /backup_server_osx_linux.sh
ADD run.sh /run.sh

EXPOSE 20005
EXPOSE 20006
EXPOSE 20015
EXPOSE 20016
EXPOSE 20017
EXPOSE 20030
EXPOSE 20443
EXPOSE 20445
EXPOSE 20446

CMD /bin/bash /run.sh
