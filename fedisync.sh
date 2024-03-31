#!/bin/bash
set -e

# generate files
exec 2> >(tee /opt/fediblockhole/logs/fedisync.log)
echo "Pulling down all blocklist sources..."

cd /opt/fediblockhole

GIT=`which git`
${GIT} fetchall

PULLCONFIG="/opt/fediblockhole/secretconfig/pull.conf.toml" # default, pull sources WITHOUT public_description
#PULLCONFIG="/opt/fediblockhole/secretconfig/pull.all.conf.toml" # pull down all sources WITH public_description

SYNC=`which fediblock-sync`
${SYNC} -c $PULLCONFIG # pull down all files, create max list

# rename and remove intermediate files
rm -f /opt/fediblockhole/blocklists/file:---opt-fediblockhole-blocklists-__allowlist.csv.csv
mv /opt/fediblockhole/blocklists/https:--seirdy.one-pb-tier0.csv.csv /opt/fediblockhole/blocklists/tier0.csv
mv /opt/fediblockhole/blocklists/https:--raw.githubusercontent.com-gardenfence-blocklist-main-gardenfence-fediblocksync.csv.csv /opt/fediblockhole/blocklists/gardenfence.csv
mv /opt/fediblockhole/blocklists/https:--mastodon.online-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/mastodon.online.csv
mv /opt/fediblockhole/blocklists/https:--mastodon.social-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/mastodon.social.csv
mv /opt/fediblockhole/blocklists/https:--raw.githubusercontent.com-iftas-org-resources-main-DNI-dni.csv.csv /opt/fediblockhole/blocklists/dni.csv
# destroy the 'max' list
rm -f /opt/fediblockhole/blocklists/_unified_max_blocklist.csv

# create unified tier0 file
${SYNC} -c /opt/fediblockhole/secretconfig/tier0.conf.toml

# create missing from mastodon.social blocklist file, and the inverse file
${SYNC} -c /opt/fediblockhole/config/ms-noblock.conf.toml

cp /opt/fediblockhole/blocklists/_unified_tier0_blocklist.csv /opt/fediblockhole/blocklists/_unified_min_blocklist.csv 

echo "Creating mastodon versions of files..."

# convert files to Mastodon header
cd /opt/fediblockhole/blocklists/mastodon

# copy all files to mastodon subfolder
cp /opt/fediblockhole/blocklists/*.csv /opt/fediblockhole/blocklists/mastodon/ && \
cp /opt/fediblockhole/blocklists/README.md /opt/fediblockhole/blocklists/mastodon/README.md

rm -f __allowlist.csv

# replace first line with mastodon-format header row
headerrow="#domain,#severity,#reject_media,#reject_reports,#public_comment,#obfuscate"
for file in *.csv; do
    sed -i "1s/.*/$headerrow/" $file
    # replace bad line terminators
    sed -i "s/\r//g" $file
    # lowercase file to fix booleans
    sed -i "s/\(.*\)/\L\1/" $file
done

echo "Pull complete."
