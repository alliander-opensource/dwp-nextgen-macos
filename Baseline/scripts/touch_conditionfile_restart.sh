#!/bin/bash

if [[ ! -f "/var/log/org.alliander.baseline.log" ]]; then
    touch "/var/log/org.alliander.baseline.log"
fi

exit