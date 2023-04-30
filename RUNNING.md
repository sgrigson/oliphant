# Running the Blocklists

1. Setup Fediblockhole
```bash
python3 -m pip install fediblockhole
```

2. Clone this Repo
```bash
mkdir /fediblockhole
cd /fediblockhole
git clone git@codeberg.org:oliphant/blocklists.git .
```

3. Execute
`./fedisync.sh`

That's it. Blocklists will be written to the `blocklists` folder.

You can use `local` and `secretconfig` as subfolders that aren't tracked by git to create your own versions of these scripts and config.

4. Optional
`./fedisync-push.sh`
This will sync up a specified blocklist (any blocklist you want) to a specified destination. This is not required to generate blocklists.

For more information on how to configure the push file, or a greater explanation of the fundamentals of this process, see [How to Sync up Blocklist Changes From Trusted Sources](https://writer.oliphant.social/oliphant/how-to-sync-up-blocklist-changes-from-trusted-sources).
