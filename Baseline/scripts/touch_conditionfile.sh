#!/bin/bash

########## Touch condition file ##########

if [[ ! -f "/var/log/org.alliander.log" ]]; then
    touch "/var/log/org.alliander.log"
fi

exit