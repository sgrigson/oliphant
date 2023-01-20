# Oliphant.Social Shared Blocklist Files

New and improved thanks to the excellent [Fediblockhole](https://github.com/eigenmagic/fediblockhole).

For more information, please check out my blog and how I handle [Blocklists](https://writer.oliphant.social/oliphant/blocklists).

A current version of the data displayed below is hosted on my blog, at [The Blocklist Algorithm](https://writer.oliphant.social/oliphant/the-blocklist-algorithm).

Updates to the Github README may lag.

---

# The Blocklist Algorithm

This is the process behind creating my unified blocklists. There is no special magic here; everything is created using the [FediBlockHole](https://github.com/eigenmagic/fediblockhole) project. If you start off reviewing that project, you'll probably have a pretty good idea of how this works.
<!--more-->
**Summary:** Start with Trusted Sources, create lists from those sources by merging them all together and choosing a "most lenient" policy, where disagreements between the sources take the most lenient server's judgment. This is complicated by trying to create various "Tiers" of moderation, with Tier 0 being the uncontroversial Mastodon flagship servers. Tier 1 is the next step up from that, with Tier 2 sources including a *lot* more blocks. Tier 3 sources have a very large number of defederations.

This is still objectively better than my former ["just use my list"](https://github.com/sgrigson/oliphant/blob/main/blocklists/oliphant.social.csv) approach. Although I'm pretty proud of my list, so feel free to use it anyway.

## Start With Trusted Sources

For starters, I curate a list of trusted sources, including my own server, pulled from the [Fedi Council](/oliphant/the-fedi-council). Admins of Tier1+ servers have opted in to being one of the Trusted Sources, if you see them listed here, I have their explicit permission. (Note: Still waiting for Eugen to acknowledge this project, but I'm assuming he'd be okay with me pulling publicly available defederation data.) 

*Disclaimer: I try on my server to remove and unban servers that are dead and no longer active, but not all the sources do the same. I cannot make any assurances for any lists beyond my own.*

### Rank Trusted Sources Into Tiers:

Tier is the algorithm I devised to group trusted sources. Essentially, I wanted to keep the size of the blocklist (and the servers defederated) limited based on the general level of 'moderatedness' or 'opinionatedness,' which is a *very subjective* criterion and admittedly does not perfectly represent the real world.

It's only somewhat empirical if you go by blocklist size, which is *mostly* what this is.

Tier 0 is a "regular" or "Mastodon.Social"-sized blocklist, and really it just exists to provide one blocklist to which surely no one can object as a baseline for others. Since these sources aren't part of our Fedi Council, I only provide them for download, Tier0 list, and the "max list. They aren't part of any others.

Tier 1 keeps bigger-than-average blocklists. Tier 2 makes us look like we're not even trying, and Tier 3 have *seen some stuff* and lived to tell about it, and their blocklists reflect that.

Listed below are the current trusted sources. Click each to review their block data. *Each Tier contributes their block data to the tiers above it.* You can thus review this data to determine which blocks will appear in the final merge lists. A block introduced in Tier 1 would be carried forward into all Tier 2 and Tier 3 lists. Tier 3 contributions to the block file would thus only appear in the Tier 3 and "Max" lists.

#### Tier 0

Tier0 is base-level moderation, expected on the flagship servers and as part of the Mastodon Server Covenant. These files are provided for download below, but these results are not included in other combined tier lists.
  
  1. [Mastodon.social](https://github.com/sgrigson/oliphant/blob/main/blocklists/mastodon.social.csv)
  1. [Mastodon.online](https://github.com/sgrigson/oliphant/blob/main/blocklists/mastodon.online.csv)

[Combined Tier 0 File](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_tier0_blocklist.csv)

#### Tier 1

Tier1 are servers that block somewhat aggressively, like mine.
  
1. [Oliphant.Social](https://github.com/sgrigson/oliphant/blob/main/blocklists/oliphant.social.csv)
1. [Union.Place](https://github.com/sgrigson/oliphant/blob/main/blocklists/union.place.csv)
1. [Sunny.Garden](https://github.com/sgrigson/oliphant/blob/main/blocklists/sunny.garden.csv)

[Combined Tier 1 File](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_tier1_blocklist.csv) - Includes only Tier 1 sources

#### Tier 2

Tier2 are servers with even larger and more aggressive blocklists.

1. [Mastodon.Art](https://github.com/sgrigson/oliphant/blob/main/blocklists/mastodon.art.csv)
1. [Toot.Wales](https://github.com/sgrigson/oliphant/blob/main/blocklists/toot.wales.csv)
1. [Artisan.Chat](https://github.com/sgrigson/oliphant/blob/main/blocklists/artisan.chat.csv)

[Combined Tier 2 File](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_tier2_blocklist.csv) - Includes Tier 1 - Tier 2 sources

#### Tier 3

Tier 3 servers have the largest (and thus probably most restrictive) blocklists.

1. [Rage.love](https://github.com/sgrigson/oliphant/blob/main/blocklists/rage.love.csv)

[Combined Tier 3 File](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_tier3_blocklist.csv) - Includes Tier 1 - Tier 3 sources

### How It Works

All the trusted sources are pulled and updated regularly, with their [lists available for download](https://github.com/sgrigson/oliphant/tree/main/blocklists). As part of this process, we generate importable CSV files via the [FediBlockHole](https://github.com/eigenmagic/fediblockhole) project, and create the `_unified_*_blocklist.csv` merge files. 

The `_unified_max_blocklist.csv` includes Tier 0-3 Trusted Sources and chooses the *most* restrictive option. It is the only file that chooses the `max` or "least lenient" policy, and the only one that include Tier 0 results commingled with other members of the Fedi Council.

This Max blocklist includes current [RapidBlock](https://rapidblock.org/) list recommendations as well. As an illustration of how each algorithm is configurable, notice that I just decided the `max` list should also include RapidBlock's public list as well, even though it's not included elsewhere.

The FediBlockHole config file is set to use [the `min` setting](https://github.com/eigenmagic/fediblockhole#mergeplan) when creating the final merge file for each tier. This means that where there is a conflict between trusted sources, the *least* severe setting wins. Silence wins over Suspend, and None+Reject Media would win over both.

Tier0, Tier1, Tier2, and Tier3 are *themselves* algorithms. There are other ways to combine lists besides this. Essentially, the higher the tier, the larger the blocklist, both the individual server file for download and their contribution to the size of the overall blocklist.

### Which File to Use?

* If you want the most comprehensive file, with the most lenient judgment from the members of my trusted sources: [\_unified\_tier3\_blocklist.csv](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_tier3_blocklist.csv)
* If you want the most strict file from all available sources: [\_unified\_max\_blocklist.csv](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_max_blocklist.csv)
* If you want the most lenient from all Tier 1 sources: [\_unified\_min\_blocklist.csv](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_min_blocklist.csv) *or* [\_unified\_tier1\_blocklist.csv](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_tier1_blocklist.csv) (These files are identical.)
* If you want the least opinionated file: [\_unified\_tier0\_blocklist.csv](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_tier0_blocklist.csv) or a more opinionated file: [\_unified\_tier2\_blocklist.csv](https://github.com/sgrigson/oliphant/blob/main/blocklists/_unified_tier2_blocklist.csv)
* If you trust one of these servers more than any others, just use that server's file.

### The Allowlist

Anyone that appears in the [allowlist](https://github.com/sgrigson/oliphant/blob/main/blocklists/__allowlist.csv) will *not* be included in any of the unified blocklist files. This is primarily to ensure that no one who is part of our Fedi Council gets accidentally recommended as a block--even *if* members of the Fedi Council end up defederating each other in the future, this is just some protection against that.

Also, if you're using one of these lists in an automated fashion and want to be sure you don't show up in the results, either, please let me know.

Note that if you're writing your own custom local process, you should absolutely check if your server is in the defederation list, anyway, to prevent you from loading that entry and defederating yourself, which is a real pain and probably requires server access to fix.

Mastodon should also have built-in protection from defederating yourself, but that is another story.

To be transparent, I may manually add a few others to the allowlist, who are not part of our Fedi Council.

### Other Algorithms to Come!

Min, Max, Tier0 - Tier 3, these are just the first round of algorithms!

Once other better public lists are available, I can also use those as sources. One list, in particular, is being developed now (not by me) that will look for commonalities between different groups in our fedi council and report only blocks in which there is an agreement between X (say 5?) or more and leave the others off the list.

I plan to provide that as its own blocklist in the future, while also using it to combine with other well-curated lists to provide different files for import.
