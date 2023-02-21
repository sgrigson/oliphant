# Blocklist Index

* `100.percent.csv` - Blocks that are on 100% of all blocklists in the Fedi Council.
* `__allowlist.csv` - The 'safelist' to ensure that the Fedi Council doesn't appear on the blocklist. (Does not prevent individuals from blocking us, of course.)
* `_unified_max_blocklist.csv` - The harshest available list, pulls blocks from all sources including mastodon.social, rapidblock, and the Fedi Council. Uses the `max` strategy, which means it takes the harshest judgement. This is the largest, most unforgiving blocklist available.
* `_unified_min_blocklist.csv` - Minimum recommended blocks. Synonymous with the unified tier 0.
* `_unified_tier0_blocklist.csv` - Same as the minimum file above, called the "Tier 0" file. Requires a majority consensus to appear on this list.
* `_unified_tier1_blocklist.csv` - Requires 50% consensus to appear on this list. Includes Tier 0.
* `_unified_tier2_blocklist.csv` - Requires 33% consensus to appear on this list. Includes Tier 0 and Tier 1.
* `_unified_tier3_blocklist.csv` - Requires 2 sources to agree for it to appear on this list. Includes Tier 0, 1, and 2.
* `https:--rapidblock.org-blocklist.json.csv` - The Rapidblock list itself, prepared as a CSV for download.
* `tier0.csv` - Seirdy's Tier0 File, a solid contender for a starting blocklist you could import on its own.
* `gardenfence.csv` - A mirror of the [Gardenfence](https://gardenfence.github.io/) Tier 0 file.
* `tier0-council.csv` - Requires 80% agreement on blocks from Fedi Council sources.
* `birdsite.csv` - All the Birdsite Live Blocks. This file is provided separately as a convenience.
* *Other Files* - Other files listed here are individual trusted sources who provided data for the blocklist.