# Blocklist Index

**NOTE:** Mastodon.social and mastodon.online blocklists are provided for download as a sort of 'control group' for comparison, but are not weighted with other blocklists into the tiered blocklists.

* `100.percent.csv` - Blocks that are on 100% of all blocklists for all sources.
* `__allowlist.csv` - The 'safelist' to ensure that accidental defederations don't happen. Nothing in this list will appear in a unified blocklist.
* `_unified_tier0_blocklist.csv` - Combines blocks from all T0 sources (Seirdy, Gardenfence, Council) into a unified Tier 0 file.
* `_unified_tier1_blocklist.csv` - Requires 50% consensus to appear on this list. Includes Tier 0.
* `_unified_tier2_blocklist.csv` - Requires 33% consensus to appear on this list. Includes Tier 0 and Tier 1.
* `_unified_tier3_blocklist.csv` - Requires 2 sources to agree for it to appear on this list. Includes Tier 0, 1, and 2.
* `tier0.csv` - The original Tier0 file. Algorithmic *and* curated. See Seirdy's [Fediverse Blocklists](https://seirdy.one/posts/2023/05/02/fediverse-blocklists/) for notes about the process behind creating it.
* `gardenfence.csv` - A mirror of the [Gardenfence](https://gardenfence.github.io/) Tier 0 file.
* `tier0-council.csv` - Requires 80% agreement on blocks from trusted sources.
* `birdsite.csv` - All the Birdsite Live Blocks. This file is provided separately as a convenience.
* `dni.csv` - Do Not Interact (DNI). Badly-moderated servers that have returned hits for illegal content. Merged into all unified T0-T3 lists.
* `_unified_min_blocklist.csv` - [Deprecated] Identical to the `_unified_tier0_blocklist.csv`.
* *Other Files* - Other files listed here are individual trusted sources who provided data for the blocklist.

**Subfolders:**

* `mastodon` - identical blocklist data, but with proper mastodon headers in format `#domain,#severity...` etc.
* `other` - These aren't blocklists, but reports.
