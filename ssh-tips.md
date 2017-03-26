We know about using ssh keys.  Here are a few tips.

Obviously, you can copy your id_rsa.pub to the remote machine's authorized_hosts file.
You can also use ssh-copy-id to do the same thing

Sometimes you want to ssh to host2 via host1.  You can use 'ssh -t host1 ssh host2".
You can also set this up in your .ssh/config file using something like this:

```
Host host2
  User root
  ProxyCommand ssh -W %h:22 host1
```

This way, you can do this: 'ssh host2' and it will do the same as 'ssh -t host1 ssh host2'.
This link helps: https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts


