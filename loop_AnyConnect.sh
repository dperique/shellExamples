#!/bin/bash -x

# AnyConnect is useful and needed.  However, after some number of hours, it
# disconnects.  This means you don't get mail, etc. and you have to connectd
# again.  Any if you use the GUI app, you have to mouse it, etc.
#
# My solution is to just disconnect it and connect it in a predictable way
# so that it will always be available except for that small window where we
# disconnect it.  This was the simplest solution as I didn't feel like adding
# logica to do checks so we can re-connect only if disconnected.
#
while [ 1 ] ; do
  /opt/cisco/anyconnect/bin/vpn disconnect
  /opt/cisco/anyconnect/bin/vpn connect AMERICA
  # sleep for 5 hours (18000 seconds)
  sleep 18000
done
