#!/bin/bash

/etc/init.d/fw-server start
/bin/sleep 10
/usr/bin/tail -F /private/var/log/fwxserver.log
