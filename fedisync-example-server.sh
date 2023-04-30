#!/bin/bash
set -e
# export to production servers

SYNC=`which fediblock-sync`

# use secretconfig subfolder
${SYNC} -c /fediblockhole/config/example-server-export.conf.toml

