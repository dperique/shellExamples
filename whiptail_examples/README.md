# Whiptail examples

This tool is good for fancy dialog boxes in bash.  It seems pretty simple but
really can dress up your bash code esp. when you want to make it aesthetically
pleasing, inviting, and less scary for people like in an Operations team.

Installation:

```
sudo apt install whiptail
```

Example yes/no dialogbox:

```
#!/bin/bash

if (whiptail --yesno "You are about to blow away a production deployment.\n\nAre you sure?" 10 70); then
    echo yes
else
    echo no
fi
```

Example message:

```
#!/bin/bash

msg="This script is designed to deploy the yada project.\nPress ENTER to continue."
whiptail --msgbox $msg  10 50
echo "Continuing with deployment ..."
```

Example radio box:

```
#!/bin/bash

message='Choose Datacenter to push new code:\n\n'

declare -A radio_items=([DAL10]="Dallas DC10" \
                        [DAL12]="Dallas DC12" \
                        [DAL13]="Dallas DC13")

entry_options=()
for item in "${!radio_items[@]}"; do
  entry_options+=("$item")
  entry_options+=("${radio_items[$item]}")
  entry_options+=("OFF")
done

target_dc=$(whiptail --radiolist \
                     --title "Deployment target" "$message" 10 60 ${#radio_items[@]} -- \
                     "${entry_options[@]}" 3>&1 1>&2 2>&3)

if [[ -z $target_dc ]]; then
    echo "No DC chosen; aborting ..."
    exit 1
else
    echo "Continuing with deployment to $target_dc ..."
fi

echo "You have chosen '$target_dc'"
```

Example input box:

```
#!/bin/bash

the_dc=$(whiptail --inputbox "Enter the Datacenter you wish to deploy to: " 10 50 None -- 3>&1 1>&2 2>&3)
echo "You have chosen '$target_dc'"
```

