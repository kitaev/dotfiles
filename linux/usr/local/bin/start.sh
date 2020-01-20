#!/bin/sh

if ! pgrep -f "^/lib/systemd/systemd$" > /dev/null
then
    /usr/bin/daemonize /usr/bin/unshare -fp --mount-proc /lib/systemd/systemd
else
    echo "systemd is already running"
fi
