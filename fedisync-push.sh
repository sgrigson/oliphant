#!/bin/bash
set -e
# generate files
exec > >(tee /opt/fediblockhole/logs/fedisync-production.log) 2>&1

# push to github and codeberg
# note: copy your own version to /fediblockhole/local
/opt/fediblockhole/fedisync-git.sh

# push to remote servers
/opt/fediblockhole/fedisync-example-server.sh
