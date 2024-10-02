#!/bin/bash

if [[ ! -f "/var/log/restartbaseline.alliander.log" ]]; then
    touch "/var/log/restartbaseline.alliander.log"
fi

exit