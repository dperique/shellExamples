# Whiptail examples

The [whiptail](https://pkgs.org/download/whiptail) tool is good for fancy dialog
boxes in bash.  It seems pretty simple but really can dress up your bash code
especially when you want to make your bash application aesthetically pleasing,
inviting, and less scary for people like members of an Operations team who have
a great aversion to complexity.

Note the peculiar use of `3>&1 1>&2 2>&3` -- this is because the output goes to `stderr`.

Installation on debian style Linux:

```
sudo apt install whiptail
```

Installation on centos:

```
sudo dnf install newt
```

Examples:

* [yes/no dialogbox](scripts/yes-no.sh)
* [press enter to continue dialogbox](scripts/continue.sh)
* [radio box](scripts/radio.sh)
* [get input](scripts/get_input.sh)
