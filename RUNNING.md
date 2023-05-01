# Running the Blocklists

1. Setup Fediblockhole
```bash
python3 -m pip install fediblockhole
```

2. Clone this Repo
```bash
git clone https://codeberg.org/oliphant/blocklists.git /opt/fediblockhole
# optional: create folders for local scripts and secret config
# mkdir /opt/fediblockhole/local && mkdir /opt/fediblockhole/secretconfig
```

3. Execute
`/opt/fediblockhole/fedisync.sh`

That's it. Blocklists will be written to the `blocklists` folder.

You can use `local` and `secretconfig` as subfolders that aren't tracked by git to create your own versions of these scripts and config.

4. Optional
`./fedisync-push.sh`
This will sync up a specified blocklist (any blocklist you want) to a specified destination. This is not required to generate blocklists.

For more information on how to configure the push file, or a greater explanation of the fundamentals of this process, see [How to Sync up Blocklist Changes From Trusted Sources](https://writer.oliphant.social/oliphant/how-to-sync-up-blocklist-changes-from-trusted-sources).


---

## Configuration

The list of blocklist sources can be found in the [/config/pull.conf.toml](src/branch/main/config/pull.conf.toml).

These initial sources are pulled down, with each of them being saved as an intermediate file.

The `fedisync.sh` script renames each of these source lists to a more friendly name (like mastodon.social.csv)

The remaining steps are performed on these sourcefiles, not pulled from urls.

If you customize the list of sources in `pull.conf.toml` you should also update them in the various `config/*.conf.toml` files as needed.

You will likely also need to customize the `fedisync.sh` to your needs as well if you make these changes.

## Pushing to Your Own Server
If you want to push these blocks to your own server, that's an option, too.

An example of this is in `fedisync-push.sh`. You can copy it to `/local/fedisync-push.sh` and modify it. If you want to push to a git repo, that references `fedisync-git.sh`. If you want to automatically sync a merged or list to your own server, the `fedisync-example-server.sh` script should be modified for your use.

You will need a [very permissive API key](https://writer.oliphant.social/oliphant/how-to-sync-up-blocklist-changes-from-trusted-sources#generate-an-admin-api-token) created for your server to allow the push script to talk to it.

By default, this is configured to downgrade any suspensions to silence while there are follow relationships on your server against a given block.

Note that `fedisync-push.sh` won't push to any servers at all until you update the API key and the configuration for it.
