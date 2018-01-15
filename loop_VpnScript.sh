#!/bin/bash

# VPN connection is useful and needed.  However, after some number of hours,
# it disconnects.  This means you don't get mail, etc. and you have to
# connect again.  And if you use the GUI app, you have to mouse it, etc.
#
IP=${1:-10.0.0.1}

echo "Determining VPN health based on pings to ${IP}"

cd $(dirname $0)

# idem potent...
osascript myVPN-connect.txt >/dev/null 2>&2

while : ; do

    ((count = 3))                            # Maximum number to try.
    while [[ $count -ne 0 ]] ; do
        ping -c 1 $IP >/dev/null 2>&1        # Try once.
        rc=$?
        if [[ $rc -eq 0 ]] ; then
            sleep 4
            ((count = 1))                    # If okay, flag to exit loop.
        fi
        ((count = count - 1))                # So we don't go forever.
    done

    if [[ $rc -ne 0 ]] ; then                # Make final determination.
        say "oh no! vpn is down"
        osascript myVPN-disconnect.txt >/dev/null 2>&2
        sleep 1
        echo -n "connecting...  "
        osascript myVPN-connect.txt
        date
        sleep 30
    fi

done
