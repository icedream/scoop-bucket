# Icedream's Scoop Bucket

This repository contains the source files to generate Scoop-compatible packages
for the following software:

- Mixxx ([`mixxx`](src/mixxx) and [`mixxx-nightly`](src/mixxx-nightly))
- PuTTY ([`putty-snapshot`](src/putty-snapshot))
- Mumble ([`mumble`](src/mumble) and [`mumble-snapshot`](src/mumble-snapshot))

Later, this repository will be usable directly from Scoop as a bucket to install
software from.

## Building the bucket

In PowerShell on a Windows where WSL is available:

    & bin/regenerate.ps1

The package files will be placed in a new folder `bucket`.
