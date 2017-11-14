#!/bin/bash -x

# AnyConnect is useful and needed.  However, after some number of hours, it
# disconnects.  This means you don't get mail, etc. and you have to connect
# again.  And if you use the GUI app, you have to mouse it, etc.
#
while : ; do

  # inside loop: ensure connection is up every 2 minutes
  while : ; do
    /opt/cisco/anyconnect/bin/vpn status 2>&1 | grep -q -i " disconnected" && break

    # if we got here, conection is up
    sleep 120
  done

  # /opt/cisco/anyconnect/bin/vpn disconnect
  echo connecting...
  /opt/cisco/anyconnect/bin/vpn connect AMERICA || :
  sleep 20
done
