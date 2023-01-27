# Oliphant.Social Shared Blocklist Files

New and improved thanks to the excellent [FediBlockHole](https://github.com/eigenmagic/fediblockhole).

For more information, please check out some blog entries:

* [The Blocklist Algorithm](https://writer.oliphant.social/oliphant/the-blocklist-algorithm)  
How the various lists were built, and the algorithms behind Min, Max, and Tier 0-3.
* [How to Sync Up Blocklist Changes From Trusted Sources](https://writer.oliphant.social/oliphant/how-to-sync-up-blocklist-changes-from-trusted-sources)  
A step-by-step tutorial on how to install FediBlockHole yourself and start pulling down blocklists and applying them to your server.
* [Blocklists](https://writer.oliphant.social/oliphant/blocklists)  
Several thousand words about blocklists and defederation.

Blocklists are dual hosted at:

* https://github.com/sgrigson/oliphant
* https://codeberg.org/oliphant/oliphant

If you're pulling down the repo instead of downloading files directly, you can use `git remote set-url` to switch locations if needed.

## Tiers - An Evolving Algorithm

Tiers tend to be relative to blocklist size at present, but that classification may evolve. 

You are encouraged to use these lists if you find them useful, or else rely more on an individual trusted source in the list, rather than a merge, and use their blocklist. 

The advantage of a tier merge is that it acts like a second (or third) opinion. Most of these blocks use a *min* merge strategy, meaning that a single source choosing 'silence' over 'suspend' will force that domain to be silenced instead of suspended. At this time, Tiers 1-3 include an amalgam of *all* blocks, so a source included only once will make it into a merged list.

Only Tier 0 is based around consensus (meaning that a block must appear in many lists to appear in Tier 0).

I hope to build in more of a consensus model to Tier 1-3 as well, allowing for merge files that mostly include consensus blocks rather than an all-inclusive blocklist.

Consider these the first algorithms for now.

Tier 0 - Essential, Consensus, Trusted Blocks
Tier 1 - Mid-to-Very Moderated Servers
Tier 2 - Heavily Moderated Servers
Tier 3 - Extremely Moderated Servers

There is a "max" list which pulls in literally everything included here: Tiers 0-3, Mastodon.Social, Mastodon.Online, even RapidBlock and pulls them all into the pot and whoever gives the most severe ranking wins.

There are also "No Oliphant" lists that take all of my blocks and potential bias out of the equation entirely.

Note that unless the list specifies otherwise, blocks from a lower tier are always included. That means Tier0 blocks are in every unified (merged) list.

## What's Your Ideology Here?

Far-left, radical in the sense that capitalism wants to kill the planet and fascism wants to kill us and the oligarchs who run the planet want to have a "civilized" debate about whether certain currently demonized groups should exist or not. Others are "in the middle" and apathetic, quite frankly, about a rise in racist and transphobic rhetoric. There's a perception of the Fedi being an unsafe space for marginalized groups.

We're fighting back. This is our best-guess of the kinds of blocks you might need to keep the fedi weird *and* safe. Note: There is clearly not universal agreement here, even among the server admins who agreed to participate. This is herding cats.

So we just give you as much information as you can, from as many admins who agreed to participate, and let you pick the list that suits your level of blockingness, or the source list that most closely matches the identity and needs of your own server community.

## Where's the Receipts?

Not here. There is no reason to get into any fights about what is essentially a point-in-time *status report*. These are easily importable blocks that can be reviewed and opted-out of individually. In a searchable format with a static url they can also be used to drive other consensus-based blocklist projects, and become a Trusted Source for others in syncing up and maintaining their own blocklists.

The receipts, in other words, are federated. They just aren't here. You'll have to search for them, but the best place to start is to go (nicely) asking why you're on a particular server's blocklist.

## Uses and Context for Blocklists

Blocklists are provided in the public interest, and for server admins who maintain a legitimate interest in performing the normal daily operation of their server, which includes [active moderation](https://joinmastodon.org/covenant), review of potential sources of harm or even just places viewed with caution due to unsafe or lax moderation practices.

Everyone argues about where to draw this line. That's the whole point of providing multiple sources here (and I'll provide others if they opt-in). Ideally, you will pull in a blocklist from other sources you trust. That may be one of the sources here, it may be a merged version of the different lists, or you may simply use it for reference.

There are several non-standard use-cases as well:

* “Hmm...I’m on the fence about this domain. Oh look, it’s in this blocklist too; let me ask them about it.”
* “I’ve imported a large blocklist but I’m unsure about some entries. Apparently they’re tier-3 entries but not tier-2  or tier-1; I think I’ll downgrade these entries from suspend to something less severe.”
* “Someone sent me a follow-request and I see they’re a new user from a tier-zero domain; I think I’ll decline.”

Ultimately, how the list is used is up to you.

It's assumed you're an intelligent, rational person and can deal with what we hope are small disagreements with some of the entries on the list.

## The TL;DR

* "The Fedi Council" consists of over 50 different server admins in a shared Discord who discuss blocks, bad actors, and other topics. There exist other Fedi Councils (they just probably don't call themselves that) but there are groups of server admins all over the Fedi, using shared DMs or Discord/Matrix or other sources to coordinate and discuss issues of interest.
* No one has officially adopted the name "The Fedi Council" to my awareness. I just call us that because I find it fun and less of a mouthful than "a bunch of different server admins." I am taking some liberties in their name by calling them something that no one really voted on, for which I hope they'll forgive me. So far no one is openly opposed to it, so I keep using it. It's not a dark or mysterious group, it's just a bunch of server admins running off of a Mastodon.Art discord. If there's a central membership you're looking for there, it's that.
* There is not complete agreement on these blocklists, you may have noticed. That's why I included them all separately, as individual sources, as well as providing merged versions of those lists. But it quickly became apparent: Some of us block more than others. Some suspend, others silence, others don't block at all.
* So I made the admittedly subjective decision to divide up those of us who had opted-in to sharing our blocklists publicly into Tiers.
* Please note that you're expected to review every blocklist before importing it. 

## Tier 0 "Consensus: A Good Starting Blocklist"

Start with Seirdy's massive, comprehensive blocklist at pleroma.envs.net. Then, start looking for consensus/shared blocks across other members of the Fedi Council. This list weeds out the one-offs, manually removes some controversial entries, and inserts a few new urgent bad actors as needed.

This list used to be comprised only of the Mastodon.Social and Mastodon.Online blocklists. Now, those lists are only included for Control purposes, as a basis of comparison. (Or if you don't trust anything here and just want a basic blocklist that mirrors mastodon.social).

If you want the "old Tier 0" list for import, you can certainly go download and import those files individually.

Current Tier 0 reflects a suspension consensus among certain members of the Fedi Council. Note: Once tier 0 gets added to other lists, some suspend recommendations become downgraded to silence.

## Tier 1 - The 