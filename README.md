# shellExamples
Examples using shell/bash scripts to do various things like login, etc.

To connect to an OpenVPN VPN named 'myVPN'; the osascript command is OSX specific.

```
$ osascript myVPN-connect.txt
```

To disconenct from an OpenVPN VPN named 'myVPN':

```
$ osascript myVPN-disconnect.txt; the osascript command is OSX specific.
```

To run the script to keep AnyConnect up (by running and checking every 120 seconds):

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

# Networking tips in bash
See [networking tips] for some network related tricks in bash.

[networking tips]: https://github.com/dperique/shellExamples/blob/master/network-tips.md

In there I talk about:
* [iptables filtering for certain ports]
* [tunneling over ssh (to get around some networking connectivity challenges)]

[iptables filtering for certain ports]: https://github.com/dperique/shellExamples/blob/master/network-tips.md#disallow-port-22-ssh-port-80-http-and-port-443-https-allow-only-your-ip-address
[tunneling over ssh (to get around some networking connectivity challenges)]: https://github.com/dperique/shellExamples/blob/master/network-tips.md#do-port-forwarding-over-ssh-tunnel

# SSH tips
Here, I put a few tips I found in ssh to help using it in convenient ways.

# Traps and bash
In here, I have an example of how to write a trap in bash and how to use it to call some
cleanup function regardless if a test passes or fails. This can come in handy in test automation
where you want to clean up a resource before giving it back.

