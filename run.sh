#!/bin/bash

# Make sure all is good if server or config data is mounted to host dir
if [[ ! $(/bin/ls -A /usr/local/filewave) ]] || [[ ! $(/bin/ls -A /fwxserver) ]]; then
  yum reinstall -y --nogpgcheck fwxserver-$FWSERVER_VERSION-1.0.x86_64.rpm
fi

if [ $FWSERVER_BACKUP -eq 1 ]; then
  /backup_server_osx_linux.sh setup daily /backup
fi

if [[ ! $(/etc/init.d/fw-server status | /usr/bin/grep running) ]]; then
  /etc/init.d/fw-server start
fi

/usr/bin/tail -F /private/var/log/fwxserver.log
