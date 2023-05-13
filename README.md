# Oliphant.Social Shared Blocklist Files

See `RUNNING.md` for more information on running the scripts in this repo to generate these blocklists yourself, to modify the sources, or push the blocks to a server you control. You are encouraged to fork this repo, create your own versions of these scripts, and push up your own blocklist files, or use this simply to keep a server in sync with blocklist updates.

This folder contains scripts to generate the blocklist files. See the `blocklists` folder for blocklist files.

For more information, please check out some blog entries:

* [The Blocklist Algorithm](https://writer.oliphant.social/oliphant/the-blocklist-algorithm)  
How the various lists were built, and the algorithms behind Tier 0-3.
* [How to Sync Up Blocklist Changes From Trusted Sources](https://writer.oliphant.social/oliphant/how-to-sync-up-blocklist-changes-from-trusted-sources)  
A step-by-step tutorial on how to install FediBlockHole yourself and start pulling down blocklists and applying them to your server.
* [Blocklists](https://writer.oliphant.social/oliphant/blocklists)  
Several thousand words about blocklists and defederation.

Blocklists are dual hosted at:

* https://github.com/sgrigson/oliphant
* https://codeberg.org/oliphant/oliphant


If you're pulling down the repo instead of downloading files directly, you can use `git remote set-url` to switch locations if needed.

---
## The Tier Consensus System

Tiers will reflect blocklist size, with higher tiers having larger blocklists. This is purely mathematical, and pulls from trusted sources to generate this list based on common agreement.

You are encouraged to use these lists if you find them useful, or you can rely more on an individual trusted source in the list and reference their blocklist instead.

The advantage of a tier merge is that it acts like a second (or third) opinion. Most of these blocks use a *min* merge strategy, meaning that a single source choosing 'silence' over 'suspend' will force that domain to be silenced instead of suspended. 

All tiers are based on mathematical consensus, and at least 2 sources must agree for a source to be on any list.

* Tier 0 - Requires 60-80% consensus on blocks to appear on this list.
* Tier 1 - Requires 50% consensus to appear on this list
* Tier 2 - Requires 33% consensus
* Tier 3 - Requires 2 sites (moved and seconded) to appear on the list

Note that unless the list specifies otherwise, blocks from a lower tier are always included. That means Tier0 blocks are in every unified (merged) list.

## What's The Purpose Here?

We see issues from the same servers, over and over again. No one has ever coordinated this data before in such a way, and it's coordination (which began with the fediblock hashtag) which has helped create a better, safer space already. There is more work to be done here.

This is our best-guess of the kinds of blocks you might need to keep the fedi weird *and* safe. Note: There is clearly no universal agreement here, even among the server admins who agreed to participate. This is herding cats.

So we give you as much information as possible, from as many admins who agreed to participate and let you pick a tier list that suits your level of "blockingness", or an individual source list that most closely matches the identity and needs of your server community.

## Where's the Receipts?

Not here. There is no reason to get into any fights about what is essentially a point-in-time *status report*. These are easily importable blocks that can be reviewed and opted out of individually. In a searchable format with a static URL they can also be used to drive other consensus-based blocklist projects and become a Trusted Source for others in syncing up and maintaining their blocklists.

The receipts, in other words, are federated. They just aren't here. You'll have to search for them, but the [Bad Space](https://thebad.space/about) is coming online and should eventually have all the receipts for public availability.

## How Often are the Lists Updated?

On the hour, every hour, so long as there have been changes from one of the blocklist sources.

## Fair Use and Context for Blocklists

Blocklists are provided in the public interest and for server admins who maintain a legitimate interest in performing the normal daily operation of their server, which includes [active moderation](https://joinmastodon.org/covenant), review of potential sources of harm or even just places viewed with caution due to unsafe or lax moderation practices.

Everyone argues about where to draw this line. That's the whole point of providing multiple sources here (and I'll provide others if they opt in). Ideally, you will pull in a blocklist from other sources you trust. That may be one of these sources, a merged version of the different lists, or you may use it for reference.

There are several non-standard use cases as well:

* “Hmm...I’m on the fence about this domain. Oh look, it’s in this blocklist too; let me ask them about it.”
* “I’ve imported a large blocklist, but I’m unsure about some entries. They’re tier-3 entries but not tier-2  or tier-1; I think I’ll downgrade them from suspend to something less severe.”
* “Someone sent me a follow-request, and I see they’re a new user from a tier-zero domain; I think I’ll decline.”

Ultimately, how a list is used is up to you.

It's assumed you're a rational person and can deal with what we hope are small disagreements with some of the entries on the list. 

It's also assumed you're capable of *not importing certain lines* or just editing the file as necessary. Use it as a basis to create your shared blocklist file. 

Or... decide you do not want to use it at all.

## Trusted Sources

The [trusted sources for this project](https://writer.oliphant.social/oliphant/the-blocklist-algorithm#fedi-council-trusted-source-files) have been willing to provide their blocklists publicly. You are encouraged to run the blocklists yourself. See `RUNNING.md` for details. You can change the trusted sources, or pull in descriptions as well.

It should be noted that these are my trusted sources, and they are also the ones willing to come forward publicly and take any heat associated with the project. They need not be yours, and you are encouraged to use whatever sources you like, and include descriptions in your own blockfiles. If you are going to post your fork of these lists publicly and include changes to the blocklists with new sources, it would be a courtesy to them to get their permission as well.
