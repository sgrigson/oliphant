# Oliphant.Social Shared Blocklist Files

**Now an aggregator**

This repo is now producing only an aggregated Tier 0 file as a combination of Seirdy's Tier 0, Gardenfence, and the IFTAS DNI list. Other high-consensus or curated "tier 0" files might be added in the future.

Note that there is no longer any kind of threshold algorithm or trusted council involved: that is handled by the source lists themselves, each of which provide their own high threshold for consensus.

---

See `RUNNING.md` for more information on running the scripts in this repo to generate these blocklists yourself, to modify the sources, or push the blocks to a server you control. You are encouraged to fork this repo, create your own versions of these scripts, and push up your own blocklist files, or use this simply to keep a server in sync with blocklist updates.

This folder contains scripts to generate the blocklist files. See the `blocklists` folder for blocklist files.

For more information, please check out some blog entries:

* [How to Sync Up Blocklist Changes From Trusted Sources](https://writer.oliphant.social/oliphant/how-to-sync-up-blocklist-changes-from-trusted-sources)  
A step-by-step tutorial on how to install FediBlockHole yourself and start pulling down blocklists and applying them to your server.
* [Blocklists](https://writer.oliphant.social/oliphant/blocklists)  
Several thousand words about blocklists and defederation.

Blocklists are dual hosted at:

* https://github.com/sgrigson/oliphant
* https://codeberg.org/oliphant/oliphant


If you're pulling down the repo instead of downloading files directly, you can use `git remote set-url` to switch locations if needed.

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

