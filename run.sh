#!/bin/bash

# Make sure all is good if server or config data is mounted to host dir
if [[ ! $(/bin/ls -A /usr/local/filewave 2>/dev/null) ]] || [[ ! $(/bin/ls -A /fwxserver 2>/dev/null) ]]; then
  yum reinstall -y --nogpgcheck fwxserver-$FWSERVER_VERSION-1.0.x86_64.rpm
fi

# Setup the backup
if [ $FWSERVER_BACKUP -eq 1 ]; then
  /backup_server_osx_linux.sh setup daily /backup
fi

# Make sure we're up
if [[ ! $(/etc/init.d/fw-server status | /usr/bin/grep running) ]]; then
  /etc/init.d/fw-server start
fi

# Tail out the log for convenience
/usr/bin/tail -F /private/var/log/fwxserver.log
