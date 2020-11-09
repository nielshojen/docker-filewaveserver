#!/bin/bash

# Make sure all is good if server or config data is mounted to host dir
if [[ ! $(/bin/ls -A /usr/local/etc 2>/dev/null) ]] || [[ ! $(/bin/ls -A /usr/local/filewave 2>/dev/null) ]] || [[ ! $(/bin/ls -A /usr/local/filewave/fwxserver 2>/dev/null) ]]; then
  echo "### Reinstalling because some files are missing. Probably because some servers/files have been mounted to host. ###"
  yum reinstall -y --nogpgcheck https://fwdl.filewave.com/${FWSERVER_VERSION}/fwxserver-${FWSERVER_VERSION}-1.0.x86_64.rpm
fi

# Setup the backup
if [ $FWSERVER_BACKUP -eq 1 ]; then
  echo "### Enabling Backup ###"
  /backup_server_osx_linux.sh setup daily /backup
fi

# Make sure we're up
if [[ ! $(/etc/init.d/fw-server status | /usr/bin/grep running) ]]; then
  echo "### Server is not running. Starting it up ###"
  /etc/init.d/fw-server start
fi

# Tail out the log for convenience
echo "### Starting log tail ###"
/usr/bin/tail -F /private/var/log/fwxserver.log
