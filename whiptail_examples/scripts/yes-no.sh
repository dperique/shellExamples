#!/bin/bash

# Simple yes no
#
if (whiptail --yesno "You are about to blow away a production deployment.\n\nAre you sure?" 10 70); then
    echo yes
else
    echo no
fi
