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
