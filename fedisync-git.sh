#!/bin/bash
set -e
# generate files
#exec > >(tee /opt/fediblockhole/logs/fedisync.log) 2>&1
exec 2> >(tee /opt/fediblockhole/logs/fedisync-git.log)
echo "Pushing up git changes..."

cd /opt/fediblockhole

date=$(date '+%Y-%m-%d %H:%M:%S')

GIT=`which git`
${GIT} add --all
${GIT} commit -m "automated commit on $date"
${GIT} push
#${GIT} pushall

echo "Push complete."
