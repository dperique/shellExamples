#!/bin/bash

the_dc=$(whiptail --inputbox "Enter the Datacenter you wish to deploy to: " 10 50 None -- 3>&1 1>&2 2>&3)
echo "You have chosen '$target_dc'"
