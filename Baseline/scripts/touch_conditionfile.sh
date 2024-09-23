#!/bin/bash

if [[ ! -f "/var/log/org.alliander.log" ]]; then
    touch "/var/log/org.alliander.log"
fi

exit