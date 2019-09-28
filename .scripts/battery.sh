#!/usr/local/bin/dash

pmset -g batt | egrep "([0-9]+\%).*" -o | awk -F '[" ";]' '{print $1" "$5}'
