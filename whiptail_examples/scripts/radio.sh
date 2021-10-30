#!/bin/bash

# Radio dialog: We capture what the user chose.  If they didn't select anything, the
# output is "" and we act accordingly.
#
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
                     --title "Deployment target" \
                     "$message" 10 60 ${#radio_items[@]} "${entry_options[@]}" 3>&1 1>&2 2>&3)

if [[ -z $target_dc ]]; then
    echo "No DC chosen; aborting ..."
    exit 1
else
    echo "Continuing with deployment to $target_dc ..."
fi

echo "You have chosen '$target_dc'"
