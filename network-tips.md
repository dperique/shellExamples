# Here are a few tips I use for networking

Most of them are pretty obvious but sometimes you need a place to get a clean example
that you can just about copy/paste without a whole lot of thinking.

# Disallow port 22 (ssh), port 80 (http), and port 443 (https), allow only your IP address

Sometimes you want to start services on a public machine but only want your IP address
to access it.  Add these iptables rules to make it happen.  Note this assumes a clean 
iptables state (accomplished via 'iptables -F').  

NOTE: Please do not use these commands if you don't know what you're doing as it can 
lock you out of your machine.  

The IP address used below in the first line is arbitrary, please use the relevant one for you.
```
iptables -A INPUT -i eth1 -s 198.116.199.88 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --destination-port 22 -j DROP
iptables -A INPUT -i eth1 -p tcp --destination-port 80 -j DROP
iptables -A INPUT -i eth1 -p tcp --destination-port 443 -j DROP

# If you already have some iptables rules, you can insert the rules at a certain
# line like this (example shows how to insert after rule 8):

iptables -I INPUT eth1 ... (follow as above)
```

# Do port forwarding over ssh tunnel

Sometimes you have this situation: your on a host, you do something and some service
comes up at locahost port 9090 using http.  You can run a browser and get at it.  But
if you have no window manager, you cannot.  You can always install some windowing
manager, etc. but you don't want to.

You can get around this by ssh'ing to that host from your laptop (which happens to
have a window manager and browser), setting up a tunnel on port 9090,
and having it forwarded to your laptop.  Now you can http://localhost:9090 on your
laptop and see the webpage.

Here's the command:

```
ssh -L 9099:localhost:9090 ubuntu@my-svc-host
```
Thing of the -L as saying the next parameter is the port on my local machine.

my-svc-host is the host where the service is running at localhost:9090.  You ssh
to that host, say as ubuntu, you specify the port the service is running on 9090 and
then the port you want to forward that port to your local laptop as 9099.

Now, you can goto your laptop and run http://localhost:9090

