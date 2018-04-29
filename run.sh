#!/bin/bash

yum install -y --nogpgcheck fwxserver-$FWSERVER_VERSION-1.0.x86_64.rpm

if [ $FWSERVER_BACKUP -eq 1 ]; then
  /backup_server_osx_linux.sh setup daily /backup
fi

if [[ ! $(/etc/init.d/fw-server status | /usr/bin/grep running) ]]; then
fi

#/etc/init.d/fw-server start
/usr/bin/tail -F /private/var/log/fwxserver.log
