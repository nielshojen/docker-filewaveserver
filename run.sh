#!/bin/bash

/etc/init.d/fw-server start
/usr/bin/tail -F /private/var/log/fwxserver.log
