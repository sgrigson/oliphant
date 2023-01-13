# Oliphant.Social Shared Blocklist Files

New and improved thanks to the excellent [Fediblockhole](https://github.com/eigenmagic/fediblockhole).

For more information, please check out my blog [Oliphant Social Curated Blocklists](https://writer.oliphant.social/oliphant/the-oliphant-social-blocklist) page.

## How are Unified Blocklists Built

I, ([Oliphant@oliphant.social](https://oliphant.social/@oliphant)), curate a list of trusted sources, including my own server. These can be public or private lists, but a server can opt-in to being one of the Trusted Sources. So long as they aren't already a defederated server and are trusted by others on the Trusted Sources list, they become a member and provide either their public list, or a `read:blocks` api key for Oliphant.Social to use.

Everything is checked against Mastodon.Social and Mastodon.Online, as the 'flagship servers' we might as well give them a vote as well in defederation of the final unified list. (at least for now.) Hopefully Gargron won't mind too much me pulling from their public api of defederation to represent the voice of the Mastodon Server Covenant from a pretty canonical source.

Note that some servers use obfuscation, which blocks imports from being included in the final unified lists. 

It's worth noting that although I try on my server to remove and unban servers that are dead and no longer active, not all the sources do the same so there may be some bloat in the unified lists that comes from dead servers.

## How Is My List Built

Read my [Guidlines for Defederation](https://writer.oliphant.social/oliphant/guidelines-for-defederation). That's how you end up on my list. Some of it comes from ancestral sources. Some of it is very subjective and may even be wrong and I will revisit the list. Make an issue above if you think you're on this list in error and I may remove it. 

## Advantages of being a Trusted Source

For one, you can point people to your own list for import when they start their own server. Because all of the sources are involved in the "Fedi Council" here, no one needs to accept *my* opinionated list alone anymore. I am but one voice among trusted sources, but we take the most lenient judgment (Silence vs Suspend, and None/Reject Media over Silence) when creating the final `_unified_blocklist.csv`.

None of the Trusted Sources are going to end up in the final unified mergelist, for obvious reasons. We'll leave defederations of my trusted sources (myself included) up to your own individual discretion.

### Trusted Sources:

#### Tier 0

Tier0 is base-level moderation, expected on the flagship servers and as part of the Mastodon Server Covenant.
  
  1. [Tier0] Mastodon.social
  1. [Tier0] Mastodon.online
  
#### Tier 1

Tier1 are servers that block somewhat aggressively (like mine).
  
  1. [Tier1] Oliphant.Social
  1. [Tier1] Union.Place
  
#### Tier 2

Tier2 are servers that block *very* aggressively.

  1. [Tier2] Mastodon.Art
  1. [Tier2] Toot.Wales
  1. [Tier2] Artisan.Chat

### Obfuscate Sucks for Trusted Servers

If you want to use Mastodon.social's blocklist, their obfuscate setting has made any domain with asterisks in it unimportable. None of the Oliphant.Social domains are obfuscated for that reason. If you're a Trusted Source, you're better off not obfuscating your blocked domains.

### The Algorithm:

All the trusted sources in Tier0 and Tier1 are pulled and updated regularly as a dry run, which generates the files (see Fediblockhole link above) and creates the `_unified_min_blocklist.csv` file. This file can be imported and is a merge of all of the trusted sources combined.

This **FediBlockHole** config file is set to use the `min` setting when it comes to creating the final merge file. This means that where there is a conflict between trusted sources, the *least* severe setting wins.

The `_unified_max_blocklist.csv` includes Tier0, 1 and 2 Trusted Sources and chooses the *most* restrictive option.

### This means your judgment affects the Tier1, Tier2 and unified min/max lists as well, doesn't it?

I want to be transparent about this.

Yes, it does. Under the most-lenient policy, if I dropped a Suspension to Silence or even None+RejectMedia, I could affect the overall "min" and tier1 and tier2 lists as well.

Of course, it would have no bearing on the max file, but if I was to Suspend a commonly-silenced domain, the *max* policy would apply the most restrictive to the *max* file, and my Suspend could thus weight everyone else's Silence to a Suspend in that file.

That's why the algorithm is transparent, and why you have a choice of what you want to download, and I'm very up front about my own subjective choices on my server.

But it does also mean if you get off my blocklist, you might get off the merge lists entirely, too, for those sites uniquely defederated by me.

I'm showing all my work here, you see the source files from various servers that drive the resulting merge files, and can easily discuss among yourselves what this means.

See me if you want to get off the Oliphant.Social blocklist, or if you have recommendations or nominations of other Trusted Sources. Those opt-ins need to come from the server admin.
