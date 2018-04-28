#!/bin/bash

if [ $FWSERVER_BACKUP -eq 1 ]; then
  /backup_server_osx_linux.sh setup daily /backup
fi

/etc/init.d/fw-server start
/usr/bin/tail -F /private/var/log/fwxserver.log
