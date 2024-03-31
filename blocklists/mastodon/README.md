# Blocklist Index

**NOTE:** If importing these files for Mastodon, be sure to use the files in the `mastodon` folder.

* `_unified_tier0_blocklist.csv` - Combines blocks from all T0 sources (Seirdy, Gardenfence, Council) into a unified Tier 0 file.
* `seirdy-tier0.csv` - The original Tier0 file. Algorithmic *and* curated. See Seirdy's [Fediverse Blocklists](https://seirdy.one/posts/2023/05/02/fediverse-blocklists/) for notes about the process behind creating it.
* `gardenfence.csv` - A mirror of the [Gardenfence](https://gardenfence.github.io/) Tier 0 file.
* `birdsite.csv` - All the Birdsite Live Blocks. This file is provided separately as a convenience.
* `dni.csv` - IFTAS Do Not Interact (DNI).

**Subfolders:**

* `mastodon` - identical blocklist data, but with proper mastodon headers in format `#domain,#severity...` etc.
