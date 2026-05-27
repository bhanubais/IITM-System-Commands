# 03. Package Management

Install software, verify payloads, and package filesystem trees.

## Command List

`apt`, `apt-get`, `apt-cache`, `dpkg`, `dpkg-query`, `sha256sum`, `md5sum`, `tar`, `gzip`, `bzip2`, `xz`, `zip`, `unzip`.

## File Map

* [03.01 Software Management](03.01-debian-software-governance.md)
* [03.02 Checksum Validation](03.02-checksum-validation.md)
* [03.03 Archival and Compression](03.03-archival-and-compression.md)
* [03.99 LPG Sandbox Deployment](03.99-lpg-sandbox-deployment.md)

## Exam Targets

* Separate repository package operations from local `.deb` operations.
* Validate checksum output.
* Build and extract archives with correct flags.

## Production Targets

* Audit installed packages.
* Verify downloaded binaries before execution.
* Package backup directories for transfer or retention.

