#!/bin/bash
set -e
# generate files
exec > >(tee /fediblockhole/logs/fedisync-production.log) 2>&1

# push to github and codeberg
# note: copy your own version to /fediblockhole/local
/fediblockhole/fedisync-git.sh

# push to remote servers
/fediblockhole/fedisync-example-server.sh
