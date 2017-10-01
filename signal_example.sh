i#!/bin/bash

# This function prints a messages, passed as the first argument, and sleeps
# infinitely until the PAUSE variable is set to 0 by the 'end_pause'
# function.
#
function pause {
  echo $1
  echo "To end the pause, run 'kill -USR1 $$'"
  export PAUSE=1
  while [ 1 ]; do
    if [ $PAUSE -eq 0 ]; then
      break
    fi
    echo "sleeping 1"
    sleep 1
  done
}

# This function is called when the SIGUSR1 signal is detected.
#
function end_pause {
  export PAUSE=0
}

# Listen for SIGUSR1 and run the 'end_pause' function upon
# hearing it.
#
trap end_pause SIGUSR1

echo hello

# Just pause.
#
pause "This is my pause message"

# The pause has ended.
#
echo goodbye

