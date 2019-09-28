#!/bin/bash

grep export $HOME/.exportsrc | while IFS=' =' read ignoreexport envvar ignorevalue; do
    launchctl setenv ${envvar} "${!envvar}"
done
