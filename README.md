# shellExamples
Examples using shell/bash scripts to do various things like login, etc.

To connect to an OpenVPN VPN named 'myVPN'

```
$ osascript myVPN-connect.txt
```

To disconenct from an OpenVPN VPN named 'myVPN':

```
$ osascript myVPN-disconnect.txt
```

To run the script to keep AnyConnect up (by restarting it every 5 hours):

```
./loop_AnyConnect.sh
```

The signal_example.sh script illustrates the use of the 'trap' command in bash.

```
./signal_example.sh
```

In another terminal, you can run ``kill -USR1 xx`` where xx is the pid of the
process that is running (and sleeping) the signal_example.sh script.

The signal_example.sh script illustrates a "pause" function that you can use for debugging
your scripts.  Simply include this function and call the ``pause`` function to hold execution
of your script, "look around" to see if your script is doing the right things, and then do a
``kill -USR1 xx``, as mentioned in the output, when you are ready to resume execution.

For example, in a script, you might want to run a Kubernetes deployment, pause, check that all
pods are Running, run a rolling upgrade, pause, watch the rolling upgraded to ensure the correct
number of pods are available, pause, etc.  For every "pause", you can use the ``pause``
function; when you want the script to continue, you run ``kill -USR1 xx``.

