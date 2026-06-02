# 00. Command Index

Fast lookup table.

Use it to jump from a command to its governing file.

## Core System

| Command | File | Primary Use | Risk Note |
|---|---|---|---|
| `winget` | [01.01](01-core-essentials/01.01-windows-host-preparation.md) | Windows package install and upgrade | Confirm package identity before install. |
| `wsl` | [01.02](01-core-essentials/01.02-wsl-initialization.md) | WSL lifecycle control | Distribution state affects all Linux exercises. |
| `uname` | [01.05](01-core-essentials/01.05-hardware-audit-and-reconnaissance.md) | Kernel and platform audit | Use with `-a` for full context. |
| `hostnamectl` | [01.05](01-core-essentials/01.05-hardware-audit-and-reconnaissance.md) | Host identity audit | Useful before remote work. |
| `man` | [01.06](01-core-essentials/01.06-manuals-and-system-help.md) | Manual lookup | Section numbers matter. |
| `date` | [01.07](01-core-essentials/01.07-system-time-and-scheduling.md) | Time inspection | Time drift breaks logs and certificates. |

## Files

| Command | File | Primary Use | Risk Note |
|---|---|---|---|
| `pwd`, `cd`, `mkdir`, `rmdir` | [02.01](02-file-management/02.01-directory-governance.md) | Directory navigation and creation | Path mistakes cause wrong-target writes. |
| `touch`, `cp`, `mv`, `rm` | [02.02](02-file-management/02.02-file-operations.md) | File state changes | `rm` is destructive. Verify target first. |
| `chmod`, `chown`, `chgrp` | [02.03](02-file-management/02.03-permissions-and-ownership.md) | Access control | Recursive changes can break services. |
| `ln` | [02.04](02-file-management/02.04-link-architecture-hard-and-soft.md) | Hard and symbolic links | Hard links share inode data. |
| `find`, `locate`, `file` | [02.05](02-file-management/02.05-diagnostics-and-search.md) | Search and diagnostics | Quote patterns. Prefer safe predicates. |

## Packages and Archives

| Command | File | Primary Use | Risk Note |
|---|---|---|---|
| `apt`, `apt-get`, `dpkg` | [03.01](03-package-management/03.01-debian-software-governance.md) | Debian package governance | Update package index before install. |
| `sha256sum`, `md5sum` | [03.02](03-package-management/03.02-checksum-validation.md) | Integrity validation | Prefer SHA-256 for modern verification. |
| `tar`, `gzip`, `bzip2`, `xz`, `zip` | [03.03](03-package-management/03.03-archival-and-compression.md) | Archive and compression work | Test extraction paths before restore. |

## Text

| Command | File | Primary Use | Risk Note |
|---|---|---|---|
| `cat`, `less`, `head`, `tail` | [05.01](05-text-processing/05.01-stream-viewing-commands.md) | Stream viewing | Use pagers for large files. |
| `grep`, `egrep` | [05.03](05-text-processing/05.03-grep-search.md) | Search text streams | Basic and extended regex differ. |
| `sed` | [05.04](05-text-processing/05.04-sed-stream-editor.md) | Stream editing | Dry run before in-place edits. |
| `awk` | [05.05](05-text-processing/05.05-awk-processing.md) | Field processing | Set the correct delimiter. |
| `cut`, `wc`, `tr`, `seq` | [05.06](05-text-processing/05.06-stream-filters.md) | Small stream filters | Locale can affect character counts. |
| `sort`, `uniq` | [05.07](05-text-processing/05.07-sort-uniq-and-ranking.md) | Ranking and de-duplication | `uniq` needs adjacent duplicates. |
| `paste`, `tee`, `xargs` | [05.08](05-text-processing/05.08-paste-tee-xargs-and-delimited-data.md) | Stream joining and fan-out | Use null delimiters for unsafe filenames. |

## Shell and Git

| Command | File | Primary Use | Risk Note |
|---|---|---|---|
| `jobs`, `fg`, `bg`, `kill`, `ps` | [06.02](06-shell-environment/06.02-job-control-and-processes.md) | Process control | Confirm PID before signal. |
| `tmux` | [06.03](06-shell-environment/06.03-tmux-multiplexing.md) | Persistent terminal sessions | Name sessions for operations work. |
| `alias`, `history` | [06.05](06-shell-environment/06.05-aliases-and-history.md) | Shell convenience and recall | Do not hide dangerous behavior. |
| `read`, `printf`, `declare` | [07.01](07-shell-scripting/07.01-variables-input-and-output.md) | Script input and variables | Quote expansions by default. |
| `test`, `expr`, `bc` | [07.02](07-shell-scripting/07.02-arithmetic-and-logic-evaluation.md) | Logic and arithmetic | Check exit status. |
| `if`, `case`, `for`, `while` | [07.03](07-shell-scripting/07.03-control-structures.md) | Flow control | Quote loop inputs. |
| `>`, `>>`, `2>`, `&>`, `$()` | [07.04](07-shell-scripting/07.04-command-redirection-and-substitution.md) | Redirection and substitution | Separate stdout and stderr deliberately. |
| `<<`, `<<<`, `<(...)`, `>(...)` | [07.07](07-shell-scripting/07.07-heredocs-here-strings-and-process-substitution.md) | Bulk input and virtual streams | Not every construct is POSIX. |
| `curl`, `wget` | [08.02](08-networking-and-web/08.02-web-payloads.md) | HTTP payload access | Validate destination and TLS behavior. |
| `git` | [09.01](09-version-control-git/09.01-git-fundamentals.md) | Version control | Inspect state before destructive repair. |

