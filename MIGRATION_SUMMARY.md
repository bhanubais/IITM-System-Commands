Migration summary: Pocket Guide / backup integration

Date: 2026-05-27

Overview:
- Migrated high-value snippets from `zzz_backup` (Pocket Guide, Composite Notes, old-IITM, observations) into domain modules.
- Focus: practical, runnable examples and Real World Scenario notes; preserved Evi Nemeth technical tone and "NO EM-DASH" constraint.

Major changes (selected highlights):
- 01-core-essentials
  - Added `lscpu` and CPU model extraction example.
  - Added `last` and session-history examples.
  - Added `lshw` / `hwinfo` / `dmidecode` hardware-probing examples.
- 02-file-management
  - Added safe `ls -l | tr -s | cut` size-extraction example.
  - Added quick `chmod 755 s1.sh` and execute example.
- 03-package-management
  - Added `dpkg-query` formatted examples and `snap`/`docker` advisory.
  - Added LPG sandbox deployment note and `bash reset-lpg` safety guidance in `03.99`.
- 04-text-editors
  - Merged `Command_line_editors` quickrefs into canonical `04-text-editors` files (vi/nano/emacs/ed).
- 05-text-processing
  - Added `sed -n` selective printing examples, `paste` usage, `tee` duplication examples, `paste`+mkfifo notes, CSV parsing with `IFS`, `grep`/`egrep` practical examples, awk script usage, mapfile/readarray examples.
- 06-shell-environment
  - Added `disown -h` documentation and command-history tips.
- 07-shell-scripting
  - Added `mapfile`/`readarray` usage, quoting/escaping guide, here-strings/process-substitution notes, mkfifo fallback.
- 08-networking-and-web
  - Added `whois | less` example and documented `whois` usage.
- 09-version-control-git
  - No major code changes; history and git fundamentals remain.

Repository hygiene:
- Merged duplicate editor quickrefs under `04-text-editors` and removed redundant files from `Command_line_editors`.
- Updated root README and module READMEs to ensure links are discoverable from repository root.

Next steps recommended:
1. Final sweep of `zzz_backup` for any micro-snippets not yet migrated (we performed several sweeps already; remaining items appear duplicated).
2. Optionally archive or remove `zzz_backup` once satisfied to avoid duplication confusion.
3. Create small runnable example scripts (in `Example_Files/`) for `process substitution`, `here-strings`, `seq` padding, and `grep` pipelines to serve as verification artifacts.

If you want, I will now perform the final sweep and either migrate remaining unique items or produce an inventory of remaining backup-only snippets for your review.
