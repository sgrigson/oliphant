#!/bin/bash
set -e

# generate files
#exec > >(tee /opt/fediblockhole/logs/fedisync.log) 2>&1
exec 2> >(tee /opt/fediblockhole/logs/fedisync.log)
echo "Pulling down all blocklist sources..."

cd /opt/fediblockhole

GIT=`which git`
${GIT} fetch
#${GIT} fetchall

SYNC=`which fediblock-sync`
${SYNC} -c /opt/fediblockhole/config/pull.conf.toml # pull down all files, create max list

# rename and remove intermediate files
rm -f /opt/fediblockhole/blocklists/file:---opt-fediblockhole-blocklists-__allowlist.csv.csv
mv /opt/fediblockhole/blocklists/https:--seirdy.one-pb-tier0.csv.csv /opt/fediblockhole/blocklists/tier0.csv
mv /opt/fediblockhole/blocklists/https:--seirdy.one-pb-pleroma.envs.net.csv.csv /opt/fediblockhole/blocklists/pleroma.envs.net.csv
mv /opt/fediblockhole/blocklists/https:--turtle.garden-blocklist.csv.csv /opt/fediblockhole/blocklists/turtle.garden.csv
mv /opt/fediblockhole/blocklists/https:--raw.githubusercontent.com-gardenfence-blocklist-main-gardenfence-fediblocksync.csv.csv /opt/fediblockhole/blocklists/gardenfence.csv
mv /opt/fediblockhole/blocklists/https:--artisan.chat-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/artisan.chat.csv
mv /opt/fediblockhole/blocklists/https:--mastodon.art-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/mastodon.art.csv
mv /opt/fediblockhole/blocklists/https:--mastodon.online-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/mastodon.online.csv
mv /opt/fediblockhole/blocklists/https:--mastodon.social-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/mastodon.social.csv
mv /opt/fediblockhole/blocklists/https:--rage.love-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/rage.love.csv
mv /opt/fediblockhole/blocklists/https:--sunny.garden-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/sunny.garden.csv
mv /opt/fediblockhole/blocklists/https:--toot.wales-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/toot.wales.csv
mv /opt/fediblockhole/blocklists/https:--union.place-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/union.place.csv
mv /opt/fediblockhole/blocklists/https:--solarpunk.moe-api-v1-instance-domain_blocks.csv /opt/fediblockhole/blocklists/solarpunk.moe.csv

# destroy the 'max' list
rm -f /opt/fediblockhole/blocklists/_unified_max_blocklist.csv

# create fedi council tier0 file and 100% file
${SYNC} -c /opt/fediblockhole/config/council.tier0.conf.toml && \
${SYNC} -c /opt/fediblockhole/config/100.percent.conf.toml

# create unified tier0 file
${SYNC} -c /opt/fediblockhole/config/tier0.conf.toml

# create missing from mastodon.social blocklist file, and the inverse file
${SYNC} -c /opt/fediblockhole/config/ms-noblock.conf.toml && \
${SYNC} -c /opt/fediblockhole/config/ms-we-block.conf.toml

# create intermediate working tier files
${SYNC} -c /opt/fediblockhole/config/tier1-threshold.conf.toml -m min && \
${SYNC} -c /opt/fediblockhole/config/tier2-threshold.conf.toml -m min && \
${SYNC} -c /opt/fediblockhole/config/tier3-threshold.conf.toml -m min

# merge in associated tier file with tier0 blocks
${SYNC} -c /opt/fediblockhole/config/tier1.conf.toml -m min && \
${SYNC} -c /opt/fediblockhole/config/tier2.conf.toml -m min && \
${SYNC} -c /opt/fediblockhole/config/tier3.conf.toml -m min && \
cp /opt/fediblockhole/blocklists/_unified_tier0_blocklist.csv /opt/fediblockhole/blocklists/_unified_min_blocklist.csv 

# cleanup working tier files
rm -f /opt/fediblockhole/blocklists/_working_*.csv 

echo "Pull complete."
