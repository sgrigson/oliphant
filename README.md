# Oliphant.Social Shared Blocklist Files

New and improved thanks to the excellent [Fediblockhole](https://github.com/eigenmagic/fediblockhole).

## How are Unified Blocklists Built

I, ([Oliphant@oliphant.social](https://oliphant.social/@oliphant), curate a list of trusted sources, including my own server. These can be public or private lists, but a server can opt-in to being one of the Trusted Sources. So long as they aren't already a defederated server and are trusted by others on the Trusted Sources list, they become a member and provide either their public list, or a `read:blocks` api key for Oliphant.Social to use.

Everything is checked against Mastodon.Social and Mastodon.Online, as the 'flagship servers' we might as well give them a vote as well in defederation of the final unified list. (at least for now.) Hopefully Gargron won't mind too much me pulling from their public api of defederation to represent the voice of the Mastodon Server Covenant from a pretty canonical source.

## How Is My List Built

Read my [Guidlines for Defederation](https://writer.oliphant.social/oliphant/guidelines-for-defederation). That's how you end up on my list. Some of it comes from ancestral sources. Some of it is very subjective and may even be wrong and I will revisit the list. Make an issue above if you think you're on this list in error and I may remove it. 

## Advantages of being a Trusted Source

For one, you can point people to your own list for import when they start their own server. Because all of the sources are involved in the "Fedi Council" here, no one needs to accept *my* opinionated list alone anymore. I am but one voice among trusted sources, but we take the most lenient judgment (Silence vs Suspend, and None/Reject Media over Silence) when creating the final `_unified_blocklist.csv`.

None of the Trusted Sources are going to end up in the final unified mergelist, for obvious reasons. We'll leave defederations of my trusted sources (myself included) up to your own individual discretion.

### Trusted Sources:
  1. Mastodon.social
  1. Oliphant.Social
  1. More to Come
  
### The Algorithm:

All the trusted sources are pulled and updated regularly as a dry run, which generates the files (see Fediblockhole link above) and creates the `_unified_blocklist.csv` file. This file can be imported and is a merge of all of the trusted sources combined.

This **FediBlockHole** config is set to use the `min` setting when it comes to creating the final merge file. This means that where there is a conflict between trusted sources, the *least* severe setting wins.

## More to come
