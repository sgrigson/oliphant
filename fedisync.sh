#!/bin/bash
set -e

# generate files
#exec > >(tee /fediblockhole/logs/fedisync.log) 2>&1
exec 2> >(tee /fediblockhole/logs/fedisync.log)
echo "Pulling down all blocklist sources..."

cd /fediblockhole

GIT=`which git`
${GIT} fetch
#${GIT} fetchall

SYNC=`which fediblock-sync`
${SYNC} -c /fediblockhole/config/pull.conf.toml # pull down all files, create max list

# rename and remove intermediate files
rm -f /fediblockhole/blocklists/file:---fediblockhole-blocklists-__allowlist.csv.csv
mv /fediblockhole/blocklists/https:--seirdy.one-pb-tier0.csv.csv /fediblockhole/blocklists/tier0.csv
mv /fediblockhole/blocklists/https:--seirdy.one-pb-pleroma.envs.net.csv.csv /fediblockhole/blocklists/pleroma.envs.net.csv
mv /fediblockhole/blocklists/https:--turtle.garden-blocklist.csv.csv /fediblockhole/blocklists/turtle.garden.csv
mv /fediblockhole/blocklists/https:--raw.githubusercontent.com-gardenfence-blocklist-main-gardenfence-fediblocksync.csv.csv /fediblockhole/blocklists/gardenfence.csv
mv /fediblockhole/blocklists/https:--artisan.chat-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/artisan.chat.csv
mv /fediblockhole/blocklists/https:--mastodon.art-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/mastodon.art.csv
mv /fediblockhole/blocklists/https:--mastodon.online-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/mastodon.online.csv
mv /fediblockhole/blocklists/https:--mastodon.social-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/mastodon.social.csv
mv /fediblockhole/blocklists/https:--rage.love-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/rage.love.csv
mv /fediblockhole/blocklists/https:--sunny.garden-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/sunny.garden.csv
mv /fediblockhole/blocklists/https:--toot.wales-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/toot.wales.csv
mv /fediblockhole/blocklists/https:--union.place-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/union.place.csv
mv /fediblockhole/blocklists/https:--solarpunk.moe-api-v1-instance-domain_blocks.csv /fediblockhole/blocklists/solarpunk.moe.csv

# destroy the 'max' list
rm -f /fediblockhole/blocklists/_unified_max_blocklist.csv

# create fedi council tier0 file and 100% file
${SYNC} -c /fediblockhole/config/council.tier0.conf.toml && \
${SYNC} -c /fediblockhole/config/100.percent.conf.toml

# create unified tier0 file
${SYNC} -c /fediblockhole/config/tier0.conf.toml

# create missing from mastodon.social blocklist file, and the inverse file
${SYNC} -c /fediblockhole/config/ms-noblock.conf.toml && \
${SYNC} -c /fediblockhole/config/ms-we-block.conf.toml

# create intermediate working tier files
${SYNC} -c /fediblockhole/config/tier1-threshold.conf.toml -m min && \
${SYNC} -c /fediblockhole/config/tier2-threshold.conf.toml -m min && \
${SYNC} -c /fediblockhole/config/tier3-threshold.conf.toml -m min

# merge in associated tier file with tier0 blocks
${SYNC} -c /fediblockhole/config/tier1.conf.toml -m min && \
${SYNC} -c /fediblockhole/config/tier2.conf.toml -m min && \
${SYNC} -c /fediblockhole/config/tier3.conf.toml -m min && \
cp /fediblockhole/blocklists/_unified_tier0_blocklist.csv /fediblockhole/blocklists/_unified_min_blocklist.csv 

# cleanup working tier files
rm -f /fediblockhole/blocklists/_working_*.csv 

echo "Pull complete."
