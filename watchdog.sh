#!/bin/bash

restartElectron() {
    killall electron
    sleep 2
    /usr/src/app/node_modules/.bin/electron --no-sandbox /usr/src/app &
}

/usr/src/app/node_modules/.bin/electron --no-sandbox /usr/src/app &

while true; do
    curl --max-time 2 --silent --retry 10 --retry-max-time 60 --retry-all-errors --fail http://localhost:4568/health > /dev/null || restartElectron
    sleep 10
done