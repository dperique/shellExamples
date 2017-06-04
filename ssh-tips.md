We know about using ssh keys.  Here are a few tips.

Obviously, you can copy your id_rsa.pub to the remote machine's authorized_hosts file.
You can also use ssh-copy-id to do the same thing

# Be able to ssh to a host through another host

Sometimes you want to ssh to host2 via host1.  You can use 'ssh -t host1 ssh host2".
You can also set this up in your .ssh/config file using something like this:

```
Host host2
  User root
  ProxyCommand ssh -W %h:22 host1
```

This way, you can do this: 'ssh host2' and it will do the same as 'ssh -t host1 ssh host2'.
This link helps: https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts

# Be able to ssh to a host using a different public key
Sometimes you want to ssh to a remote host using a different key.  Say someone setup your keys to login to
two different hosts.  You can then ssh to each of them since ssh defaults to using .ssh/id_rsa.pub.
However, if you want to ssh to one host and then ssh to the other host from the current host, you'll have to
use that same key again.  To do this (i.e., login from remote host1 to remote host2 using a key on my local
machine):

scp your local id_rsa.pub file to host1 as xxx_rsa.pub.  This requires no password.

ssh to host2 from host1 using the key you just copied like this:
```
  ssh -i xxx_rsa.pub host2
```
# Make it so you can ssh as root on openstack VM

Sometimes you want to ssh as root to an openstack VM.  This will allow root ssh access on Openstack Centos VM instance:
```
vi /etc/ssh/sshd_config
Change this "PermitRootLogin no" to "PermitRootLogin yes"
service sshd restart
```
Take a look at /root/.ssh/authorized_keys on your VM.  See this (or something similar):
```
[root@host-3 .ssh]# cat authorized_keys 
no-port-forwarding,no-agent-forwarding,no-X11-forwarding,command="echo 'Please login as the user \"centos\" rather than the user \"root\".';echo;sleep 10" ssh-rsa ...blah...blah...blah... Dennis.Periquet@whatever.this.that
```
Get rid of the part just before ssh-rsa ... so it looks like this:
```
[root@host-3 .ssh]# cat authorized_keys 
ssh-rsa ...blah...blah...blah... Dennis.Periquet@whatever.this.that
```
You should now be able to ssh as root to your VM.


